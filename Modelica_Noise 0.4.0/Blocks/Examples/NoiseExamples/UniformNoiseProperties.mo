within Modelica_Noise.Blocks.Examples.NoiseExamples;
model UniformNoiseProperties
  "Demonstrates the computation of properties for uniformally distributed noise"
  extends Modelica.Icons.Example;
  parameter Real y_min = 0;
  parameter Real y_max = 6;
  final parameter Real mean = (y_min + y_max)/2;
  final parameter Real var = (y_max - y_min)^2/12;
  final parameter Real sigma=sqrt(var);
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{80,70},{100,90}})));
  Noise.EventBasedNoise uniformNoise(
    samplePeriod=0.001,
    y_min=y_min,
    y_max=y_max)
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
  Modelica.Blocks.Sources.Constant realSigma(k=sigma*sqrt(uniformNoise.interpolation.varianceFactor))
annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
  Statistics.StandardDeviation standardDeviation
annotation (Placement(transformation(extent={{-42,-40},{-22,-20}})));
  Modelica.Blocks.Math.Feedback sigmaError
    annotation (Placement(transformation(extent={{40,-20},{60,-40}})));
equation
  connect(uniformNoise.y, continuousMean.u) annotation (Line(
      points={{-59,80},{-42,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uniformNoise.y, variance.u) annotation (Line(
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
  connect(uniformNoise.y, standardDeviation.u) annotation (Line(
      points={{-59,80},{-52,80},{-52,-30},{-44,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(standardDeviation.y, sigmaError.u1) annotation (Line(
      points={{-21,-30},{42,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(realSigma.y, sigmaError.u2) annotation (Line(
  points={{3,0},{10,0},{10,-12},{50,-12},{50,-22}},
  color={0,0,127},
  smooth=Smooth.None));
 annotation (experiment(StopTime=20, __Dymola_NumberOfIntervals=5000),
                                     Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<p>
Variance and standard deviation are only correctly computed for constant interpolation
(for linear and smooth interpolation there is an offset):
</p>
</html>"));
end UniformNoiseProperties;
