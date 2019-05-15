within AdvancedNoise.Plots.Distributions;
function uniform "Plot functions Modelica.Math.Distributions.Uniform"
   import Modelica.Math.Distributions.Uniform;
   input Integer nPoints(min=2) = 1000 "Number of evaluation points";
protected
   Real u[nPoints] = linspace(-5, 5, nPoints);
   Real u2[nPoints] = linspace(0, 1, nPoints);
   Real y1[nPoints];
   Real y2[nPoints];
   Real y3[nPoints];
algorithm
   y1 := Uniform.density(u, u_min=-3, u_max=3);
   y2 := Uniform.density(u, u_min=-1, u_max=3);
   y3 := Uniform.density(u, u_min=1, u_max=3);
   plotArrays(u, [y1,y2,y3], title="Densities of uniform distribution",
              legend={"density(u,-3,3)", "density(u,-1,3)", "density(u,1,3)"},id=1);

   y1 := Uniform.cumulative(u, u_min=-3, u_max=3);
   y2 := Uniform.cumulative(u, u_min=-1, u_max=3);
   y3 := Uniform.cumulative(u, u_min=1, u_max=3);
   plotArrays(u, [y1,y2,y3], title="Cumulative distribution functions of uniform distribution",
              legend={"cumulative(u,-3,3)", "cumulative(u,-1,3)", "cumulative(u,1,3)"},id=2);

   y1 := Uniform.quantile(u2, y_min=-3, y_max=3);
   y2 := Uniform.quantile(u2, y_min=-1, y_max=3);
   y3 := Uniform.quantile(u2, y_min=1, y_max=3);
   plotArrays(u2, [y1,y2,y3], title="Inverse cumulative distribution function of uniform distribution",
              legend={"quantile(u,-3,3)", "quantile(u,-1,3)", "quantile(u,1,3)"}, id=3);

   annotation(__Dymola_interactive = true, Documentation(info="<html>
<p>
Plot results of calling functions from
<a href=\"modelica://Modelica.Math.Distributions.Uniform\">Modelica.Math.Distributions.Uniform</a>,
i.e. <code>Uniform.density()</code>, <code>Uniform.cumulative()</code>
and <code>Uniform.quantile()</code>, each for the same arguments.
</p>
</html>"));
end uniform;
