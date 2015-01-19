within Modelica_Noise.Test;
function densities "Test functions Math.Statistics.Densities"
   import Modelica.Utilities.Streams.print;
   input Integer nPoints = 1000;
   input Real u_min=-1;
   input Real u_max=4;
protected
   Real u[nPoints] = linspace(u_min, u_max, nPoints);
   Real y[nPoints];
algorithm
   y :=Math.Distributions.Uniform.density(u, y_min=1, y_max=3);
   plotArray(u, y, id=1);

   y :=Math.Distributions.Normal.density(
    u,
    mu=0,
    sigma=sqrt(0.08));
   plotArray(u, y, id=2);

   y :=Math.Distributions.Weibull.density(
    u,
    lambda=1,
    k=5);
   plotArray(u, y, id=3);

   annotation(__Dymola_interactive = true);
end densities;
