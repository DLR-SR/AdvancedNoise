within Noise.Examples;
model FrequencyShaping
  "Demonstrates shaping of the frequency content with a convolution filter"
  extends Modelica.Icons.Example;
  Modelica_Noise.Blocks.Noise.TimeBasedNoise filteredNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    sampleFactor=10,
    redeclare package interpolation = Noise.Interpolators.FirstOrder)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise rawNoise(
    useAutomaticLocalSeed=false,
    y_min=-1,
    y_max=3,
    sampleFactor=10,
    samplePeriod=filteredNoise.samplePeriod)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=filteredNoise.interpolation.k,
    T=filteredNoise.interpolation.T,
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Blocks.Continuous.Der derConvolution
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Blocks.Continuous.Der derFilter
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
equation
  connect(rawNoise.y, firstOrder.u) annotation (Line(
      points={{-39,10},{-22,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(firstOrder.y, derFilter.u) annotation (Line(
      points={{1,10},{18,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(derConvolution.u, filteredNoise.y) annotation (Line(
      points={{18,50},{-39,50}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end FrequencyShaping;
