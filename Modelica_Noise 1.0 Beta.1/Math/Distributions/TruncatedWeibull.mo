within Modelica_Noise.Math.Distributions;
package TruncatedWeibull "Library of truncated Weibull distribution functions"
  extends Modelica.Icons.Package;

  function density "Density of truncated Weibull distribution"
    import Modelica_Noise.Math.Distributions.Weibull;
    extends
      Modelica_Noise.Math.Distributions.Interfaces.partialTruncatedDensity;
    input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
    input Real k(min=0) "Shape parameter of the Weibull distribution" annotation(Dialog);
  protected
    Real pdf;
    Real cdf_min;
    Real cdf_max;
  algorithm
    if u >= u_min and u <= u_max then
       pdf :=Weibull.density(u, lambda=lambda, k=k);
       cdf_min :=Weibull.cumulative(u_min, lambda=lambda, k=k);
       cdf_max :=Weibull.cumulative(u_max, lambda=lambda, k=k);
       y := pdf / max(cdf_max - cdf_min, 10*Modelica.Constants.eps);
    else
       y := 0;
    end if;
    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Weibull.<b>density</b>(u, u_min=0, u_max=1, lambda=1, k=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the probability density function according to a
<b>truncated Weibull</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
scale parameter of original distribution <b>lambda</b> and
shape parameter of original distribution <b>k</b>.
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedWeibull.density.png\">
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
  density(0.5)             // = 0.9595173756674719
  density(0.5,0,0.8,0.5,2) // = 1.5948036466479143
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.TruncatedWeibull.cumulative\">TruncatedWeibull.cumulative</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.TruncatedWeibull.quantile\">TruncatedWeibull.quantile</a>.
</p>
</html>",   revisions="<html>
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

  function cumulative
    "Cumulative distribution function of truncated Weibull distribution"
    import Modelica_Noise.Math.Distributions.Weibull;
    extends
      Modelica_Noise.Math.Distributions.Interfaces.partialTruncatedCumulative;
    input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
    input Real k(min=0) "Shape parameter of the Weibull distribution" annotation(Dialog);
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
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedWeibull.cumulative.png\">
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
<a href=\"modelica://Modelica_Noise.Math.Distributions.TruncatedWeibull.density\">TruncatedWeibull.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.TruncatedWeibull.quantile\">TruncatedWeibull.quantile</a>.
</p>
</html>",   revisions="<html>
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

  function quantile "Quantile of truncated Weibull distribution"
    import Modelica_Noise.Math.Distributions.Weibull;
    extends
      Modelica_Noise.Math.Distributions.Interfaces.partialTruncatedQuantile;
    input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
    input Real k(min=0) "Shape parameter of the Weibull distribution" annotation(Dialog);
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
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedWeibull.quantile.png\">
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
<a href=\"modelica://Modelica_Noise.Math.Distributions.TruncatedWeibull.density\">TruncatedWeibull.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.TruncatedWeibull.cumulative\">TruncatedWeibull.cumulative</a>.
</p>
</html>",   revisions="<html>
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
  annotation (Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}),
                   graphics={Line(
          points={{-72,-62},{-68.5,-62},{-65,-62},{-61.5,-62},{-58,-62},{
              -54.5,-62},{-51,-62},{-47.5,-62},{-44,-62},{-40.5,-62},{-37,-62},
              {-33.5,-62},{-30,-62},{-26.5,-62},{-23,-62},{-19.5,-62},{-16,
              -62},{-12.5,-62},{-9,-62},{-5.5,-62},{-2,-62},{1.5,41.1424},{5,
              69.1658},{8.5,78},{12,75.3585},{15.5,65.6645},{19,52.0082},{
              22.5,36.6157},{26,21.0458},{29.5,6.3239},{33,-6.9424},{36.5,
              -18.4596},{40,-28.1579},{43.5,-36.1153}},
          smooth=Smooth.Bezier),
        Line(
          points={{43.5,-36},{43.5,-63}}),
        Line(
          points={{43.5,-63},{79.5,-63}})}),
    Documentation(info="<html>
<p>
This package provides
</p>
<ul>
<li> probability density function (= derivative of cumulative distribution function),</li>
<li> cumulative distribution function, and</li>
<li> quantile (= inverse cumulative distribution function).</li>
</ul>
<p>
of the <b>truncated Weibull</b> distribution. Examples:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedWeibull.density.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedWeibull.cumulative.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedWeibull.quantile.png\">
</blockquote></p>

<p>
For more details<br>
of the Weibull distribution, see
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
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
end TruncatedWeibull;
