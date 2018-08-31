within AdvancedNoise.Statistics;
block AutoCorrelationTest
  "Tests the null hypothesis that a signal is uncorrelated with a given offset"
  extends Modelica.Blocks.Interfaces.SISO;

  parameter Modelica.SIunits.Time delta_t(min=0) = 0.1
    "Time delay for auto-correlation of signal";

  CorrelationTest correlationTest(correlation(delta_t=delta_t))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(correlationTest.u1, u) annotation (Line(points={{-12,6},{-60,6},{-60,
          0},{-120,0}}, color={0,0,127}));
  connect(correlationTest.u2, u) annotation (Line(points={{-12,-6},{-60,-6},{-60,
          0},{-120,0}}, color={0,0,127}));
  connect(correlationTest.y, y)
    annotation (Line(points={{11,0},{110,0},{110,0}}, color={0,0,127}));

  annotation (
    Documentation(
      info="<html>
<p>
This block uses the <a href=\"CorrelationTest\">CorrelationTest</a> block to
test for an auto-correlation of the same signal and a fixed time offset delta_t.
</p>
</html>",
      revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      Developed 2014 at the
      <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>"));
end AutoCorrelationTest;
