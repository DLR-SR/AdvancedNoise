within Modelica_Noise.Math.TruncatedDistributions.Normal;
function quantile "Quantile of truncated normal distribution"
  import Modelica_Noise.Math.Distributions.Normal;
  extends Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialQuantile;
  input Real mu= (y_max + y_min)/2
    "Expectation (mean) value of the normal distribution" annotation(Dialog);
  input Real sigma=(y_max - y_min)/6
    "Standard deviation of the normal distribution"                                  annotation(Dialog);
protected
  Real cdf_min = Normal.cumulative(y_min, mu, sigma);
  Real cdf_max = Normal.cumulative(y_max, mu, sigma);
algorithm
  y := Normal.quantile(cdf_min + u*(cdf_max-cdf_min), mu=mu, sigma=sigma);

  /* Close to u=0 and u=1, large errors in the numerical computation can
   occur. The following statement is a guard to still keep the property
     that y is within y_min/y_max
  */
  y := min(y_max,max(y_min,y));

  annotation (smoothOrder = 1,Documentation(info="<html>
<p>
<h4>Syntax</h4>
<blockquote><pre>
Normal.<b>quantile</b>(u, y_min=0, y_max=1, mu=0, sigma=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the inverse cumulative distribution function (= quantile) according to a
<b>truncated normal</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
mean value of original distribution <b>mu</b> and 
standard deviation of original distribution <b>sigma</b> (variance = sigma<sup>2</sup>).
Input argument u must be in the range:
</p>

<blockquote>
<p>
0 &lt; u &lt; 1
</p>
</blockquote>

<p>
Output argument y is in the range:
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
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.quantile.png\">
</blockquote></p>

<p>
For more details<br>
of the normal distribution, see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre> 
  quantile(0.001)           // = 0.001087357613043849;
  quantile(0.5,0,1,0.5,0.9) // = 0.5
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Normal.density\">Normal.density</a>,
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Normal.cumulative\">Normal.cumulative</a>.
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
