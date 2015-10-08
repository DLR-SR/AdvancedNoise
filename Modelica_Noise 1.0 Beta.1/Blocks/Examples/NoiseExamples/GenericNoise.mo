within Modelica_Noise.Blocks.Examples.NoiseExamples;
model GenericNoise
  "Demonstrates the most simple usage of the GenericNoise block"
  extends Modelica.Icons.Example;

  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Modelica_Noise.Blocks.Noise.GenericNoise genericNoise(
    samplePeriod=0.02, redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
 annotation (experiment(StopTime=2),    Documentation(info="<html>
<p>
This example demonstrates the most simple usage of the
<a href=\"modelica://Modelica_Noise.Blocks.Noise.GenericNoise\">Noise.GenericNoise</a>
block:
</p>

<ul>
<li> <b>globalSeed</b> is the <a href=\"modelica://Modelica_Noise.Blocks.Noise.GlobalSeed\">Noise.GlobalSeed</a>
     block with default options (just dragged from sublibrary Noise).</li>
<li> <b>genericNoise</b> is an instance of
     <a href=\"modelica://Modelica_Noise.Blocks.Noise.GenericNoise\">Noise.GenericNoise</a> with
     samplePeriod = 0.02 s and a Uniform distribution with limits y_min=-1, y_max=3.</li>
</ul>

<p>
At every 0.02 seconds a time event occurs and a uniform random number in the band between
-1 ... 3 is drawn. This random number is held constant until the next sample instant.
The result of a simulation is shown in the next diagram:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/GenericNoise.png\">
</blockquote>
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
end GenericNoise;
