within Modelica_Noise.Math.TruncatedDistributions.Normal;
function cumulative
  "Cumulative distribution function of truncated normal distribution"
  import Modelica_Noise.Math.Distributions.Normal;
  extends
    Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialCumulative;
  input Real mu= (u_max + u_min)/2
    "Expectation (mean) value of the normal distribution" annotation(Dialog);
  input Real sigma=(u_max - u_min)/6
    "Standard deviation of the normal distribution"                                  annotation(Dialog);
protected
  Real cdf;
  Real cdf_min;
  Real cdf_max;
algorithm
  if u <= u_min then
     y := 0;
  elseif u < u_max then
     cdf     :=Normal.cumulative(u, mu, sigma);
     cdf_min :=Normal.cumulative(u_min, mu, sigma);
     cdf_max :=Normal.cumulative(u_max, mu, sigma);
     y := (cdf - cdf_min) / max(cdf_max - cdf_min, 10*Modelica.Constants.eps);
  else
     y := 1;
  end if;

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Normal.<b>cumulative</b>(u, u_min=0, u_max=1, mu=0, sigma=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the cumulative distribution function according to a
<b>truncated normal</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
mean value of original distribution <b>mu</b> and 
standard deviation of original distribution <b>sigma</b> (variance = sigma<sup>2</sup>).
The returned value y is in the range:
</p>

<p><blockquote>
0 &le; y &le; 1
</blockquote></p>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.cumulative.png\">
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
  cumulative(0.5)                 // = 0.5
  cumulative(0.5,-1.5,1.5,1,0.9)  // = 0.4046868865634537
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Normal.density\">Normal.density</a>,
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Normal.quantile\">Normal.quantile</a>.
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
