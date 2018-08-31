within AdvancedNoise.Interpolators.Linear;
function der_interpolate
  extends Modelica.Icons.Function;
  input Real buffer[:] "Buffer of random numbers";
  input Real offset "Offset from buffer start (0..size(buffer)-1";
  input Real samplePeriod = 1 "The sample period of the noise buffer";
  input Real der_buffer[size(buffer,1)] "Derivatives of buffer values";
  input Real der_offset "Derivative of offset value";
  input Real der_samplePeriod "Derivative of samplePeriod (unused)";
  output Real der_y "Interpolated value at position offset";
protected
  Integer ind "Index of buffer element just before offset";
  Real der_y1 "Value of buffer element just before offset";
  Real der_y2 "Value of buffer element just after offset";
  Integer nBuffer = size(buffer,1);
algorithm
  // For a general kernel based interpolation:
  // y   = sum( (K(-o)   * b[i])  )
  // y'  = sum( (K(-o)   * b[i])' )
  //     = sum(  K(-o)'  * b[i]        + K(o) * b[i]' )
  //     = sum( -dK/do*o'* b[i]        + K(o) * b[i]' )
  //     = sum( -dK/do   * b[i] ) * o'
  //     + sum(                          K(o) * b[i]' )

  // We need to interpolate only between two values
  if offset >= nBuffer - nFuture and offset <= (1+1e-6)*(nBuffer - nFuture) then
     ind :=nBuffer - 1;
  else
     assert(offset >= nPast and offset < nBuffer - nFuture,
            "offset out of range (offset=" + String(offset) + ", nBuffer="+String(nBuffer)+")");
     ind := integer(offset) + 1;
  end if;
  der_y1 := der_buffer[ind];
  der_y2 := der_buffer[ind+1];
  der_y := (buffer[ind+1] - buffer[ind]) * der_offset
         +  der_y1 + (der_y2-der_y1)*(offset-ind+1);
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
der_y = Linear.der_<b>interpolate</b>(buffer,offset,der_buffer,der_offset);
</pre></blockquote>

<h4>Description</h4>
<p>
Determine the derivative of a signal interpolated linearly in
a buffer (see <a href=\"interpolate\">interpolate</a>).
Input argument offset is a Real number marking the point at which
interpolation shall take place.
Input arguments der_buffer and der_offset are the derivatives of
the input arguments buffer and offset.
This function is used as derivative of the <a href=\"interpolate\">interpolate</a>
function. Please see the description there for an introduction to
the interpolation method used and specific remerks in the buffer and offset values.
</p>
</html>", revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th align=\"left\">Description</th>
  </tr>
  <tr>
    <td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\">
      <table border=\"0\">
        <tr>
          <td valign=\"top\">
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));
end der_interpolate;
