within Modelica_Noise.Blocks.Examples.NoiseExamples;
model TimeBasedNoise
  "Demonstrates the most simplest usage of time based noise blocks"
   extends Modelica.Icons.Example;

  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise timeBasedNoise(
    samplePeriod=0.02,
    y_min=-1,
    y_max=3) annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise signalBasedNoise(
    samplePeriod=0.02,
    y_min=-1,
    y_max=3) annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    Documentation(info="<html>
<p>
This example demonstrates the most simplest usage of time based noise blocks:
</p>

<ul>
<li> <b>globalSeed</b> is the <a href=\"modelica://Modelica_Noise.Blocks.Noise.GlobalSeed\">Noise.GlobalSeed</a>
     with default options (just dragged from sublibrary Noise).</li>
<li> <b>timeBasedNoise</b> is an instance of
     <a href=\"modelica://Modelica_Noise.Blocks.Noise.TimeBasedNoise\">Noise.TimeBasedNoise</a> with default options,
     with exception of the explicit setting of parameters: samplePeriod=0.02, y_min=-1, y_max=3.</li>
<li> <b>signalBasedNoise</b> is an instance of
     <a href=\"modelica://Modelica_Noise.Blocks.Noise.SignalBasedNoise\">Noise.SignalBasedNoise</a> with default options,
     with exception of the explicit setting of parameters: samplePeriod=0.02, y_min=-1, y_max=3. Note,
     the default behavior of this block is that no input connector is present, and instead \"time\" is used as \"signal\",
     so also a time-based noise is generated.</li>
</ul>

<p>
For both blocks, linearly interpolated, uniform noise in a band between -1 ... 3 is generated.
The samplePeriod defines the highest frequency f contained in the noise: f = 1/0.02 = 50 Hz.
The default behavior uses no events for the signalBasedNoise and an event at every hundreds
sample point for the timeBasedNoise block (so time events occur only at 0 s and 2 s).
The result of a simulation is show in the next diagram:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/TimeBasedNoise.png\">
</blockquote>
</p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
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
end TimeBasedNoise;
