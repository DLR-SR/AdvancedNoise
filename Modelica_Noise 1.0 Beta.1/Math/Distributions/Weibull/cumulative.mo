within Modelica_Noise.Math.Distributions.Weibull;
function cumulative "Cumulative distribution function of Weibull distribution"
  import Modelica_Noise.Math.Special;
  extends Modelica_Noise.Math.Distributions.Interfaces.partialCumulative;
  input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
  input Real k(min=0) "Shape parameter of the Weibull distribution" annotation(Dialog);
algorithm
  y := if u >= 0 then 1 - exp(-(u/lambda)^k) else 0.0;

  annotation (Inline=true,Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Weibull.<b>cumulative</b>(u, lambda=1, k=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the cumulative distribution function 
according to a <b>Weibull</b> distribution
with scale parameter <b>lambda</b> and shape parameter <b>k</b>. Equation:
</p>

<blockquote><pre>
y := if u >= 0 then 1 - exp(-(u/lambda)^k) else 0.0;
</pre></blockquote>

<p>
The returned value y is in the range:
</p>

<p><blockquote>
0 &le; y &le; 1
</blockquote></p>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Weibull.cumulative.png\">
</blockquote></p>

<p>
For more details, see 
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  cumulative(0.5)       // = 0.3934693402873666
  cumulative(0.5,0.5,1) // = 0.6321205588285577
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Weibull.density\">Weibull.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Weibull.quantile\">Weibull.quantile</a>.
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
end cumulative;
