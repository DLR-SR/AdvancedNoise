within Modelica_Noise.Blocks.Examples.NoiseExamples;
model Interpolation
  "Demonstrates different types of interpolations for the noise"
  extends Modelica.Icons.Example;
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Noise.EventBasedNoise constantNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    redeclare package interpolation =
    Modelica_Noise.Math.Random.Utilities.Interpolators.Constant,
y_min=-1,
y_max=3)            annotation (Placement(transformation(extent={{-60,70},{-40,
            90}})));
  Noise.EventBasedNoise linearNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
y_min=-1,
y_max=3)             annotation (Placement(transformation(extent={{-60,20},{-40,
            40}})));
  Noise.EventBasedNoise smoothNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    redeclare package interpolation =
    Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass,
    y_min=-1,
    y_max=3,
    sampleFactor=10) annotation (Placement(transformation(extent={{-60,-30},{
            -40,-10}})));
  Modelica.Blocks.Continuous.Der derLinear
    annotation (Placement(transformation(extent={{0,8},{20,28}})));
  Modelica.Blocks.Continuous.FirstOrder linearFiltered(T=0.00001, y_start=0.2)
    annotation (Placement(transformation(extent={{-20,32},{0,52}})));
  Modelica.Blocks.Continuous.Der derLinearFiltered
    annotation (Placement(transformation(extent={{20,32},{40,52}})));
  Modelica.Blocks.Continuous.Der derSmooth
    annotation (Placement(transformation(extent={{0,-42},{20,-22}})));
  Modelica.Blocks.Continuous.FirstOrder smoothFiltered(T=0.00001, y_start=0.2)
    annotation (Placement(transformation(extent={{-20,-18},{0,2}})));
  Modelica.Blocks.Continuous.Der derSmoothFiltered
    annotation (Placement(transformation(extent={{20,-18},{40,2}})));
equation
  connect(linearFiltered.u, linearNoise.y) annotation (Line(
      points={{-22,42},{-30,42},{-30,30},{-39,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(linearFiltered.y, derLinearFiltered.u) annotation (Line(
      points={{1,42},{18,42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(derLinear.u, linearNoise.y) annotation (Line(
      points={{-2,18},{-30,18},{-30,30},{-39,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(smoothFiltered.y, derSmoothFiltered.u) annotation (Line(
      points={{1,-8},{18,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(smoothFiltered.u, smoothNoise.y) annotation (Line(
      points={{-22,-8},{-32,-8},{-32,-20},{-39,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(derSmooth.u, smoothNoise.y) annotation (Line(
      points={{-2,-32},{-32,-32},{-32,-20},{-39,-20}},
      color={0,0,127},
      smooth=Smooth.None));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    __Dymola_experimentSetupOutput);
end Interpolation;
