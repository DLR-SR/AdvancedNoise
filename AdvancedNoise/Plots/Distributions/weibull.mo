within AdvancedNoise.Plots.Distributions;
function weibull "Plot functions Modelica.Math.Distributions.Weibull"
   import Modelica.Math.Distributions.Weibull;
   input Integer nPoints(min=2) = 1000 "Number of evaluation points";
protected
   Real u[nPoints] = linspace(-1, 3, nPoints);
   Real u2[nPoints] = linspace(0.001, 0.999, nPoints);
   Real y1[nPoints];
   Real y2[nPoints];
   Real y3[nPoints];
algorithm
   y1 := Weibull.density(u, lambda=1.0, k=1);
   y2 := Weibull.density(u, lambda=0.5, k=2);
   y3 := Weibull.density(u, lambda=0.5, k=3);
   plotArrays(u, [y1,y2,y3], title="Densities of Weibull distribution",
              legend={"density(u,1,1)", "density(u,0.5,2)", "density(u,0.5,3)"},id=1);

   y1 := Weibull.cumulative(u, lambda=1.0, k=1);
   y2 := Weibull.cumulative(u, lambda=0.5, k=2);
   y3 := Weibull.cumulative(u, lambda=0.5, k=3);
   plotArrays(u, [y1,y2,y3], title="Cumulative distribution functions of Weibull distribution",
              legend={"cumulative(u,1,1)", "cumulative(u,0.5,2)", "cumulative(u,0.5,3)"}, id=10);

   y1 := Weibull.quantile(u2, lambda=1.0, k=1);
   y2 := Weibull.quantile(u2, lambda=0.5, k=2);
   y3 := Weibull.quantile(u2, lambda=0.5, k=3);
   plotArrays(u2, [y1,y2,y3], title="Inverse cumulative distribution function of Weibull distribution",
              legend={"quantile(u,1,1)", "quantile(u,0.5,2)", "quantile(u,0.5,3)"}, id=20);
   annotation(__Dymola_interactive = true, Documentation(info="<html>
<p>
Plot results of calling functions from
<a href=\"modelica://Modelica.Math.Distributions.Weibull\">Modelica.Math.Distributions.Weibull</a>,
i.e. <code>Weibull.density()</code>, <code>Weibull.cumulative()</code>
and <code>Weibull.quantile()</code>, each for the same arguments.
</p>
</html>"));
end weibull;
