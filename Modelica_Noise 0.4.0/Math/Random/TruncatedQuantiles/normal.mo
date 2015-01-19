within Modelica_Noise.Math.Random.TruncatedQuantiles;
function normal "Normal distribution"
  import Modelica_Noise.Math.Distributions.Normal;
  extends Random.Utilities.Interfaces.partialTruncatedQuantile;
  input Real sigma=1 "Standard deviation of the normal distribution"
   annotation(Dialog(group="mu = (y_max - y_min)/2: Mean value of the normal distribution"));
protected
  Real mu = (y_max - y_min)/2;
  Real cdf_min = Normal.cumulative(y_min,mu=mu,sigma=sigma)
    "Value of cdf at y_min";
  Real cdf_max = Normal.cumulative(y_max,mu=mu,sigma=sigma)
    "Value of cdf at y_max";
algorithm
  y := Normal.quantile(cdf_min + u*(cdf_max-cdf_min), mu=mu, sigma=sigma);
end normal;
