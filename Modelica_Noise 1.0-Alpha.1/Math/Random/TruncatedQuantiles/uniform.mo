within Modelica_Noise.Math.Random.TruncatedQuantiles;
function uniform "Uniform distribution"
  extends Random.Utilities.Interfaces.partialTruncatedQuantile;
algorithm
  y := Modelica_Noise.Math.Distributions.Uniform.quantile(
    u,
    y_min,
    y_max);
  annotation(Inline=true);
end uniform;
