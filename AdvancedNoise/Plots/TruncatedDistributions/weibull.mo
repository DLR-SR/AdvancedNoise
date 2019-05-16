within AdvancedNoise.Plots.TruncatedDistributions;
function weibull "Plot functions Modelica.Math.Distributions.Weibull"
  extends Modelica.Icons.Function;
   import Modelica.Math.Distributions.Weibull;
   import T_Weibull = Modelica.Math.Distributions.TruncatedWeibull;
   input Integer nPoints(min=2) = 1000 "Number of evaluation points";
protected
   Real u[nPoints] = linspace(-1, 2, nPoints);
   Real u2[nPoints] = linspace(0.001, 0.999, nPoints);
   Real y1[nPoints];
   Real y2[nPoints];
algorithm
   y1 := Weibull.density(u, lambda=0.5, k=2);
   y2 := T_Weibull.density(u,u_max=0.8, lambda=0.5, k=2);
   plotArrays(u, [y1,y2], title="Densities of Weibull distribution",
              legend={"lambda=0.5, k=2", "truncated to u_min=0, u_max=0.8"},id=1);

   y1 := Weibull.cumulative(u, lambda=0.5, k=2);
   y2 := T_Weibull.cumulative(u, u_max=0.8, lambda=0.5, k=2);
   plotArrays(u, [y1,y2], title="Cumulative distribution functions of Weibull distribution",
              legend={"lambda=0.5, k=2", "truncated to u_min=0, u_max=0.8"}, id=10);

   y1 := Weibull.quantile(u2, lambda=0.5, k=2);
   y2 := T_Weibull.quantile(u2, y_max=0.8, lambda=0.5, k=2);
   plotArrays(u2, [y1,y2], title="Inverse cumulative distribution function of Weibull distribution",
              legend={"lambda=0.5, k=2", "truncated to u_min=0, u_max=0.8"}, id=20);

   annotation(__Dymola_interactive = true, Documentation(info="<html>
<p>
Compare results of functions from
<a href=\"modelica://Modelica.Math.Distributions.Weibull\">Modelica.Math.Distributions.Weibull</a>
with those from 
<a href=\"modelica://Modelica.Math.Distributions.TruncatedWeibull\">Modelica.Math.Distributions.TruncatedWeibull</a>,
each for the same arguments.
</p>
</html>"));
end weibull;
