within AdvancedNoise.Examples;
model VaryingDistribution "Shows how distributions can vary in time"
  extends Modelica.Icons.Example;
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Real t = time;
  Sources.TimeBasedNoise discreteNoise(samplePeriod=0.001, redeclare function
      distribution = Distributions.Discrete.quantile (p=if t < 1 then {0.2,0.8}
             else {0.8,0.2}))
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Blocks.Math.ContinuousMean continuousMean
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
equation
  connect(continuousMean.u, discreteNoise.y)
    annotation (Line(points={{18,10},{1,10}}, color={0,0,127}));
  annotation (experiment(StopTime=10), Documentation(info="<html>

<p>
This example shows, how the distribution parameters can vary during the simulation.
Noise is generated with a discrete distribution:
1 will be drawn 80% of the time and 0 will be drawn 20% of the time.
After 1s of simulation, the probabilities are exchanged.
This can be seen in the random numbers generated, as well as in the mean estimation:
</p>

<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/VaryingDistribution.png\">

</html>", revisions="<html>
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
end VaryingDistribution;
