within Modelica_Noise.Math.Distributions.Uniform;
function quantile "Quantile of uniform distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialQuantile;
  input Real y_min=0 "Lower limit of y" annotation (Dialog);
  input Real y_max=1 "Upper limit of y" annotation (Dialog);
algorithm
  y := u*(y_max - y_min) + y_min;
  annotation (Inline=true,Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Uniform.<b>quantile</b>(u, y_min=0, y_max=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the inverse cumulative distribution function (= quantile) according to a <b>uniform</b
distribution in a band. Input argument u must be in the range:
</p>

<blockquote>
<p>
0 &le; u &le; 1
</p>
</blockquote>

<p>
The returned number y is in the range:
</p>

<blockquote>
<p>
y_min &le; y &le; y_max
</p>
</blockquote>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Uniform.quantile.png\">
</blockquote></p>

<p>
For more details, see 
<a href=\"http://en.wikipedia.org/wiki/Uniform_distribution_(continuous)\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  quantile(0.5)      // = 0.5
  quantile(0.5,-1,1) // = 0
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.density\">Uniform.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.cumulative\">Uniform.cumulative</a>.
</p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end quantile;
