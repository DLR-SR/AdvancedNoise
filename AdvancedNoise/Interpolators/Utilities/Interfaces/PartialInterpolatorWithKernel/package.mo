within AdvancedNoise.Interpolators.Utilities.Interfaces;
partial package PartialInterpolatorWithKernel "Generic interpolator interface providing a kernel function"
  extends PartialInterpolator;

  constant Real suggestedSamplePeriod = 0
    "The appropriate sample period for this filter";


  redeclare replaceable function extends interpolate
    "Interpolates the buffer using a replaceable kernel"
protected
    Real coefficient "The intermediate container for the kernel evaluations";
  algorithm
    // Ensure that offset is in assumed range
    assert(offset >= nPast and offset < nBuffer - nFuture,
           "offset out of range (offset=" + String(offset) + ", nBuffer="+String(nBuffer)+")");

    // Initialize the convolution algorithm
    y       := 0;

    // What is convolution?!
    //
    // We always carry a kernel function along with our time.
    // That means, that the kernel's central point kernel(0) always occurs at
    // the current time point!
    // Since we are working with an offset instead of the time directly,
    // the kernel's central point must occur at the current offset.
    //
    // See the following diagram:
    // (In our offset space, assume that dt=1 and t=offset.)
    //
    //                               t-2dt     t      t+2dt
    //                         + - + - + - + - + - + - + - + - + -> simulation time
    //                           t-3dt   t-1dt   t+1dt   t+3dt
    //                                         |
    //
    //                      1 -|               ^    kernel(delta_t)
    //                         |              / \
    //                         |     _       /   \       _
    //                         |  -3/ \-2 -1/  0  \1   2/ \3
    //                      0 -+ - + - + - + - + - + - + - + - + -> phase
    //                         |  |   | \ /   |   | \ /   |
    //                         |         V           V
    //             delta_t/dt <>
    //                        |
    // Now, we have some random samples, which are given at discrete points.
    // In our offset coordinates, these are given at integer offset values.
    //                        |
    //                        |   |   |   |   |   |   |   |   dt
    //                        |                              /
    //                        +   +   +   +   +   +   +   +<->+     offset
    //                           -3  -2  -1   0   1   2   3
    //
    // states_in _________________^___^___^___^___^___^___^
    //              iterations
    //               until -n       +1  +1  +1  +1  +1  +1
    //
    // Convolution: filter = sum( signal(time) * Kernel(phase*pi) )
    //              time   = sample + instance
    //              phase  = sample - delta_t/dt
    //              sample = -2 .. 3
    //
    // Loop over 2n support points for the convolution = sum( random(i)*kernel(offset-i) )
    // The random number is for time =     (floor(t/dt) * dt + i * dt)
    // The kernel result is for time = t - (floor(t/dt) * dt + i * dt)
    // or, if sampled:          time = t - (    t_last       + i * dt)

    // Calculate weighted sum over -nPast...nFuture random samples
    for i in -nPast:nFuture loop

      // We use the kernel in -i direction to enable step response kernels
      coefficient        := - kernel(t=(mod(    offset,1)-i-1)*samplePeriod)
                            + kernel(t=(mod(    offset,1)-i+0)*samplePeriod);

      // We use the kernel in +i direction for the random samples
      // The +1 accounts for one-based indizes
      y                  := y + buffer[  integer(offset)  +i+1]*coefficient;

      //  Modelica.Utilities.Streams.print("i=" + String(i) + ", "
      //                                  +"t=" + String(mod(offset,1)+i) + ", "
      //                                  +"k=" + String(coefficient)+ ", "
      //                                  +"o=" + String(offset)+ ", "
      //                                  +"n=" + String(integer(offset)+i));
    end for;
    annotation(derivative(order=1) = der_interpolate, Inline=true);
  end interpolate;


  replaceable function der_interpolate
  "Interpolates the buffer using a replaceable kernel"
    extends Modelica.Icons.Function;
    input Real buffer[:] "Buffer of random numbers";
    input Real offset "Offset from buffer start (0..size(buffer)-1";
    input Real samplePeriod = 1 "The sample period of the noise buffer";
    input Real der_buffer[size(buffer,1)] "Derivatives of buffer values";
    input Real der_offset "Derivative of offset value";
    input Real der_samplePeriod = 1 "The sample period of the noise buffer";
    output Real der_y "Interpolated value at position offset";
  algorithm
    // For a general kernel based interpolation:
    // y   = sum( (DK(-o*s)   * b[i])  )
    // y'  = sum( (DK(-o*s)   * b[i])' )
    //     = sum(  DK(-o*s)'  * b[i]          + DK(-o*s) * b[i]' )
    //     = sum( -dDK/do*o'*s* b[i]          + DK(-o*s) * b[i]' )
    //     = sum( -dDK/do     * b[i] ) * o'*s
    //     + sum(                               DK(-o*s) * b[i]' )

    // Initialize the convolution algorithm
    der_y   := 0;

    // Calculate weighted sum over -nPast...nFuture random samples
    for i in -nPast:nFuture loop
      der_y := der_y + ( - der_kernel_offset(t=(mod(offset,1)-i-1)*samplePeriod)
                         + der_kernel_offset(t=(mod(offset,1)-i+0)*samplePeriod))  *     buffer[integer(offset)+i+1] * der_offset*samplePeriod
                     + ( -     kernel(       t=(mod(offset,1)-i-1)*samplePeriod)
                         +     kernel(       t=(mod(offset,1)-i+0)*samplePeriod))  * der_buffer[integer(offset)+i+1];
    end for;
  end der_interpolate;


  replaceable partial function kernel "Kernel for interpolation"
    extends partialKernel;
  end kernel;


  replaceable partial function der_kernel_offset
    "Partial derivative of the kernel with respect to the offset"
    extends partialKernel;
  end der_kernel_offset;


  annotation (
    Documentation(
      info="<html>
<p>
For details of the xorshift64* algorithm see
<a href=\"http://xorshift.di.unimi.it/\">http://xorshift.di.unimi.it/</a> .
</p>
</html>"));
end PartialInterpolatorWithKernel;
