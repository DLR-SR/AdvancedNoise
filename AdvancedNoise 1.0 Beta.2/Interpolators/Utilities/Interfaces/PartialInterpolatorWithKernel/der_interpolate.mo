within AdvancedNoise.Interpolators.Utilities.Interfaces.PartialInterpolatorWithKernel;
function der_interpolate "Interpolates the buffer using a replaceable kernel"
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
