within Modelica_Noise.Math.Random.Utilities.Interpolators;
package SmoothIdealLowPass "Smooth interpolation (with sinc function)"
  extends Random.Utilities.Interfaces.PartialInterpolator(
                                                final continuous=true,
                                                final nFuture=n-1,
                                                final nPast=n,
                                                final varianceFactor = 0.979776342307764);
  constant Integer n = 5 "Number of support points for convolution";


  redeclare function extends interpolate
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
      coefficient        :=     kernel(t=mod(    offset,1)-i);

      // We use the kernel in +i direction for the random samples
      // The +1 accounts for one-based indizes
      y                  := y + buffer[  integer(offset)  +i+1]*coefficient;

      //  Modelica.Utilities.Streams.print("i=" + String(i) + ", "
      //                                  +"t=" + String(mod(offset,1)+i) + ", "
      //                                  +"k=" + String(coefficient)+ ", "
      //                                  +"o=" + String(offset)+ ", "
      //                                  +"n=" + String(integer(offset)+i));
    end for;
    annotation(Inline=true,
               derivative(order=1) = der_interpolate);
  end interpolate;


  function kernel "Kernel for ideal low pass (sinc-function)"
    import Modelica_Noise.Math.Special.sinc;
    import Modelica.Constants.pi;
    input Real t "The (scaled) time for sampling period=1";
    input Modelica.SIunits.Frequency f=1/2
    "The cut-off frequency of the filter";
    output Real h "The impulse response of the convolution filter";
  algorithm
    h := 2*f*sinc(2*pi*f*t);
    annotation(Inline=true);
  end kernel;


  function der_kernel_offset
    input Real t "The (scaled) time for sampling period=1";
    input Modelica.SIunits.Frequency f=1/2
    "The cut-off frequency of the filter";
    output Real h "The impulse response of the convolution filter";
protected
    function d = der(kernel, t);
  algorithm
    h := d(t,f);
  end der_kernel_offset;


  annotation (Documentation(info=
                             "<html>
<p>
For details of the xorshift64* algorithm see 
<a href=\"http://xorshift.di.unimi.it/\">http://xorshift.di.unimi.it/</a> .
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={Line(
      points={{-90,-50},{-22,-50},{6,44},{88,44}},
      color={0,0,0},
      smooth=Smooth.Bezier)}));
end SmoothIdealLowPass;
