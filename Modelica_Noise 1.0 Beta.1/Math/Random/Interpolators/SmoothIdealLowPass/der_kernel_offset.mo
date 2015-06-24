within Modelica_Noise.Math.Random.Interpolators.SmoothIdealLowPass;
function der_kernel_offset
  input Real t "The (scaled) time for sampling period=1";
  input Modelica.SIunits.Frequency f=1/2 "The cut-off frequency of the filter";
  output Real h "The impulse response of the convolution filter";
protected
  function d = der(kernel, t);
algorithm
  h := d(t,f);
annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><code>der_h = SmoothIdealLowPass.<b>der_kernel_offset</b>(offset); </code></blockquote>
<h4>Description</h4>
<p>This function defines the derivative of the <a href=\"kernel\">kernel</a> of the <a href=\"SmoothIdealLowPass\">SmoothIdealLowPass</a> interpolation with respect to its input argument offset. This function is used for determining the derivative of the interpolated signal.</p>
</html>",
        revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> June 22, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end der_kernel_offset;
