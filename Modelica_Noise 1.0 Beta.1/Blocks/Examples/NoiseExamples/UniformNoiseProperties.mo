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
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{80,60},{100,80}})));
  Noise.GenericNoise noise(
    samplePeriod=0.001, redeclare replaceable function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=y_min, y_max=
            y_max),
    useAutomaticLocalSeed=false)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Math.ContinuousMean mean
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Math.Variance variance
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Modelica.Blocks.Math.MultiProduct theoreticalVariance(nu=2)
    annotation (Placement(transformation(extent={{28,-36},{40,-24}})));
  Modelica.Blocks.Math.Feedback meanError
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Blocks.Sources.Constant theoreticalMean(k=pMean)
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  Modelica.Blocks.Math.Feedback varianceError
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Blocks.Sources.Constant theoreticalSigma(k=std)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Math.StandardDeviation standardDeviation
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
 annotation (experiment(StopTime=20, Interval=0.4e-2, Tolerance=1e-009),
                                     Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(info="<html>
<p>
This example demonstrates statistical properties of the
<a href=\"modelica://Modelica_Noise.Blocks.Noise.GenericNoise\">Blocks.Noise.GenericNoise</a> block
using a <b>uniform</b> random number distribution. 
Block &quot;noise&quot; defines a band of 0 .. 6 and from the generated noise the mean and the variance
is computed with blocks of package <a href=\"modelica://Modelica_Noise.Blocks.Statistics\">Blocks.Statistics</a>.
Simulation results are shown in the next diagram: 
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/UniformNoiseProperties1.png\"/>
</blockquote></p>

<p>
The mean value of a uniform noise in the range 0 .. 6 is 3 and its variance is 
3 as well. The simulation results above show good agreement (after a short initial phase). 
This demonstrates that the random number generator and the mapping to a uniform
distribution have good statistical properties.
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
end UniformNoiseProperties;
