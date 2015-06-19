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

 annotation (experiment(StopTime=20, NumberOfIntervals=5000, Tolerance=1e-009),
                                     Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
Documentation(info="<html>
<p>
This example demonstrates statistical properties of time based noise using a (truncated)
<b>normal</b> random number distribution with mu=3, sigma=1.
Block \"noise\" defines a band of 0 .. 6 and from the generated
noise the mean and the variance is computed. In a first experiment, constant interpolation
is chosen. Simulation results are shown in the next diagram:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/NormalNoiseProperties1.png\">
</blockquote></p>

<p>
The mean value of a truncated normal noise in the range 0 .. 6 with mu=3 is 3 and the variance of 
normal noise is sigma^2, so 1. The simulation results above show good agreement.
</p>

<p> 
In a second example linear interpolation is used instead. Since the signal is no longer
random between two sample instants (but changes linearly between two random values), the 
statistical properties might be different: In fact, it can be shown that the mean value
still remains the same (so 3 in the example), but the variance of the linearly interpolated
signal is only 2/3 of the constantly interpolated signal (so 1*2/3 = 0.66 in the example
above). Simulation results are shown in the next diagram, with good agreement for the
mean value and not so good agreement for the variance (the agreement of the variance
becomes better for smaller relative tolerances):
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/NormalNoiseProperties2.png\">
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
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end WeibullNoiseProperties;
