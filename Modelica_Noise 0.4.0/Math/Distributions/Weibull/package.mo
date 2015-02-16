within Modelica_Noise.Math.Distributions;
package Weibull "Library of Weibull distribution functions"
  extends Modelica.Icons.Package;


  annotation (Icon(graphics={Line(
          points={{-72,-60},{-68.5,-60},{-65,-60},{-61.5,-60},{-58,-60},{-54.5,-60},{-51,-60},{-47.5,
              -60},{-44,-60},{-40.5,-60},{-37,-60},{-33.5,-60},{-30,-60},{-26.5,-60},{-23,-60},{-19.5,
              -60},{-16,-60},{-12.5,-60},{-9,-60},{-5.5,-60},{-2,-60},{1.5,43.1424},{5,71.1658},{8.5,
              80},{12,77.3585},{15.5,67.6645},{19,54.0082},{22.5,38.6157},{26,23.0458},{29.5,8.32389},
              {33,-4.9424},{36.5,-16.4596},{40,-26.1579},{43.5,-34.1153},{47,-40.4975},{50.5,-45.5133},
              {54,-49.3832},{57.5,-52.3187},{61,-54.5105},{64.5,-56.123},{68,-57.2928}},
          color={0,0,0},
          smooth=Smooth.Bezier)}), Documentation(info="<html>
<p>
This package provides
</p>
<ul>
<li> probability density function (= derivative of cumulative distribution function),</li>
<li> cumulative distribution function, and</li>
<li> quantile (= inverse cumulative distribution function).</li>
</ul>
<p>
of the <b>Weibull</b> distribution. Examples:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Weibull.density.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Weibull.cumulative.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Weibull.quantile.png\">
</blockquote></p>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>.
</p>
</html>"));
end Weibull;
