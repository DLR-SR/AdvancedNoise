within Modelica_Noise.Math.Distributions;
package TruncatedNormal "Library of truncated normal distribution functions"
  extends Modelica.Icons.Package;

  function density "Density of truncated normal distribution"
    import Modelica_Noise.Math.Distributions.Normal;
    extends
      Modelica_Noise.Math.Distributions.Interfaces.partialTruncatedDensity;
    input Real mu= (u_max + u_min)/2
      "Expectation (mean) value of the normal distribution" annotation(Dialog);
    input Real sigma=(u_max - u_min)/6
      "Standard deviation of the normal distribution"                                  annotation(Dialog);
  protected
    Real pdf;
    Real cdf_min;
    Real cdf_max;
  algorithm
    if u >= u_min and u <= u_max then
       pdf :=Normal.density(u,mu,sigma);
       cdf_min :=Normal.cumulative(u_min,mu,sigma);
       cdf_max :=Normal.cumulative(u_max,mu,sigma);
       y := pdf / max(cdf_max - cdf_min, 10*Modelica.Constants.eps);
    else
       y := 0;
    end if;
    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Normal.<b>density</b>(u, u_min=0, u_max=1, mu=0, sigma=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the probability density function according to a
<b>truncated normal</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
mean value of original distribution <b>mu</b> and
standard deviation of original distribution <b>sigma</b> (variance = sigma<sup>2</sup>).
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedNormal.density.png\">
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
  density(0.5)                // = 1.041828977196953
  density(0.5,-1.5,1.5,1,0.9) // = 0.5365495585520803
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.TruncatedNormal.cumulative\">TruncatedNormal.cumulative</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.TruncatedNormal.quantile\">TruncatedNormal.quantile</a>.
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
    "Cumulative distribution function of truncated normal distribution"
    import Modelica_Noise.Math.Distributions.Normal;
    extends
      Modelica_Noise.Math.Distributions.Interfaces.partialTruncatedCumulative;
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
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedNormal.cumulative.png\">
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
<a href=\"modelica://Modelica_Noise.Math.Distributions.Normal.density\">TruncatedNormal.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Normal.quantile\">TruncatedNormal.quantile</a>.
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

  function quantile "Quantile of truncated normal distribution"
    import Modelica_Noise.Math.Distributions.Normal;
    extends
      Modelica_Noise.Math.Distributions.Interfaces.partialTruncatedQuantile;
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
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedNormal.quantile.png\">
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
<a href=\"modelica://Modelica_Noise.Math.Distributions.TruncatedNormal.density\">TruncatedNormal.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.TruncatedNormal.cumulative\">TruncatedNormal.cumulative</a>.
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
                   graphics={
        Line(
          points={{-32,-32},{-32,-80}}),
                           Line(
          points={{-32,-32},{-28,-21.0617},{-24.5,-7.4388},{-21,8.1682},{
              -17.5,24.9428},{-14,41.695},{-10.5,56.9771},{-7,69.2797},{-3.5,
              77.2739},{0,80.047},{3.5,77.2739},{7,69.2797},{10.5,56.9771},{
              14,41.695},{17.5,24.9428},{21,8.1682},{24.5,-7.4388},{28,
              -21.0617},{31.5,-32.2849},{35,-41.0467}},
          smooth=Smooth.Bezier),
        Line(
          points={{34.5,-40.5},{34.5,-78.5}}),
        Line(
          points={{34.5,-78.5},{70.5,-78.5}}),
        Line(
          points={{-68,-79},{-32,-79}})}),
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
of the <b>truncated normal</b> distribution. Examples:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedNormal.density.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedNormal.cumulative.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedNormal.quantile.png\">
</blockquote></p>

<p>
For more details<br>
of the normal distribution, see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>,<br>
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
end TruncatedNormal;
