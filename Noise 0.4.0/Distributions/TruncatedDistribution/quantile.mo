within Noise.Distributions.TruncatedDistribution;
function quantile
  extends
    Modelica_Noise.Math.Random.Utilities.Interfaces.partialTruncatedQuantile;
  extends distribution.quantile(r = cdf_min + r*(cdf_max-cdf_min));
protected
  Real cdf_min = distribution.cumulative(y_min,mu=mu,sigma=sigma)
    "Value of cdf at y_min";
  Real cdf_max = distribution.cumulative(y_max,mu=mu,sigma=sigma)
    "Value of cdf at y_max";
end quantile;
