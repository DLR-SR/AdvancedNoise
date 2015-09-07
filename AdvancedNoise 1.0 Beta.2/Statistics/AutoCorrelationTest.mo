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
  connect(correlationTest.u2, u) annotation (Line(points={{-12,-6},{-60,-6},{
          -60,0},{-120,0}}, color={0,0,127}));
  connect(correlationTest.y, y)
    annotation (Line(points={{11,0},{110,0},{110,0}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Documentation(revisions="<html>
<p><img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end AutoCorrelationTest;
