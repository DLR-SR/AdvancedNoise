within Modelica_Noise.Blocks.Examples.NoiseExamples;
model Densities
  "Demonstrates how to compute distribution densities (= Probability Density Function)"
  extends Modelica.Icons.Example;

  Statistics.Density uniformDensity(redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.density (
        u_min=-4,
        u_max=4))
annotation (Placement(transformation(extent={{10,20},{30,40}})));
  Modelica.Blocks.Sources.Clock clock
annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  Modelica.Blocks.Sources.Constant const(k=-10)
annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  Modelica.Blocks.Math.Add add
annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  Statistics.Density normalDensity(redeclare function distribution =
        Modelica_Noise.Math.Distributions.Normal.density (mu=0, sigma=2))
annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Statistics.Density weibullDensity(redeclare function distribution =
        Modelica_Noise.Math.Distributions.Weibull.density (k=1.5, lambda=3))
annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
equation
  connect(clock.y, add.u1) annotation (Line(
  points={{-59,20},{-53.5,20},{-53.5,6},{-48,6}},
  color={0,0,127},
  smooth=Smooth.None));
  connect(const.y, add.u2) annotation (Line(
  points={{-59,-20},{-54,-20},{-54,-6},{-48,-6}},
  color={0,0,127},
  smooth=Smooth.None));
  connect(add.y, uniformDensity.u) annotation (Line(
  points={{-25,0},{-14,0},{-14,30},{8,30}},
  color={0,0,127},
  smooth=Smooth.None));
  connect(add.y, normalDensity.u) annotation (Line(
  points={{-25,0},{8,0}},
  color={0,0,127},
  smooth=Smooth.None));
  connect(add.y, weibullDensity.u) annotation (Line(
  points={{-25,0},{-14,0},{-14,-30},{8,-30}},
  color={0,0,127},
  smooth=Smooth.None));
 annotation (experiment(StopTime=20, Interval=2e-2),
                                     Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p>
This example demonstrates how to compute the probability density functions (pdfs) of
various distributions, by using the block
<a href=\"modelica://Modelica_Noise.Blocks.Statistics.Density\">Blocks.Statistics.Density</a>.
In the following diagram simulations results for the uniform, normal, and Weibull distribution
are shown. The outputs of the blocks are the pdfs that are plotted over one of the
inputs:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/Densities.png\">
</blockquote></p>
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
end Densities;
