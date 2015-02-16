within Modelica_Noise.Math.Distributions;
package Uniform "Library of uniform distribution functions"
  extends Modelica.Icons.Package;


annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
        -100,-100},{100,100}}), graphics={Line(
      points={{-80,-60},{-40,-60},{-40,60},{40,60},{40,-60},{80,-60}},
      color={0,0,0},
      smooth=Smooth.None)}), Documentation(info="<html>
<p>
This package provides
</p>
<ul>
<li> probability density function (= derivative of cumulative distribution function),</li>
<li> cumulative distribution function, and</li>
<li> quantile (= inverse cumulative distribution function).</li>
</ul>
<p>
of the <b>uniform</b> distribution. Examples:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Uniform.density.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Uniform.cumulative.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Uniform.quantile.png\">
</blockquote></p>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Uniform_distribution_(continuous)\">Wikipedia</a>.
</p>
</html>"));
end Uniform;
