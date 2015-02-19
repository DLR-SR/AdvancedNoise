within Modelica_Noise.Math.Distributions.Normal;
function quantile "Quantile of normal distribution"
  import Modelica_Noise.Math.Special;
  extends Modelica_Noise.Math.Distributions.Interfaces.partialQuantile;
  input Real mu=0 "Expectation (mean) value of the normal distribution" annotation(Dialog);
  input Real sigma=1 "Standard deviation of the normal distribution" annotation(Dialog);
algorithm
  y :=mu + sigma*sqrt(2)*Special.erfInv(2*u-1);

  annotation (Inline=true, Documentation(info="<html>
<p>
<h4>Syntax</h4>
<blockquote><pre>
Normal.<b>quantile</b>(u, y_min=0, y_max=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the inverse cumulative distribution function (= quantile) according to a <b>normal</b> distribution
with mean value <b>mu</b> and standard deviation <b>sigma</b> (variance = sigma<sup>2</sup>).
Input argument u must be in the range:
</p>

<blockquote>
<p>
0 &lt; u &lt; 1
</p>
</blockquote>

<p>
If the input argument u is a uniformly distributed random number, then
99.7 % of the returned random numbers are in the range:
</p>

<blockquote>
<p>
mu-3*sigma &le; y &le; mu+3*sigma
</p>
</blockquote>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Normal.quantile.png\">
</blockquote></p>

<p>
For more details, see 
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre> 
  quantile(0.001)     // = -3.090232306167813;
  quantile(0.5,1,0.5) // = 1
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Normal.density\">Normal.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Normal.cumulative\">Normal.cumulative</a>.
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
