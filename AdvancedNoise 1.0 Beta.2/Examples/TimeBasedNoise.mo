within AdvancedNoise.Examples;
model TimeBasedNoise "Demonstrates the a simple case of a timel based noise"
   extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Radius r = 1 "Radius of circle";
  constant Real pi = Modelica.Constants.pi "Constant pi";
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Sources.TimeBasedNoise timeBasedNoise(
    y_min=-0.05,
    y_max=0.05,
    samplePeriod=0.5)
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Sources.TimeBasedNoise timeBasedNoise1(
    y_min=-0.05,
    y_max=0.05,
    samplePeriod=0.5)
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
 annotation (experiment(StopTime=4), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    Documentation(info="<html>
<p>This example demonstrates a simple use of the time based noise block. The result of a simulation is show in the next diagram. Both the noise blocks give different results due to the automatic seeding of the blocks: </p>
<blockquote><img src=\"modelica://AdvancedNoise/Resources/Images/Examples/TimeBasedNoise.png\"/> </blockquote>
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
end TimeBasedNoise;
