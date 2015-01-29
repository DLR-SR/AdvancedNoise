within Modelica_Noise.Blocks.Examples.NoiseExamples;
model Interpolation
  "Demonstrates different types of interpolations for the noise"
  extends Modelica.Icons.Example;
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Noise.EventBasedNoise constantNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    redeclare package interpolation =
    Modelica_Noise.Math.Random.Utilities.Interpolators.Constant,
y_min=-1,
y_max=3)            annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Noise.EventBasedNoise linearNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
y_min=-1,
y_max=3)             annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Continuous.Filter filter(order=1, f_cut=10)
    annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  Noise.EventBasedNoise smoothNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    redeclare package interpolation =
    Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass,
    y_min=-1,
    y_max=3,
    sampleFactor=10) annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Noise.EventBasedNoise filteredNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    sampleFactor=10,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.LinearFirstOrder,
    redeclare function distribution =
        Modelica_Noise.Math.Random.TruncatedQuantiles.weibull)
    annotation (Placement(transformation(extent={{-60,-96},{-40,-76}})));
  Modelica.Blocks.Continuous.Der der1
    annotation (Placement(transformation(extent={{28,-48},{48,-28}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=0.00001, y_start=0.2)
    annotation (Placement(transformation(extent={{-20,54},{0,74}})));
  Modelica.Blocks.Continuous.Der der2
    annotation (Placement(transformation(extent={{16,72},{36,92}})));
equation
  connect(linearNoise.y, filter.u) annotation (Line(
      points={{-39,-10},{-22,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(der2.u, firstOrder.y) annotation (Line(
      points={{14,82},{8,82},{8,64},{1,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(firstOrder.u, filteredNoise.y) annotation (Line(
      points={{-22,64},{-32,64},{-32,-86},{-39,-86}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(der1.u, filteredNoise.y) annotation (Line(
      points={{26,-38},{-8,-38},{-8,-86},{-39,-86}},
      color={0,0,127},
      smooth=Smooth.None));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    __Dymola_experimentSetupOutput);
end Interpolation;
