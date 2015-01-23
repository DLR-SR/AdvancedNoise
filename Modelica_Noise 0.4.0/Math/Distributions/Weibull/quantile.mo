within Modelica_Noise.Math.Distributions.Weibull;
function quantile
  "Quantile of Weibull distribution (= inverse cumulative distribution function)"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialQuantile;
  input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
  input Real k(min=0) = 1 "Shape parameter of the Weibull distribution" annotation(Dialog);
algorithm
  // Transform by inverse cumulative density function
  // CDF = 1 - exp( -(x/lambda)^k ) for x >= 0
  // x   = lambda * (-ln( 1-CDF ))^(1/k)
  y := lambda * (-log( 1-u)) ^(1/k);

  annotation (Inline=true, Documentation(info="<html>
<p>
This function returns a random number according to a Weibull distribution.
This means the returned random number is always &ge; 0.
</p>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>.
</p>
</html>"));
end quantile;
