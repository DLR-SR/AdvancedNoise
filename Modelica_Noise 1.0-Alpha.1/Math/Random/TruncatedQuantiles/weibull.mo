within Modelica_Noise.Math.Random.TruncatedQuantiles;
function weibull "Weibull distribution"
  import Modelica_Noise.Math.Distributions.Weibull;
  extends Random.Utilities.Interfaces.partialTruncatedQuantile;
  input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
  input Real k(min=0) = 1 "Shape parameter of the Weibull distribution" annotation(Dialog);
protected
  Real cdf_min = Weibull.cumulative(y_min,lambda=lambda,k=k)
    "Value of cdf at y_min";
  Real cdf_max = Weibull.cumulative(y_max,lambda=lambda,k=k)
    "Value of cdf at y_max";
algorithm
  y := Weibull.quantile(cdf_min + u*(cdf_max-cdf_min), lambda=lambda,k=k);
end weibull;
