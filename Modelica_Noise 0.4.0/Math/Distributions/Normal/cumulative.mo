within Modelica_Noise.Math.Distributions.Normal;
function cumulative "Cumulative distribution function of normal distribution"
  import Modelica_Noise.Math.Special;
  extends Modelica_Noise.Math.Distributions.Interfaces.partialCumulative;
  input Real mu=0 "Expectation (mean) value of the normal distribution" annotation(Dialog);
  input Real sigma=1 "Standard deviation of the normal distribution" annotation(Dialog);
algorithm
  y :=(1 + Special.erf((u - mu)/(sigma*sqrt(2))))/2;

  annotation (Inline=true,Documentation(info="<html>
<p>
This function returns the cumulative distribution function according to a normal distribution.
</p>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>.
</p>
</html>"));
end cumulative;
