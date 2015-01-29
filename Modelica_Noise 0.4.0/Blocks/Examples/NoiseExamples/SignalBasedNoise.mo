within Modelica_Noise.Blocks.Examples.NoiseExamples;
model SignalBasedNoise
  "Demonstrates noise with startTime and automatic local seed"
  import Modelica_Noise;
   extends Modelica.Icons.Example;
   parameter Real startTime = 0.5;
   parameter Real y_off = -1.0;

  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false, enableNoise=true)
    annotation (Placement(transformation(extent={{0,40},{20,60}})));

  Modelica_Noise.Blocks.Noise.SignalBasedNoise signalBasedNoise(
    useTime=false,
    redeclare function distribution =
        Modelica_Noise.Math.Random.TruncatedQuantiles.weibull,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Linear)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.Clock clock(offset=0)
    annotation (Placement(transformation(extent={{-84,-6},{-64,14}})));
  Modelica.Blocks.Continuous.Der der1
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(clock.y, signalBasedNoise.u) annotation (Line(
      points={{-63,4},{-42,4},{-42,0},{-22,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(signalBasedNoise.y, der1.u) annotation (Line(
      points={{1,0},{38,0}},
      color={0,0,127},
      smooth=Smooth.None));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end SignalBasedNoise;
