within Modelica_Noise.Math.Random.TruncatedQuantiles;
function normal "Normal distribution"
  import Modelica_Noise.Math.Distributions.Normal;
  extends Random.Utilities.Interfaces.partialTruncatedQuantile;
  input Real mu= (y_max + y_min)/2
    "Expectation (mean) value of the normal distribution" annotation(Dialog);
  input Real sigma=1 "Standard deviation of the normal distribution" annotation(Dialog);
protected
  Real cdf_min = Normal.cumulative(y_min,mu=mu,sigma=sigma)
    "Value of cdf at y_min";
  Real cdf_max = Normal.cumulative(y_max,mu=mu,sigma=sigma)
    "Value of cdf at y_max";
algorithm
  y := Normal.quantile(cdf_min + u*(cdf_max-cdf_min), mu=mu, sigma=sigma);

  // Take care! Something is wrong in the above transformation?
  // Modelica_Noise.Blocks.Examples.NoiseExamples.Distributions
  // with mu = 10...
  if y > y_max or y < y_min then
    Modelica.Utilities.Streams.print(String(y));
  end if;
  y := min(y_max,max(y_min,y));

end normal;
