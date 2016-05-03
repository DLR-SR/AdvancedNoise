within Modelica_Noise.Math.Distributions.Normal;
function density "Density of normal distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialDensity;
  input Real mu=0 "Expectation (mean) value of the normal distribution" annotation(Dialog);
  input Real sigma=1 "Standard deviation of the normal distribution" annotation(Dialog);
algorithm
  y := exp(-(u-mu)^2/(2*sigma^2))/(sigma*sqrt(2*Modelica.Constants.pi));

  annotation (Inline=true, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Normal.<b>density</b>(u, mu=0, sigma=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the probability density function according to a <b>normal</b> distribution
with mean value <b>mu</b> and standard deviation <b>sigma</b> (variance = sigma<sup>2</sup>).
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Normal.density.png\">
</blockquote></p>

<p>
For more details, see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  density(0.5)     // = 0.3520653267642995
  density(3,1,0.5) // = 0.00026766045152977074
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Normal.cumulative\">Normal.cumulative</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Normal.quantile\">Normal.quantile</a>.
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
end density;
