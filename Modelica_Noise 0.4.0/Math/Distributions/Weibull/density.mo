within Modelica_Noise.Math.Distributions.Weibull;
function density "Weibull distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialDensity;
  input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
  input Real k(min=0) = 1 "Shape parameter of the Weibull distribution" annotation(Dialog);
algorithm
  y :=if u >= 0 then (k/lambda)*(u/lambda)^(k - 1)*exp(-(u/lambda)^k) else 0.0;

  annotation (Inline=true, Documentation(info="<html>
<p>
This function returns the density of a Weibull distribution.
</p>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>.
</p>
</html>"));
end density;
