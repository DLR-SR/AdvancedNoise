within Modelica_Noise.Blocks.Examples.NoiseExamples;
model Interpolation
  "Demonstrates different types of interpolations for the noise and computing the derivative of noise"
  extends Modelica.Icons.Example;
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Blocks.Noise.TimeBasedNoise constantNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Interpolators.Constant,
    y_min=-1,
    y_max=3) annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Blocks.Noise.TimeBasedNoise linearNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Interpolators.Linear)
             annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Blocks.Noise.TimeBasedNoise smoothNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Interpolators.SmoothIdealLowPass,
    y_min=-1,
    y_max=3,
    sampleFactor=10)
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(info="<html>
<p>This example demonstrates the different interpolation methods that can be selected for a Noise block.All the blocks use samplePeriod = 0.1 s and generated uniform noise in the band y_min=-1 .. y_max=3. Furhtermore, all blocks use the same fixedLocalSeed, so all blocks generate exactly the same random numbers at the sample instants 0 s, 0.1 s, 0.2 s, ... However, these values are differently interpolated as shown in the next diagram: </p>
<blockquote><img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/Interpolation1.png\"/> </blockquote>
<p>As can be seen, constant (constantNoise.y) and linear (linearNoise.y) interpolation respects the defined band -1 .. 3. Instead, smooth interpolation with the sinc function (smoothNoise.y) may violate the band slightly in order to be able to smoothly interpolate the random values at the sample instants. In practical applications, this is not an issue because the exact band of the noise is usually not exactly known. </p>
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
end Interpolation;
