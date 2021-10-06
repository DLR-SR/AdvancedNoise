within AdvancedNoise.Examples;
model SignalBasedCorrelations
  "Tests for uncorrelated noise signals using signal-based generators"
  extends Modelica.Icons.Example;

  Sources.SignalBasedNoise noise1(
    samplePeriod=0.01,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=11,
    useTime=false)
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Sources.SignalBasedNoise noise2(
    samplePeriod=0.01,
    useAutomaticLocalSeed=false,
    useTime=false)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Statistics.CorrelationTest crossCorrelationTest
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Statistics.AutoCorrelationTest autoCorrelationTest
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Blocks.Sources.RealExpression inputSignal(y=time)
    annotation (Placement(transformation(extent={{-100,40},{-68,60}})));
equation
  connect(crossCorrelationTest.u1, noise1.y) annotation (Line(
      points={{18,56},{0,56},{0,70},{-19,70}},
      color={0,0,127}));
  connect(crossCorrelationTest.u2, noise2.y) annotation (Line(
      points={{18,44},{0,44},{0,30},{-19,30}},
      color={0,0,127}));
  connect(autoCorrelationTest.u, noise2.y) annotation (Line(points={{18,10},{0,10},
          {0,30},{-19,30}},       color={0,0,127}));
  connect(inputSignal.y, noise1.u) annotation (Line(points={{-66.4,50},{-54,50},
          {-54,70},{-42,70}}, color={0,0,127}));
  connect(noise2.u, inputSignal.y) annotation (Line(points={{-42,30},{-54,30},{
          -54,50},{-66.4,50}}, color={0,0,127}));

  annotation (
    experiment(
      StopTime=100,
      Interval=1e-2),
    Documentation(
      revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      <strong>Copyright</strong> <strong>&copy; DLR Institute of System Dynamics and Control</strong><br>
      Initial version implemented by
      A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
      <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>",
      info="<html>
<p>
This example demonstrates the autocorrelation and cross correlation
of two signal based noises using different seeds.
</p>

<blockquote>
<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/SignalBasedCorrelations.png\" alt=\"Diagram SignalBasedCorrelations.png\">
</blockquote>

<p>
p-values for both cross correlation and autocorrelation are high.
This means, we can assume uncorrelated signals &ndash; between two
different seeds as well as within a single noise signal.
</p>
</html>"));
end SignalBasedCorrelations;
