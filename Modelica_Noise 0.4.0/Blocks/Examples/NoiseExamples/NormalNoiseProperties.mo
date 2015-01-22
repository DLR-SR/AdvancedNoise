within Modelica_Noise.Blocks.Examples.NoiseExamples;
model NormalNoiseProperties
  "Demonstrates the computation of properties for normally distributed noise"
  extends Modelica.Icons.Example;
  parameter Real sigma = 1;
  parameter Real y_min = 0;
  parameter Real mean = 3;
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{80,70},{100,90}})));
  Noise.EventBasedNoise normalNoise(
    samplePeriod=0.001,
    y_min=y_min,
    y_max=y_min+2*mean,
    redeclare function distribution =
        Modelica_Noise.Math.Random.TruncatedQuantiles.normal (sigma=sigma))
annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  Statistics.ContinuousMean continuousMean
annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
  Statistics.Variance variance
annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Math.MultiProduct product(nu=2)
    annotation (Placement(transformation(extent={{30,-6},{42,6}})));
  Modelica.Blocks.Math.Feedback meanError
    annotation (Placement(transformation(extent={{40,70},{60,90}})));
  Modelica.Blocks.Sources.Constant realMean(k=mean)
    annotation (Placement(transformation(extent={{-12,50},{8,70}})));
  Modelica.Blocks.Math.Feedback varianceError
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Blocks.Sources.Constant realSigma(k=sigma*sqrt(normalNoise.interpolation.varianceFactor))
    annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
  Statistics.StandardDeviation standardDeviation
annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Math.Feedback sigmaError
    annotation (Placement(transformation(extent={{40,-20},{60,-40}})));
equation
  connect(normalNoise.y, continuousMean.u) annotation (Line(
      points={{-59,80},{-42,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalNoise.y, variance.u) annotation (Line(
      points={{-59,80},{-52,80},{-52,30},{-42,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(continuousMean.y, meanError.u1) annotation (Line(
      points={{-19,80},{42,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realMean.y, meanError.u2) annotation (Line(
      points={{9,60},{50,60},{50,72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realSigma.y, product.u[1]) annotation (Line(
      points={{3,0},{16,0},{16,2.1},{30,2.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realSigma.y, product.u[2]) annotation (Line(
      points={{3,0},{16,0},{16,-2.1},{30,-2.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(variance.y, varianceError.u1) annotation (Line(
      points={{-19,30},{42,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product.y, varianceError.u2) annotation (Line(
      points={{43.02,0},{50,0},{50,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalNoise.y, standardDeviation.u) annotation (Line(
      points={{-59,80},{-52,80},{-52,-30},{-42,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(standardDeviation.y, sigmaError.u1) annotation (Line(
      points={{-19,-30},{42,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realSigma.y, sigmaError.u2) annotation (Line(
      points={{3,0},{16,0},{16,-10},{50,-10},{50,-22}},
      color={0,0,127},
      smooth=Smooth.None));
 annotation (experiment(StopTime=20, NumberOfIntervals=5000),
                                     Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
Documentation(info="<html>
<p>
Variance and standard deviation are only correctly computed for constant interpolation
(for linear and smooth interpolation there is an offset):
</p>
</html>"));
end NormalNoiseProperties;
