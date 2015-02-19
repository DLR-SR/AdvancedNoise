within Modelica_Noise.Math.Random.TruncatedQuantiles;
function discreteValues "Discrete distribution"
  extends Random.Utilities.Interfaces.partialTruncatedQuantile;
  extends Modelica_Noise.Math.Distributions.Discrete.quantile;
  annotation(Inline=true);
end discreteValues;
