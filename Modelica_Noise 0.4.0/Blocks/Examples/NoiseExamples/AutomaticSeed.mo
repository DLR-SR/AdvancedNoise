within Modelica_Noise.Blocks.Examples.NoiseExamples;
model AutomaticSeed
  "Demonstrates noise with startTime and automatic local seed"
  import Modelica_Noise;
   extends Modelica.Icons.Example;
   parameter Real startTime = 0.5;
   parameter Real y_off = -1.0;

  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false, enableNoise=true)
    annotation (Placement(transformation(extent={{0,40},{20,60}})));

  Modelica_Noise.Blocks.Noise.EventBasedNoise eventBasedNoise1(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    y_min=-1,
    y_max=3,
enableNoise=true)
                 annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica_Noise.Blocks.Noise.EventBasedNoise eventBasedNoise2(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    y_min=-1,
    y_max=3)     annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica_Noise.Blocks.Noise.EventBasedNoise eventBasedNoise3(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    y_min=-1,
    y_max=3)     annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end AutomaticSeed;
