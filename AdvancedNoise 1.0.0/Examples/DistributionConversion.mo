within AdvancedNoise.Examples;
model DistributionConversion "Demonstrates how distributions can be converted"
  extends Modelica.Icons.Example;

  inner Modelica.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));

  Modelica.Blocks.Noise.UniformNoise genericNoise(
    samplePeriod=0.001,
    y_min=0,
    y_max=1)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Statistics.FromUniform toNormal(
    redeclare function distribution = Modelica.Math.Distributions.Normal.quantile)
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Statistics.FromUniform toWeibull(
    redeclare function distribution = Modelica.Math.Distributions.Weibull.quantile(k=2))
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Statistics.FromUniform toDiscrete(
    redeclare function distribution = Distributions.Discrete.quantile (x={1,2,3,4,5}))
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Statistics.ToUniform fromNormal(
    redeclare function distribution = Modelica.Math.Distributions.Normal.cumulative)
    annotation (Placement(transformation(extent={{0,50},{20,70}})));
  Statistics.ToUniform fromWeibull(
    redeclare function distribution = Modelica.Math.Distributions.Weibull.cumulative(k=2))
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
equation
  connect(toNormal.u, genericNoise.y) annotation (Line(points={{-42,60},{-52,60},
          {-52,30},{-59,30}}, color={0,0,127}));
  connect(toWeibull.u, genericNoise.y)
    annotation (Line(points={{-42,30},{-59,30}}, color={0,0,127}));
  connect(toDiscrete.u, genericNoise.y) annotation (Line(points={{-42,0},{-52,0},
          {-52,30},{-59,30}}, color={0,0,127}));
  connect(toNormal.y, fromNormal.u)
    annotation (Line(points={{-19,60},{-10.5,60},{-2,60}}, color={0,0,127}));
  connect(toWeibull.y, fromWeibull.u)
    annotation (Line(points={{-19,30},{-2,30},{-2,30}}, color={0,0,127}));

  annotation (
    experiment,
    Documentation(
      info="<html>
<p>
This examples demonstrates how the two blocks
<a href=\"Statistics.FromUniform\">FromUniform</a> and
<a href=\"Statistics.ToUniform\">ToUniform</a> can be used
to convert uniformly distributed numbers to different
distributions and vice versa. See image below for an example:
</p>
<blockquote>
<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/DistributionConversion.png\" alt=\"Diagram DistributionConversion.png\">
</blockquote>
</html>",
      revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      <b>Copyright</b> <b>&copy; DLR Institute of System Dynamics and Control</b><br>
      Initial version implemented by
      A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
      <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>"));
end DistributionConversion;
