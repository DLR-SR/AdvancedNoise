within AdvancedNoise.Examples;
model TimeBasedCorrelations "Tests for uncorrelated noise signals"
  extends Modelica.Icons.Example;

  Sources.TimeBasedNoise noise1(
    samplePeriod=0.01,
    useAutomaticLocalSeed=false,
    fixedLocalSeed=11)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Sources.TimeBasedNoise noise2(
    samplePeriod=0.01,
    useAutomaticLocalSeed=false)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Statistics.CorrelationTest crossCorrelationTest
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Statistics.AutoCorrelationTest autoCorrelationTest
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
equation
  connect(crossCorrelationTest.u1, noise1.y) annotation (Line(
      points={{-22,56},{-40,56},{-40,70},{-59,70}},
      color={0,0,127}));
  connect(crossCorrelationTest.u2, noise2.y) annotation (Line(
      points={{-22,44},{-40,44},{-40,30},{-59,30}},
      color={0,0,127}));
  connect(autoCorrelationTest.u, noise2.y) annotation (Line(points={{-22,10},{-40,
          10},{-40,30},{-59,30}}, color={0,0,127}));
  annotation (
    experiment(StopTime=100, Interval=1e-2),
    Documentation(revisions="<html>
<table border=\"0\">
<tr><td valign=\"top\">
         <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
</td><td valign=\"bottom\">
         <b>Copyright</b> <b>&copy; DLR Institute of System Dynamics and Control</b><br>
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</html>", info="<html>
<p>This example demonstrates the autocorrelation and cross correlation of two time based noises using different seeds.</p>
<p><img src=\"modelica://AdvancedNoise/Resources/Images/Examples/TimeBasedCorrelations.png\"/></p>
<p>p-values for both cross correlation and autocorrelation are high. This means, we can assume uncorrelated signals &ndash; between two different seeds as well as within a single noise signal.</p>
</html>"));
end TimeBasedCorrelations;
