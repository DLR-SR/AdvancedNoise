within AdvancedNoise.Examples;
model FaultTrigger "Demonstrates using the fault trigger model"
  extends Modelica.Icons.Example;
  Statistics.FaultTrigger faultTrigger
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Modelica.Blocks.Sources.Constant failureRate(k=10)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=true)
    annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
  Modelica.Blocks.MathInteger.TriggeredAdd countFaults(use_reset=false, use_set=false) annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Blocks.Sources.IntegerExpression one(y=1)
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  Modelica.Blocks.Sources.RealExpression reconstructedFailureRate(y=if
        countFaults.y < 1 then 0 else countFaults.y/time)
    "The failure rate reconstructed from the simulation"
    annotation (Placement(transformation(extent={{-20,-20},{80,0}})));
equation
  connect(failureRate.y, faultTrigger.u)
    annotation (Line(points={{-59,30},{-59,30},{-22,30}}, color={0,0,127}));
  connect(faultTrigger.y, countFaults.trigger) annotation (Line(points={{1,30},
          {12,30},{24,30},{24,58}}, color={255,0,255}));
  connect(one.y, countFaults.u)
    annotation (Line(points={{1,70},{8,70},{16,70}}, color={255,127,0}));
  annotation (experiment(StopTime=10), Documentation(info="<html>

The example uses the <a href=\"Statistics.FaultTrigger\">FaultTrigger</a> model to simulate failures of a component with a given failure rate.
The resulting failure rate compares well to the theoretical value.
See image below:

<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/FaultTrigger.png\">

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
end FaultTrigger;
