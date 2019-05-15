within AdvancedNoise.Plots.Distributions;
function bates "Plot functions AdvancedNoise.Distributions.Bates"
   import AdvancedNoise.Distributions.Bates;
   input Integer nPoints(min=2) = 500 "Number of evaluation points";
protected
   Real u[nPoints] = linspace(-4, 4, nPoints);
   Real u2[nPoints] = linspace(0, 1, nPoints);
   Real y1[nPoints];
   Real y2[nPoints];
   Real y3[nPoints];
algorithm
   y1 := Bates.density(u, y_min=-3, y_max=3);
   y2 := Bates.density(u, y_min=-3, y_max=3, n=6);
   y3 := Bates.density(u, y_min=-3, y_max=3, n=2);
   plotArrays(u, [y1,y2,y3], title="Densities of Bates distribution with y_min=-3, y_max=3",
              legend={"n = 12", "n = 6", "n = 2"},id=10);

   y1 := Bates.cumulative(u, y_min=-3, y_max=3);
   y2 := Bates.cumulative(u, y_min=-3, y_max=3, n=6);
   y3 := Bates.cumulative(u, y_min=-3, y_max=3, n=2);
   plotArrays(u, [y1,y2,y3], title="Cumulative distribution functions of Bates distributionwith y_min=-3, y_max=3",
              legend={"n = 12", "n = 6", "n = 2"},id=20);

   y1 := Bates.quantile(u2, y_min=-3, y_max=3);
   y2 := Bates.quantile(u2, y_min=-3, y_max=3, n=6);
   y3 := Bates.quantile(u2, y_min=-3, y_max=3, n=2);
   plotArrays(u2, [y1,y2,y3], title="Inverse cumulative distribution function of Bates distribution with y_min=-3, y_max=3",
              legend={"n = 12", "n = 6", "n = 2"}, id=30);

   annotation(__Dymola_interactive = true, Documentation(info="<html>
<p>
Plot results of calling functions from
<a href=\"modelica://AdvancedNoise.Distributions.Bates\">AdvancedNoise.Distributions.Bates</a>,
i.e. <code>Bates.density()</code>, <code>Bates.cumulative()</code>
and <code>Bates.quantile()</code>, each for the same arguments.
</p>
</html>"));
end bates;
