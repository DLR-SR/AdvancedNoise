within Modelica_Noise.Math.TruncatedDistributions.Weibull;
function cumulative
  "Cumulative distribution function of truncated Weibull distribution"
  import Modelica_Noise.Math.Distributions.Weibull;
  extends
    Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialCumulative;
  input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
  input Real k(min=0) = 1 "Shape parameter of the Weibull distribution" annotation(Dialog);
protected
  Real cdf;
  Real cdf_min;
  Real cdf_max;
algorithm
  if u <= u_min then
     y := 0;
  elseif u < u_max then
     cdf     :=Weibull.cumulative(u, lambda=lambda, k=k);
     cdf_min :=Weibull.cumulative(u_min, lambda=lambda, k=k);
     cdf_max :=Weibull.cumulative(u_max, lambda=lambda, k=k);
     y := (cdf - cdf_min) / max(cdf_max - cdf_min, 10*Modelica.Constants.eps);
  else
     y := 1;
  end if;

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Weibull.<b>cumulative</b>(u, u_min=0, u_max=1, lambda=1, k=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the cumulative distribution function according to a
<b>truncated Weibull</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
scale parameter of original distribution <b>lambda</b> and
shape parameter of original distribution <b>k</b>.
The returned value y is in the range:
</p>

<p><blockquote>
0 &le; y &le; 1
</blockquote></p>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Weibull.cumulative.png\">
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
  cumulative(0.5)             // = 0.6224593312018546
  cumulative(0.5,0,0.8,0.5,2) // = 0.6850805314988328
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Weibull.density\">Weibull.density</a>,
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Weibull.quantile\">Weibull.quantile</a>.
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
