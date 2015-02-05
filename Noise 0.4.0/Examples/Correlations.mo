within Noise.Examples;
model Correlations
  extends Modelica.Icons.Example;

  Modelica_Noise.Blocks.Noise.EventBasedNoise noise1(
    samplePeriod=0.01,
    y_min=0,
    y_max=1,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=11)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Modelica_Noise.Blocks.Noise.EventBasedNoise noise2(
    samplePeriod=0.01,
    y_min=0,
    y_max=1,
    useAutomaticLocalSeed=false)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Statistics.CorrelationTest crossCorrelationTest
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Modelica_Noise.Blocks.Noise.EventBasedNoise noise3(
    samplePeriod=0.01,
    y_min=0,
    y_max=1,
    useAutomaticLocalSeed=false)
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  Statistics.CorrelationTest autoCorrelationTest(correlation(delta_t=0.02))
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
equation
  connect(crossCorrelationTest.u1, noise1.y) annotation (Line(
      points={{-22,56},{-40,56},{-40,70},{-59,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(crossCorrelationTest.u2, noise2.y) annotation (Line(
      points={{-22,44},{-40,44},{-40,30},{-59,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(autoCorrelationTest.u1, noise2.y) annotation (Line(
      points={{-22,16},{-40,16},{-40,30},{-59,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(autoCorrelationTest.u2, noise3.y) annotation (Line(
      points={{-22,4},{-40,4},{-40,-10},{-59,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Correlations;
