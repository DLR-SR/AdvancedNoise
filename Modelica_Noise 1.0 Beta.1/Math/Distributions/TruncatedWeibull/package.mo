within Modelica_Noise.Math.Distributions;
package TruncatedWeibull "Library of truncated Weibull distribution functions"
  extends Modelica.Icons.Package;




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
