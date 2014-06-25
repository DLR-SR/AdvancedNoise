within Noise.Examples;
model Analysis "Shows how to analyze a noise signal"
  import Noise;
  extends Modelica.Icons.Example;

  Noise.PRNG prng(
    redeclare function PSD = Noise.PSD.PSD_WhiteNoise,
    redeclare function PDF = Noise.PDF.PDF_BoxMuller,
    redeclare function SampleBasedRNG = Noise.RNG.SampleBased.RNG_MRG,
    useSampleBasedMethods=false)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Noise.Utilities.Analysis.Mu mu
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Noise.Utilities.Analysis.Var var
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Noise.Utilities.Analysis.Std std
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Noise.Utilities.Analysis.Corr corr
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  inner Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
equation
  connect(prng.y, mu.u) annotation (Line(
      points={{-59,50},{18,50}},
      color={0,0,127}));
  connect(var.u, prng.y) annotation (Line(
      points={{18,10},{-20,10},{-20,50},{-59,50}},
      color={0,0,127}));
  connect(std.u, prng.y) annotation (Line(
      points={{18,-30},{-20,-30},{-20,50},{-59,50}},
      color={0,0,127}));
  connect(corr.u, prng.y) annotation (Line(
      points={{18,-70},{-20,-70},{-20,50},{-59,50}},
      color={0,0,127}));
  connect(corr.u1, prng.y) annotation (Line(
      points={{18,-76},{10,-76},{10,-70},{-20,-70},{-20,50},{-59,50}},
      color={0,0,127}));
  annotation (
    experiment(StopTime=100, Tolerance=1e-006),
Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This example uses some simple analysis block to analyse the mean and variance of the generated random numbers. You can used it to check the quality of a parametrization of the PRNG block.</p>
<p>The generated values should satisfy some general quality measures:</p>
<ul>
<li>They should match your selected distribution.</li>
<li>They should be uncorrelated for different seeds and time lags, respectively.</li>
<li>...</li>
</ul>
</html>"));
end Analysis;
