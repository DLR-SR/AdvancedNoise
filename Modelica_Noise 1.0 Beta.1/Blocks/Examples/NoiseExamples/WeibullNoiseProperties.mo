within Modelica_Noise.Blocks.Examples.NoiseExamples;
model WeibullNoiseProperties
  "Demonstrates the computation of properties for Weibull distributed noise"
  extends UniformNoiseProperties(pMean = 1, var = 1,
          noise(redeclare function distribution =
          Modelica_Noise.Math.Distributions.Weibull.quantile (
          lambda=lambda,
          k=k)),
        y_min = 0, y_max = Modelica.Constants.inf);

  parameter Real k = 1 "Shape parameter";
  parameter Real lambda = 1 "Scale parameter";

 annotation (experiment(StopTime=20, Interval=0.4e-2, Tolerance=1e-009),
                                     Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
Documentation(info="<html>
<p>
This example demonstrates statistical properties of the
<a href=\"modelica://Modelica_Noise.Blocks.Noise.GenericNoise\">Blocks.Noise.GenericNoise</a> block
using a <b>Weibull</b> random number distribution with lambda=1, k=1. 
From the generated noise the mean and the variance
is computed with blocks of package <a href=\"modelica://Modelica_Noise.Blocks.Statistics\">Blocks.Statistics</a>.
Simulation results are shown in the next diagram: 
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/WeibullNoiseProperties1.png\">
</blockquote></p>

<p>
The mean value of Weibull noise with lambda=1 and k=1 is 1 and the variance is also 1.
The simulation results above show good agreement (after a short initial phase). 
This demonstrates that the random number generator and the mapping to a Weibull
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
end WeibullNoiseProperties;
