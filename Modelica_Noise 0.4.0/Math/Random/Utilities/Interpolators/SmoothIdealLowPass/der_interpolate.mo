within Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass;
function der_interpolate "Interpolates the buffer using a replaceable kernel"
  extends Modelica.Icons.Function;
  input Real buffer[:] "Buffer of random numbers";
  input Real offset "Offset from buffer start (0..size(buffer)-1";
  input Real der_buffer[size(buffer,1)] "Derivatives of buffer values";
  input Real der_offset "Derivative of offset value";
  output Real der_y "Interpolated value at position offset";
algorithm
  // For a general kernel based interpolation:
  // y   = sum( (K(-o)   * b[i])  )
  // y'  = sum( (K(-o)   * b[i])' )
  //     = sum(  K(-o)'  * b[i]        + K(o) * b[i]' )
  //     = sum( -dK/do*o'* b[i]        + K(o) * b[i]' )
  //     = sum( -dK/do   * b[i] ) * o'
  //     + sum(                          K(o) * b[i]' )

  // Initialize the convolution algorithm
  der_y   := 0;

  // Calculate weighted sum over -nPast...nFuture random samples
  for i in -nPast:nFuture loop
    der_y := der_y + der_kernel_offset(t=mod(offset,1)-i) *     buffer[integer(offset)+i+1] * der_offset
                   +     kernel(       t=mod(offset,1)-i) * der_buffer[integer(offset)+i+1];
  end for;
end der_interpolate;
