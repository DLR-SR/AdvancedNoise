within Modelica_Noise.Math.Distributions.Normal;
function cumulative "Cumulative distribution function of normal distribution"
  import Modelica_Noise.Math.Special;
  extends Modelica_Noise.Math.Distributions.Interfaces.partialCumulative;
  input Real mu=0 "Expectation (mean) value of the normal distribution" annotation(Dialog);
  input Real sigma=1 "Standard deviation of the normal distribution" annotation(Dialog);
algorithm
  y :=(1 + Special.erf((u - mu)/(sigma*sqrt(2))))/2;

  annotation (Inline=true,Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Normal.<b>cumulative</b>(u, mu=0, sigma=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the cumulative distribution function according to a <b>normal</b> distribution 
with mean value <b>mu</b> and standard deviation <b>sigma</b> (variance = sigma<sup>2</sup>).
The returned value y is in the range:
</p>

<p><blockquote>
0 &le; y &le; 1
</blockquote></p>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Normal.cumulative.png\">
</blockquote></p>

<p>
For more details, see 
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  cumulative(0.5)      // = 0.6914624612740131
  cumulative(0,1,0.5)  // = 0.15865525393145707
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Normal.density\">Normal.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Normal.quantile\">Normal.quantile</a>.
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
end cumulative;
