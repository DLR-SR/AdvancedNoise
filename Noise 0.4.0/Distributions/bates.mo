within Noise.Distributions;
function bates "Truncated Bates distribution"
  extends
    Modelica_Noise.Math.Random.Utilities.Interfaces.partialTruncatedQuantile;
  input Integer n=12 "Number of uniform random values" annotation (Dialog);
  input Real tol = 1e-6 "Required acuracy of the quantile" annotation (Dialog);
algorithm
  y :=Bates.quantile(
    u,
    y_min,
    y_max,
    n,
    tol);
  annotation(Inline=true);
end bates;
