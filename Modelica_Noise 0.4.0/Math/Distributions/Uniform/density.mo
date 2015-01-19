within Modelica_Noise.Math.Distributions.Uniform;
function density "Density of uniform distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialDensity;
  input Real y_min=0 "Lower limit of band" annotation (Dialog);
  input Real y_max=1 "Upper limit of band" annotation (Dialog);
algorithm
  y := if u < y_min or u > y_max then 0.0 else 1/(y_max - y_min);

  annotation (Inline=true,Documentation(info="<html>
<p>
This function returns the probability density according to a uniform distribution in a band.
</p>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Uniform_distribution_(continuous)\">Wikipedia</a>.
</p>
</html>"));
end density;
