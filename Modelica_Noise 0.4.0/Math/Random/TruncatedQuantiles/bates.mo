within Modelica_Noise.Math.Random.TruncatedQuantiles;
function bates "Bates distribution"
  extends Random.Utilities.Interfaces.partialTruncatedQuantile;
  input Integer n=12 "Number of uniform random values" annotation (Dialog);
  input Real tol = 1e-6 "Required acuracy of the quantile" annotation (Dialog);
algorithm
  y :=Noise.Distributions.Bates.quantile(
    u,
    y_min,
    y_max,
    n,
    tol);
  annotation(Inline=true);
end bates;
