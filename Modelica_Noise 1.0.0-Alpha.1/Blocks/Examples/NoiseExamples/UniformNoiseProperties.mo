within Modelica_Noise.Blocks.Examples.NoiseExamples;
model UniformNoiseProperties
  "Demonstrates the computation of properties for uniformally distributed noise"
  extends Modelica.Icons.Example;
  parameter Real y_min = 0 "Minimum value of band";
  parameter Real y_max = 6 "Maximum value of band";
  parameter Real pMean = (y_min + y_max)/2
    "Theoretical mean value of uniform distribution";
  parameter Real var =  (y_max - y_min)^2/12
    "Theoretical variance of uniform distribution";
  parameter Real std =  sqrt(var)
    "Theoretical standard deviation of uniform distribution";
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{80,60},{100,80}})));
  Noise.TimeBasedNoise noise(
    samplePeriod=0.001,
    y_min=y_min,
    y_max=y_max,
    redeclare replaceable package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Linear)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Statistics.ContinuousMean mean
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Statistics.Variance variance
annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Modelica.Blocks.Math.MultiProduct theoreticalVariance(nu=2)
    annotation (Placement(transformation(extent={{28,-36},{40,-24}})));
  Modelica.Blocks.Math.Feedback meanError
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Blocks.Sources.Constant theoreticalMean(k=pMean)
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
  connect(noise.y, mean.u) annotation (Line(
      points={{-59,70},{-42,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise.y, variance.u) annotation (Line(
      points={{-59,70},{-52,70},{-52,10},{-42,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mean.y, meanError.u1) annotation (Line(
      points={{-19,70},{42,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theoreticalMean.y, meanError.u2) annotation (Line(
      points={{11,50},{50,50},{50,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theoreticalSigma.y, theoreticalVariance.u[1]) annotation (Line(
      points={{11,-30},{24,-30},{24,-27.9},{28,-27.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theoreticalSigma.y, theoreticalVariance.u[2]) annotation (Line(
      points={{11,-30},{24,-30},{24,-32.1},{28,-32.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(variance.y, varianceError.u1) annotation (Line(
      points={{-19,10},{42,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(theoreticalVariance.y, varianceError.u2) annotation (Line(
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
This example demonstrates statistical properties of time based noise using a <b>uniform</b>
random number distribution. Block \"noise\" defines a band of 0 .. 6 and from the generated
noise the mean and the variance is computed. In a first experiment, constant interpolation
is choosen. Simulation results are shown in the next diagram:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/UniformNoiseProperties1.png\">
</blockquote></p>

<p>
The mean value of a uniform noise in the range 0 .. 6 is 3 and the variance of a uniform noise is
half of the band, so 3 as well. The simulation results above show good agreement.
</p>

<p> 
In a second example linear interpolation is used instead. Since the signal is no longer
random between two sample instants (but changes linearly between two random values), the 
statistical properties might be different: In fact, it can be shown that the mean value
still remains the same (so 3 in the example), but the variance of the linearly interpolated
signal is only 2/3 of the constantly interpolated signal (so 2 in the example).
Simulation results are shown in the next diagram, with good agreement for the mean value
and reasonable agreement for the variance:
</p>


<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/UniformNoiseProperties2.png\">
</blockquote></p>
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
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end UniformNoiseProperties;
