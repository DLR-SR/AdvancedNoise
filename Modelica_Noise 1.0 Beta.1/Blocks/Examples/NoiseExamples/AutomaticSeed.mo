within Modelica_Noise.Blocks.Examples.NoiseExamples;
model AutomaticSeed
  "Demonstrates noise with startTime and automatic local seed for GenericNoise"
  import Modelica_Noise;
   extends Modelica.Icons.Example;
   parameter Real startTime = 0.5 "Start time of noise";
   parameter Real y_off = -1.0 "Output of block before startTime";

  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false, enableNoise=true)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  Modelica_Noise.Blocks.Noise.GenericNoise automaticSeed1(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica_Noise.Blocks.Noise.GenericNoise automaticSeed2(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica_Noise.Blocks.Noise.GenericNoise automaticSeed3(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica_Noise.Blocks.Noise.GenericNoise manualSeed1(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=1,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3),
    enableNoise=true)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica_Noise.Blocks.Noise.GenericNoise manualSeed2(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=2,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica_Noise.Blocks.Noise.GenericNoise manualSeed3(
    samplePeriod=0.01,
    startTime=startTime,
    y_off=y_off,
    useAutomaticLocalSeed=false,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3),
    fixedLocalSeed=3)
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
 annotation (experiment(StopTime=2),    Documentation(info="<html>
<p>
This example demonstrates manual and automatic seed selection of
<a href=\"Modelica_Noise.Blocks.Noise.GenericNoise\">GenericNoise</a> blocks, as well
as starting the noise at startTime = 0.5 s with an output value of y = -1 before this
time. All noise blocks in this example generate uniform noise in the
band y_min=-1 .. y_max=3 with samplePeriod = 0.01 s.
</p>

<p>
The blocks automaticSeed1, automaticSeed2, automaticSeed3 use the default
option to automatically initialize the pseudo random number generators
of the respective block. As a result, different noise is generated, see next
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
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> June 22, 2015 </td>
    <td valign=\"top\">

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\">
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end AutomaticSeed;
