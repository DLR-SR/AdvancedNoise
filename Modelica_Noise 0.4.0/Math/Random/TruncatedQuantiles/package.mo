within Modelica_Noise.Math.Random;
package TruncatedQuantiles "Library of functions for truncated quantiles (= inverse cumulative distribution functions)"
   extends Modelica.Icons.Package;


  annotation (Documentation(info="<html>
<p>
This package contains quantiles (= inverse cumulative distribution functions)
of <b>truncated</b> distributions. A truncated distribution is derived from a base
distribution (e.g. from the normal distribution), by truncating the
pdf (propability density function) to the desired band and adding a constant
value over this band, in order that the integral over the truncated distribution
remains one. All other properties (cdf, inverse cdf) can then be determined
in a straightforward was, provided the properties of the underlying base
distribution is available. As a result, the output of the quantile is restricted
to the defined band. This is important for simulations, where a simulation engine
might have difficulties to cope with very large values (say 1e60) that might
be returned by a quantile (such as from a normal distribution), although the
probability is very low that his situation occurs.
</p>

<p>
For more details on truncated distributions see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>
</html>"), Icon(graphics={Line(
          points={{-80,-80},{-70,-20},{70,20},{80,80}},
          color={0,0,0},
          smooth=Smooth.Bezier)}));
end TruncatedQuantiles;
