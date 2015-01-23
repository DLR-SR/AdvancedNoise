within Modelica_Noise.Math.Distributions.Discrete;
function density "Density of discrete distribution (undefined!)"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialDensity;
  input Real x[:] = {0,1} "Discrete values to be chosen from" annotation(Dialog);
  input Real p[size(x,1)] = ones(size(x,1))/size(x,1)
    "The probabilities of the discrete values" annotation(Dialog);
algorithm
  assert(false, "The density of the discrete distribution is not defined.");

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
