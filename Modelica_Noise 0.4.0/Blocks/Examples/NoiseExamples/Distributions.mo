within Modelica_Noise.Blocks.Examples.NoiseExamples;
model Distributions "Demonstrates noise with different types of distributions"
  extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Time samplePeriod=0.02
    "Sample period of all blocks";
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
               annotation (Placement(transformation(extent={{40,60},{60,80}})));

               Integer n=if time < 0.5 then 12 else 2;
  Noise.TimeBasedNoise uniformNoise(
    y_min=-1,
    y_max=3,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=1,
    samplePeriod=samplePeriod)
             annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Noise.TimeBasedNoise normalNoise(
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Normal.quantile,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=1,
    samplePeriod=samplePeriod)
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Noise.TimeBasedNoise weibullNoise(
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Weibull.quantile,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=1,
    samplePeriod=samplePeriod)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Statistics.ContinuousMean normalMean
annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  Noise.TimeBasedNoise discreteNoise(
    samplePeriod=0.01,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Discrete.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Constant)
    annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Statistics.ContinuousMean discreteMean
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
equation
  connect(normalNoise.y, normalMean.u) annotation (Line(
  points={{-39,40},{-22,40}},
  color={0,0,127},
  smooth=Smooth.None));
  connect(discreteNoise.y, discreteMean.u) annotation (Line(
      points={{-39,-40},{-22,-40}},
      color={0,0,127},
      smooth=Smooth.None));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<p>
This example demonstrates different noise distributions methods that can be selected
for a Noise block. All the blocks use samplePeriod = 0.02 s, y_min=-1, y_max=3, and have
identical fixedLocalSeed. This means that the same random numbers are drawn for the blocks.
However, the random numbers are differently transformed according to the selected
truncated distributions, and therefore the blocks have different output values.
Simulation results are shown in the next diagram:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/Distributions.png\">
</blockquote></p>
</html>"));
end Distributions;
