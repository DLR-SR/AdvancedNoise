within AdvancedNoise.Examples;
model SignalBasedNoise "Demonstrates the a simple case of signal based noise"
   extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Radius r = 1 "Radius of circle";
  constant Real pi = Modelica.Constants.pi "Constant pi";
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  AdvancedNoise.Sources.SignalBasedNoise signalBasedNoise(
    useTime=false,
    samplePeriod=0.5,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile (y_min=-0.05, y_max=
            0.05))
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Blocks.Sources.RealExpression pathParameter(y=r*mod(2*pi*time, 2*pi))
    annotation (Placement(transformation(extent={{-72,0},{-40,20}})));
equation
  connect(pathParameter.y, signalBasedNoise.u) annotation (Line(
      points={{-38.4,10},{-22,10}},
      color={0,0,127},
      smooth=Smooth.None));
 annotation (experiment(StopTime=4), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    Documentation(info="<html>
<p>
This example demonstrates a simple use of the signal based noise block:
</p>

<ul>
<li> The input to block <b>signalBasedNoise</b> is the path parameter of a circle: The path parameter s
     starts at s=0 and continuously increases until it arrives at s=2*pi*r at the same point again
     (default: r=1).
     The simulation scenario is defined so that the path parameter increases with time until it reaches
     s=2*pi*r at every second and then the path parameter is reset to s=0.</li>
<li> The signalBasedNoise block defines a noise band of -0.05 .. 0.05. This could be interpreted as 
     the height of a rough circle surface. A sample period of 0.5 in the input (so in the path parameter)
     is used. This means that along the circle 2*pi*r / 0.5 + 1 random values are drawn.</li>
</ul>

<p>
The result of a simulation is show in the next diagram. It can be clearly seen that the
noise repeats after every second (when the path parameter is reset to s=0):
</p>

<p><blockquote>
<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/SignalBasedNoise.png\">
</blockquote>
</p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end SignalBasedNoise;
