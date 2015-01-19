within Modelica_Noise.Math.Distributions.Uniform;
function quantile
  "Quantile of uniform distribution (= inverse cumulative distribution functions)"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialQuantile;
  input Real y_min=0 "Lower limit of band" annotation (Dialog);
  input Real y_max=1 "Upper limit of band" annotation (Dialog);
algorithm
  y := u*(y_max - y_min) + y_min;
  annotation (Inline=true,Documentation(info="<html>
<p>
This function returns a number according to a uniform distribution in a band.
This means the returned number is in the range:
</p>

<blockquote>
<p>
y_min &le; y &le; y_max
</p>
</blockquote>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Uniform_distribution_(continuous)\">Wikipedia</a>.
</p>
</html>"));
end quantile;
