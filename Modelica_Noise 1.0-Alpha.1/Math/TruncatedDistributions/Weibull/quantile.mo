within Modelica_Noise.Math.TruncatedDistributions.Weibull;
function quantile "Quantile of truncated Weibull distribution"
  import Modelica_Noise.Math.Distributions.Weibull;
  extends Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialQuantile;
  input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
  input Real k(min=0) = 1 "Shape parameter of the Weibull distribution" annotation(Dialog);
protected
  Real cdf_min = Weibull.cumulative(y_min, lambda=lambda, k=k)
    "Value of cdf at y_min";
  Real cdf_max = Weibull.cumulative(y_max, lambda=lambda, k=k)
    "Value of cdf at y_max";
algorithm
  y := Weibull.quantile(cdf_min + u*(cdf_max-cdf_min), lambda=lambda,k=k);

  /* Close to u=1, large errors in the numerical computation can
   occur. The following statement is a guard to still keep the property
   that y is within y_min .. y_max
  */
  y := min(y_max,max(y_min,y));

  annotation (smoothOrder=1,Documentation(info="<html>
<p>
<h4>Syntax</h4>
<blockquote><pre>
Weibull.<b>quantile</b>(u, y_min=0, y_max=1, lambda=1, k=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the inverse cumulative distribution function (= quantile) according to a
<b>truncated Weibull</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
scale parameter of original distribution <b>lambda</b> and
shape parameter of original distribution <b>k</b>.
Input argument u must be in the range:
</p>

<blockquote>
<p>
0 &le; u &le; 1
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
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Weibull.quantile.png\">
</blockquote></p>

<p>
For more details<br>
of the Weibull distribution, see
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre> 
  quantile(0.001)           // = 0.0006323204312624211;
  quantile(0.5,0,1,0.5,0.9) // = 0.256951787882498
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Weibull.density\">Weibull.density</a>,
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Weibull.cumulative\">Weibull.cumulative</a>.
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
