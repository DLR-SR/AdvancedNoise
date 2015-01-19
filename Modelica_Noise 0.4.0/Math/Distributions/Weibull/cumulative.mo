within Modelica_Noise.Math.Distributions.Weibull;
function cumulative "Cumulative distribution function of Weibull distribution"
  import Modelica_Noise.Math.Special;
  extends Modelica_Noise.Math.Distributions.Interfaces.partialCumulative;
  input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
  input Real k(min=0) = 1 "Shape parameter of the Weibull distribution" annotation(Dialog);
algorithm
  y := if u >= 0 then 1 - exp(-(u/lambda)^k) else 0.0;

  annotation (Inline=true,Documentation(info="<html>
<p>
This function returns the cumulative distribution function according to a Weibull distribution.
</p>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>.
</p>
</html>"));
end cumulative;
