within AdvancedNoise.Examples;
model TimeBasedNoise "Demonstrates the a simple case of a timel based noise"
  extends Modelica.Icons.Example;

  parameter Modelica.SIunits.Radius r = 1 "Radius of circle";
  constant Real pi = Modelica.Constants.pi "Constant pi";

  inner Modelica.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Sources.TimeBasedNoise timeBasedNoise(
    redeclare function distribution = Modelica.Math.Distributions.Uniform.quantile (
      y_min=-1, y_max=3),
    samplePeriod=0.05)
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Sources.TimeBasedNoise timeBasedNoise1(
    redeclare function distribution = Modelica.Math.Distributions.Uniform.quantile (
      y_min=-1, y_max=3),
    samplePeriod=0.05)
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));

  annotation (
    experiment(StopTime=4),
    Documentation(
      info="<html>
<p>
This example demonstrates a simple use of the time based noise block.
The result of a simulation is show in the next diagram. Both the noise
blocks give different results due to the automatic seeding of the blocks:
</p>

<blockquote>
<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/TimeBasedNoise.png\" alt=\"Diagram TimeBasedNoise.png\">
</blockquote>
</html>",
      revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      <b>Copyright</b> <b>&copy; DLR Institute of System Dynamics and Control</b><br>
      Initial version implemented by
      A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
      <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>"));
end TimeBasedNoise;
