within Modelica_Noise.Blocks.Examples.NoiseExamples;
model SignalInterpolation
  "Demonstrates signal-based noise with different interpolations"
  import Modelica_Noise;
   extends Modelica.Icons.Example;
   parameter Real startTime = 0.5;
   parameter Real y_off = -1.0;

  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false, enableNoise=true)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  Modelica_Noise.Blocks.Noise.SignalBasedNoise constantNoise(
    useTime=false,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Constant,
    samplePeriod=0.01,
    y_min=-1,
    y_max=+1,
    useAutomaticLocalSeed=false)
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Modelica.Blocks.Continuous.Der derLinear
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Modelica.Blocks.Sources.RealExpression signal(y=sin(time*5))
    annotation (Placement(transformation(extent={{-100,70},{-80,90}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise linearNoise(
    useTime=false,
    samplePeriod=0.01,
    y_min=-1,
    y_max=+1,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Linear,
    useAutomaticLocalSeed=false)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise smoothNoise(
    useTime=false,
    samplePeriod=0.01,
    y_min=-1,
    y_max=+1,
    useAutomaticLocalSeed=false,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass)
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Modelica.Blocks.Continuous.Der derSmooth
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
equation
  connect(signal.y, constantNoise.u) annotation (Line(
      points={{-79,80},{-62,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(linearNoise.u, signal.y) annotation (Line(
      points={{-62,30},{-72,30},{-72,80},{-79,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(smoothNoise.u, signal.y) annotation (Line(
      points={{-62,-20},{-72,-20},{-72,80},{-79,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(linearNoise.y, derLinear.u) annotation (Line(
      points={{-39,30},{-22,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(smoothNoise.y, derSmooth.u) annotation (Line(
      points={{-39,-20},{-22,-20}},
      color={0,0,127},
      smooth=Smooth.None));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end SignalInterpolation;
