within Modelica_Noise.Math.Distributions.Weibull;
function quantile "Quantile of Weibull distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialQuantile;
  input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
  input Real k(min=0) "Shape parameter of the Weibull distribution" annotation(Dialog);
algorithm
  y := lambda * (-log( 1-u)) ^(1/k);

  annotation (Inline=true, Documentation(info="<html>
<p>
<h4>Syntax</h4>
<blockquote><pre>
Weibull.<b>quantile</b>(u, lambda=1, k=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the inverse cumulative distribution function (= quantile) according to a <b>Weibull</b> distribution
with scale parameter <b>lambda</b> and shape parameter <b>k</b>. Equation:
</p>

<blockquote><pre>
y := lambda * (-log( 1-u)) ^(1/k);
</pre></blockquote>
</p>

<p>
Input argument u must be in the range:
</p>
<blockquote>
<p>
0 &le; u &lt; 1
</p>
</blockquote>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Weibull.quantile.png\">
</blockquote></p>

<p>
For more details, see
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  quantile(0)         // = 0
  quantile(0.5,1,0.5) // = 0.41627730557884884
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Weibull.density\">Weibull.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Weibull.cumulative\">Weibull.cumulative</a>.
</p>
</html>", revisions="<html>
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
end quantile;
