within Modelica_Noise.Blocks.Examples.NoiseExamples;
model UniformNoiseProperties
  "Demonstrates the computation of properties for uniformally distributed noise"
  extends Modelica.Icons.Example;
  parameter Real y_min = 0;
  parameter Real y_max = 6;
  parameter Real mean = (y_min + y_max)/2;
  parameter Real var =  (y_max - y_min)^2/12;
  parameter Real std =  sqrt(var);
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{80,60},{100,80}})));
  Noise.EventBasedNoise noise(
    samplePeriod=0.001,
    y_min=y_min,
    y_max=y_max)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Statistics.ContinuousMean continuousMean
annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Statistics.Variance variance
annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Modelica.Blocks.Math.MultiProduct product(nu=2)
    annotation (Placement(transformation(extent={{28,-36},{40,-24}})));
  Modelica.Blocks.Math.Feedback meanError
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Blocks.Sources.Constant theoreticalMean(k=mean)
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  Modelica.Blocks.Math.Feedback varianceError
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Blocks.Sources.Constant theoreticalSigma(k=std*sqrt(noise.interpolation.varianceFactor))
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Statistics.StandardDeviation standardDeviation
annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Modelica.Blocks.Math.Feedback sigmaError
    annotation (Placement(transformation(extent={{40,-60},{60,-80}})));
equation
  connect(noise.y, continuousMean.u) annotation (Line(
      points={{-59,70},{-42,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise.y, variance.u) annotation (Line(
      points={{-59,70},{-52,70},{-52,10},{-42,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(continuousMean.y, meanError.u1) annotation (Line(
      points={{-19,70},{42,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theoreticalMean.y, meanError.u2) annotation (Line(
      points={{11,50},{50,50},{50,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theoreticalSigma.y, product.u[1]) annotation (Line(
      points={{11,-30},{24,-30},{24,-27.9},{28,-27.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theoreticalSigma.y, product.u[2]) annotation (Line(
      points={{11,-30},{24,-30},{24,-32.1},{28,-32.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(variance.y, varianceError.u1) annotation (Line(
      points={{-19,10},{42,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product.y, varianceError.u2) annotation (Line(
      points={{41.02,-30},{50,-30},{50,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise.y, standardDeviation.u) annotation (Line(
      points={{-59,70},{-52,70},{-52,-70},{-42,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(standardDeviation.y, sigmaError.u1) annotation (Line(
      points={{-19,-70},{42,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theoreticalSigma.y, sigmaError.u2) annotation (Line(
      points={{11,-30},{18,-30},{18,-42},{50,-42},{50,-62}},
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
