within Modelica_Noise.Blocks.Examples.NoiseExamples;
model AutomaticSeed
  "Demonstrates noise with startTime and automatic local seed for TimeBasedNoise"
  import Modelica_Noise;
   extends Modelica.Icons.Example;
   parameter Real startTime = 0.5 "Start time of noise";
   parameter Real y_off = -1.0 "Output of block before startTime";

  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false, enableNoise=true)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  Modelica_Noise.Blocks.Noise.TimeBasedNoise automaticSeed1(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    y_min=-1,
    y_max=3,
    enableNoise=true)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise automaticSeed2(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    y_min=-1,
    y_max=3) annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise automaticSeed3(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    y_min=-1,
    y_max=3)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise manualSeed1(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    y_min=-1,
    y_max=3,
    enableNoise=true,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=1)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise manualSeed2(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    y_min=-1,
    y_max=3,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=2)
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise manualSeed3(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    y_min=-1,
    y_max=3,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=3)
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    Documentation(info="<html>
<p>
This example demonstrates manual and automatic seed selection of
<a href=\"Modelica_Noise.Blocks.Noise.TimeBasedNoise\">TimeBasedNoise</a> blocks, as well
as starting the noise at startTime = 0.5 s with an output value of y = -1 before this
time. All noise blocks in this example generate linearly interpolated uniform noise in the
band y_min=-1 .. y_max=3 with samplePeriod = 0.01 s.
</p>

<p>
The blocks automaticSeed1, automaticSeed2, automaticSeed3 use the default
option to automatically initialize the pseudo random number generators
of the respective block by using a hash value
of the instance name. As a result, different noise is generated, see next
diagram:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/AutomaticSeed1.png\">
</blockquote></p>

<p>
The blocks manualSeed1, manualSeed2, manualSeed3 use manual selection of the local seed
(useAutomaticLocalSeed = false). They use a fixedLocalSeed of 1, 2, and 3 respectively.
Again, different noise is generated, see next diagram:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/AutomaticSeed2.png\">
</blockquote></p>

<p>
Try to set fixedLocalSeed = 1 in block manualSeed2. As a result, the blocks manualSeed1 and
manualSeed2 will produce exactly the same noise.
</p>
</html>"));
end AutomaticSeed;
