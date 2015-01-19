within Modelica_Noise.Math.Distributions.Normal;
function density "Density of normal distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialDensity;
  input Real mu=0 "Expectation (mean) value of the normal distribution" annotation(Dialog);
  input Real sigma=1 "Standard deviation of the normal distribution" annotation(Dialog);
algorithm
  y := exp(-(u-mu)^2/(2*sigma^2))/(sigma*sqrt(2*Modelica.Constants.pi));

  annotation (Inline=true, Documentation(info=
                             "<html>
<p>
This function returns the density of a normal distribution.
</p>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>.
</p>
</html>"));
end density;
