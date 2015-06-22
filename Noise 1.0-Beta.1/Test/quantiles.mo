within Noise.Test;
function quantiles "Test functions Math.Statistics.Quantiles"
   import Modelica.Utilities.Streams.print;
   import Modelica_Noise.Math.Random.TruncatedQuantiles;
   input Integer nPoints = 1000;
   input Real eps = 1e-5;
protected
   Real u[nPoints] = linspace(eps, 1-eps, nPoints);
   Real y[nPoints];
algorithm
  y := Modelica_Noise.Math.Distributions.Uniform.quantile(
    u,
    y_min=1,
    y_max=3);
   plotArray(u, y, id=1);

  y := Modelica_Noise.Math.Distributions.Normal.quantile(
    u,
    mu=2,
    sigma=3);
   plotArray(u, y, id=2);

  y := Modelica_Noise.Math.Distributions.Weibull.quantile(
    u,
    lambda=1,
    k=1);
   plotArray(u, y, id=3);

   // Truncated quantiles
   y :=TruncatedQuantiles.normal(u,y_min=-4,y_max=8,sigma=3);
   plotArray(u, y, id=4);

   annotation(__Dymola_interactive = true);
end quantiles;
