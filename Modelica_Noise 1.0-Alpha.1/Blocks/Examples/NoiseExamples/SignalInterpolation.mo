within Modelica_Noise.Blocks.Examples.NoiseExamples;
model SignalInterpolation
  "Demonstrates signal-based noise with different interpolations"
  import Modelica_Noise;
   extends Modelica.Icons.Example;
   parameter Real startTime = 0.5;
   parameter Real y_off = -1.0;
   constant Real pi = Modelica.Constants.pi "Constant pi";

  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false, enableNoise=true)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  Modelica_Noise.Blocks.Noise.SignalBasedNoise constantNoise(
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Constant,
    y_min=-1,
    y_max=+1,
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    useTime=false)
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Modelica.Blocks.Sources.RealExpression signal(y=sin(pi*time))
    annotation (Placement(transformation(extent={{-100,70},{-80,90}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise linearNoise(
    useTime=false,
    y_min=-1,
    y_max=+1,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Linear,
    useAutomaticLocalSeed=false,
    samplePeriod=0.1)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise smoothNoise(
    useTime=false,
    y_min=-1,
    y_max=+1,
    useAutomaticLocalSeed=false,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass,
    samplePeriod=0.1)
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
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
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    Documentation(info="<html>
<p>
This example demonstrates the  
<a href=\"modelica://Modelica_Noise.Blocks.Noise.SignalBasedNoise\">Blocks.Noise.SignalBasedNoise</a>
block by using various interpolation methods. The input to the blocks is a sine and
the argument of the sine, as well as the sample periods of the blocks are selected in such a way
that a sample instant hits the sine for every full period.
Therefore, the noise is repeated after every full period of the sine.
The result of a simulation is show in the next diagram, plotting the (noise) output of the
blocks over the sine output:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/SignalInterpolation.png\">
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
end SignalInterpolation;
