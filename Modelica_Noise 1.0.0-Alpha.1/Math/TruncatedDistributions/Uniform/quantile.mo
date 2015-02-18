within Modelica_Noise.Math.TruncatedDistributions.Uniform;
function quantile "Quantile of uniform distribution"
  extends Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialQuantile;
algorithm
  y := Modelica_Noise.Math.Distributions.Uniform.quantile(u,y_min,y_max);

  annotation(Inline=true, Documentation(info="<html>
<p>
The truncated uniform distribution is identical to the uniform distribution.
For details about function quantile(..), see therefore
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.quantile\">Math.Distributions.Uniform.quantile</a>.
</p>
</html>"));
end quantile;
