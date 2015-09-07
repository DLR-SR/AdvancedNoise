within AdvancedNoise.Tests;
model FixedGridFilter "Validates the fixed grid filter against the free grid"
  extends Modelica.Icons.Example;
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{60,60},{80,80}})));
  AdvancedNoise.Sources.TimeBasedNoise tabulatedNoise(
    useAutomaticLocalSeed=false,
    sampleFactor=10,
    redeclare package interpolation =
        AdvancedNoise.Interpolators.TabulatedStepResponse,
    samplePeriod=tabulatedNoise.interpolation.suggestedSamplePeriod,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Continuous.Der derTabulated
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=tabulatedNoise.interpolation.suggestedSamplePeriod)
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  AdvancedNoise.Sources.TimeBasedNoise fixedGridNoise(
    useAutomaticLocalSeed=false,
    sampleFactor=10,
    samplePeriod=fixedGridNoise.interpolation.suggestedSamplePeriod,
    redeclare package interpolation =
        AdvancedNoise.Interpolators.FixedGridStepResponse,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Continuous.Der derFixedGrid
    annotation (Placement(transformation(extent={{18,-40},{38,-20}})));
equation
  connect(derTabulated.u, tabulatedNoise.y) annotation (Line(
      points={{18,10},{-39,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(derFixedGrid.u, fixedGridNoise.y)
    annotation (Line(points={{16,-30},{-39,-30}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
    Documentation(revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>", info="<html>
<p>This is only used for checking the correct implementation of the faster convolution algorithm.</p>
</html>"),
    experiment(
      StopTime=20,
      Interval=0.01,
      Tolerance=1e-006));
end FixedGridFilter;
