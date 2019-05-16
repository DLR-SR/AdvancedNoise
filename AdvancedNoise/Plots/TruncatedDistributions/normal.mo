within AdvancedNoise.Plots.TruncatedDistributions;
function normal "Plot functions Modelica.Math.Distributions.Normal"
  extends Modelica.Icons.Function;
  import Modelica.Math.Distributions.Normal;
  import T_Normal = Modelica.Math.Distributions.TruncatedNormal;
  input Integer nPoints(min=2) = 1000 "Number of evaluation points";
protected
  Real u[nPoints] = linspace(-3, 3, nPoints);
  Real u2[nPoints] = linspace(0.001, 0.999, nPoints);
  Real y1[nPoints];
  Real y2[nPoints];
algorithm
  y1 := Normal.density(u);
  y2 := T_Normal.density(u, u_min=-1.5,u_max=1.5);
  plotArrays(u, [y1,y2], title="Densities of Normal distribution",
             legend={"mu=0, sigma=1", "truncated to u_min=-1.5, u_max=1.5"},id=1);

  y1 := Normal.cumulative(u);
  y2 := T_Normal.cumulative(u, u_min=-1.5,u_max=1.5);
  plotArrays(u, [y1,y2], title="Cumulative distribution functions of Normal distribution",
             legend={"mu=0, sigma=1", "truncated to u_min=-1.5, u_max=1.5"}, id=10);

  y1 := Normal.quantile(u2);
  y2 := T_Normal.quantile(u2, y_min=-1.5,y_max=1.5);
  plotArrays(u2, [y1,y2], title="Inverse cumulative distribution function of Normal distribution",
             legend={"mu=0, sigma=1", "truncated to u_min=-1.5, u_max=1.5"}, id=20);

  annotation(__Dymola_interactive = true, Documentation(info="<html>
<p>
Compare results of functions from
<a href=\"modelica://Modelica.Math.Distributions.Normal\">Modelica.Math.Distributions.Normal</a>
with those from 
<a href=\"modelica://Modelica.Math.Distributions.TruncatedNormal\">Modelica.Math.Distributions.TruncatedNormal</a>,
each for the same arguments.
</p>
</html>"));
end normal;
