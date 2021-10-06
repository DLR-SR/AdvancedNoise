within AdvancedNoise.Interpolators.SmoothIdealLowPass;
function der_kernel_offset
  extends Modelica.Icons.Function;
  input Real t "The (scaled) time for sampling period=1";
  input Modelica.Units.SI.Frequency f=1/2 "The cut-off frequency of the filter";
  output Real h "The impulse response of the convolution filter";
protected
  function d = der(kernel, t);
algorithm
  h := d(t,f);
annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
der_h = SmoothIdealLowPass.<strong>der_kernel_offset</strong>(offset);
</pre></blockquote>

<h4>Description</h4>
<p>
This function defines the derivative of the <a href=\"kernel\">kernel</a>
of the <a href=\"SmoothIdealLowPass\">SmoothIdealLowPass</a>
interpolation with respect to its input argument offset.
This function is used for determining the derivative of the interpolated signal.
</p>
</html>",
        revisions="<html>
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
            <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));
end der_kernel_offset;
