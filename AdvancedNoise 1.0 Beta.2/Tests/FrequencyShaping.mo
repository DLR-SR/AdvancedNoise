within AdvancedNoise.Tests;
model FrequencyShaping
  "Validates the step response filter (and its derivative) against an actual filter"
  extends Modelica.Icons.Example;
  AdvancedNoise.Sources.TimeBasedNoise filteredNoise(
    useAutomaticLocalSeed=false,
    sampleFactor=10,
    samplePeriod=0.1,
    redeclare package interpolation = AdvancedNoise.Interpolators.FirstOrder,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{60,60},{80,80}})));
  AdvancedNoise.Sources.TimeBasedNoise rawNoise(
    useAutomaticLocalSeed=false,
    sampleFactor=10,
    samplePeriod=filteredNoise.samplePeriod,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=filteredNoise.interpolation.k,
    T=filteredNoise.interpolation.T,
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Blocks.Continuous.Der derConvolution
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Blocks.Continuous.Der derFilter
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  AdvancedNoise.Sources.TimeBasedNoise tabulatedNoise(
    useAutomaticLocalSeed=false,
    sampleFactor=10,
    samplePeriod=0.1,
    redeclare package interpolation =
        AdvancedNoise.Interpolators.TabulatedStepResponse,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Continuous.Der derTabulated
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=tabulatedNoise.interpolation.suggestedSamplePeriod)
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
equation
  connect(rawNoise.y, firstOrder.u) annotation (Line(
      points={{-39,-30},{-22,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(firstOrder.y, derFilter.u) annotation (Line(
      points={{1,-30},{18,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(derConvolution.u, filteredNoise.y) annotation (Line(
      points={{18,50},{-39,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(derTabulated.u, tabulatedNoise.y) annotation (Line(
      points={{18,10},{-39,10}},
      color={0,0,127},
      smooth=Smooth.None));
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
<p>This example demonstrated different noise filtering methods using a convolution, a tabulated method and using a filter.</p>
</html>"),
    experiment(
      StopTime=20,
      Interval=0.01,
      Tolerance=1e-006));
end FrequencyShaping;
