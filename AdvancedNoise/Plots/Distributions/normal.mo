within AdvancedNoise.Plots.Distributions;
function normal "Plot functions Modelica.Math.Distributions.Normal"
  extends Modelica.Icons.Function;
  import Modelica.Math.Distributions.Normal;
  input Integer nPoints(min=2) = 1000 "Number of evaluation points";
protected
  Real u[nPoints] = linspace(-3, 3, nPoints);
  Real u2[nPoints] = linspace(0.001, 0.999, nPoints);
  Real y1[nPoints];
  Real y2[nPoints];
  Real y3[nPoints];
algorithm
  y1 := Normal.density(u);
  y2 := Normal.density(u, mu = 1);
  y3 := Normal.density(u, mu = 0, sigma = 0.5);
  plotArrays(u, [y1,y2,y3], title="Densities of Normal distribution",
             legend={"density(u,0,1)", "density(u,1,1)", "density(u,0,0.5)"},id=1);

  y1 := Normal.cumulative(u);
  y2 := Normal.cumulative(u, mu=1);
  y3 := Normal.cumulative(u, mu=0, sigma = 0.5);
  plotArrays(u, [y1,y2,y3], title="Cumulative distribution functions of Normal distribution",
             legend={"cumulative(u,0,1)", "cumulative(u,1,1)", "cumulative(u,0,0.5)"}, id=10);

  y1 := Normal.quantile(u2);
  y2 := Normal.quantile(u2, mu=1);
  y3 := Normal.quantile(u2, mu=0, sigma = 0.5);
  plotArrays(u2, [y1,y2,y3], title="Inverse cumulative distribution function of Normal distribution",
             legend={"quantile(u,0,1)", "quantile(u,1,1)", "quantile(u,0,0.5)"}, id=20);

  annotation(__Dymola_interactive = true, Documentation(info="<html>
<p>
Plot results of calling functions from
<a href=\"modelica://Modelica.Math.Distributions.Normal\">Modelica.Math.Distributions.Normal</a>,
i.e. <code>Normal.density()</code>, <code>Normal.cumulative()</code>
and <code>Normal.quantile()</code>, each for the same arguments.
</p>
</html>"));
end normal;
