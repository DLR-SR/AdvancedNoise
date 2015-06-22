within Noise.Distributions;
package Bates "Library of Bates distribution functions (= mean of n uniform distributions)"
  extends Modelica.Icons.Package;


annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
        -100,-100},{100,100}}), graphics={
                           Line(
          points={{-70,-63.953},{-66.5,-63.8975},{-63,-63.7852},{-59.5,-63.5674},
              {-56,-63.1631},{-52.5,-62.4442},{-49,-61.2213},{-45.5,-59.2318},{-42,
              -56.1385},{-38.5,-51.5468},{-35,-45.0467},{-31.5,-36.2849},{-28,-25.0617},
              {-24.5,-11.4388},{-21,4.1682},{-17.5,20.9428},{-14,37.695},{-10.5,
              52.9771},{-7,65.2797},{-3.5,73.2739},{0,76.047},{3.5,73.2739},{7,65.2797},
              {10.5,52.9771},{14,37.695},{17.5,20.9428},{21,4.1682},{24.5,-11.4388},
              {28,-25.0617},{31.5,-36.2849},{35,-45.0467},{38.5,-51.5468},{42,-56.1385},
              {45.5,-59.2318},{49,-61.2213},{52.5,-62.4442},{56,-63.1631},{59.5,
              -63.5674},{63,-63.7852},{66.5,-63.8975},{70,-63.953}},
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
of the <b>Bates</b> distribution (= <b>mean</b> of n <b>uniform</b>
distributions). Examples:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Bates.density.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Bates.cumulative.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Bates.quantile.png\">
</blockquote></p>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Bates_distribution\">Wikipedia</a>.
</p>
</html>"));
end Bates;
