within Modelica_Noise.Blocks.Examples.NoiseExamples;
model Interpolation
  "Demonstrates different types of interpolations for the noise and computing the derivative of noise"
  extends Modelica.Icons.Example;
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Noise.TimeBasedNoise constantNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Constant,
    y_min=-1,
    y_max=3) annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Noise.TimeBasedNoise linearNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3) annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Noise.TimeBasedNoise smoothNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass,
    y_min=-1,
    y_max=3,
    sampleFactor=10)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Continuous.Der derLinear
    annotation (Placement(transformation(extent={{0,8},{20,28}})));
  Modelica.Blocks.Continuous.Filter     linearFiltered(           y_start=0.2,
    f_cut=1e5,
    order=2)
    annotation (Placement(transformation(extent={{-20,32},{0,52}})));
  Modelica.Blocks.Continuous.Der derLinearFiltered
    annotation (Placement(transformation(extent={{20,32},{40,52}})));
  Modelica.Blocks.Continuous.Der derSmooth
    annotation (Placement(transformation(extent={{0,-52},{20,-32}})));
  Modelica.Blocks.Continuous.Filter     smoothFiltered(           y_start=0.2,
    f_cut=1e5,
    order=2)
    annotation (Placement(transformation(extent={{-20,-28},{0,-8}})));
  Modelica.Blocks.Continuous.Der derSmoothFiltered
    annotation (Placement(transformation(extent={{20,-28},{40,-8}})));
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
      points={{1,-18},{18,-18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(smoothFiltered.u, smoothNoise.y) annotation (Line(
      points={{-22,-18},{-32,-18},{-32,-30},{-39,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(derSmooth.u, smoothNoise.y) annotation (Line(
      points={{-2,-42},{-32,-42},{-32,-30},{-39,-30}},
      color={0,0,127},
      smooth=Smooth.None));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<p>
This example demonstrates the different interpolation methods that can be selected
for a Noise block.All the blocks use samplePeriod = 0.1 s and generated uniform
noise in the band y_min=-1 .. y_max=3. Furhtermore, all blocks use the same
fixedLocalSeed, so all blocks generate exactly the same random numbers at the sample
instants 0 s, 0.1 s, 0.2 s, ... However, these values are differently interpolated
as shown in the next diagram:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/Interpolation1.png\">
</blockquote></p>

<p>
As can be seen, constant (constantNoise.y) and linear (linearNoise.y) interpolation
respects the defined band -1 .. 3. 
Instead, smooth interpolation with the sinc function (smoothNoise.y) may violate the band
slightly in order to be able to smoothly interpolate the random values at the sample instants.
In practical applications, this is not an issue because the exact band of the noise
is usually not exactly known.
</p>

<p>
Linearly and smoothly interpolated noise can also be differentiated. This is demonstrated
by using the output of these Noise blocks as input of a
<a href=\"modelica://Modelica.Blocks.Continuous.Der\">Der</a> block (this blocks just applies the
<b>der</b>(..) operator to its input). In the next diagram, the exactly differentiated
linearly interpolated noise (= derLinear.y) is compared with the approach where the noise is first
low pass filtered (cut-off frequency = 1e5 Hz) and then differentiated (= derLinearFiltered.y):
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/Interpolation2.png\">
</blockquote></p>

<p>
In the next diagram, the exactly differentiated smoothly interpolated nosie (= derSmooth.y) 
is compared with the approach where the the noise is first
low pass filtered (cut-off frequency = 1e5 Hz) and then differentiated (= derSmoothFiltered.y):
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/Interpolation3.png\">
</blockquote>
</p>
</html>"));
end Interpolation;
