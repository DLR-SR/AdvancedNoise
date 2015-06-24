within Modelica_Noise.Blocks.Examples.NoiseExamples;
model NormalNoiseProperties
  "Demonstrates the computation of properties for normally distributed noise"
  extends UniformNoiseProperties(pMean = mu, var = sigma^2,
          noise(redeclare function distribution =
          Modelica_Noise.Math.Distributions.Normal.quantile(mu=mu,sigma=sigma)));

  parameter Real mu = 3 "Mean value for normal distribution";
  parameter Real sigma = 1 "Standard deviation for normal distribution";

 annotation (experiment(StopTime=20, Interval=0.4e-2, Tolerance=1e-009),
                                     Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
Documentation(info="<html>
<p>
This example demonstrates statistical properties of the
<a href=\"modelica://Modelica_Noise.Blocks.Noise.GenericNoise\">Blocks.Noise.GenericNoise</a> block
using a <b>normal</b> random number distribution with mu=3, sigma=1. 
From the generated noise the mean and the variance
is computed with blocks of package <a href=\"modelica://Modelica_Noise.Blocks.Statistics\">Blocks.Statistics</a>.
Simulation results are shown in the next diagram: 
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/NormalNoiseProperties1.png\">
</blockquote></p>

<p>
The mean value of a normal noise with mu=3 is 3 and the variance of normal noise 
is sigma^2, so 1. The simulation results above show good agreement (after a short initial phase). 
This demonstrates that the random number generator and the mapping to a normal
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
end NormalNoiseProperties;
