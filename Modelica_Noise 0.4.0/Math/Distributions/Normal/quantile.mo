within Modelica_Noise.Math.Distributions.Normal;
function quantile
  "Quantile of normal distribution (= inverse cumulative distribution functions)"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialQuantile;
  input Real mu=0 "Expectation (mean) value of the normal distribution" annotation(Dialog);
  input Real sigma=1 "Standard deviation of the normal distribution" annotation(Dialog);
algorithm
  y := mu + sigma*Modelica_Noise.Math.Special.cdfInvNormal(u);

  annotation (Inline=true, Documentation(info=
                             "<html>
<p>
This function returns a random number according to a normal distribution.
This means that 99.7 % of the returned random numbers are in the range:
</p>

<blockquote>
<p>
mu-3*sigma &le; y &le; mu+3*sigma
</p>
</blockquote>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>.
</p>
</html>"));
end quantile;
