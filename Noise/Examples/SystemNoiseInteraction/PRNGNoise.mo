within Noise.Examples.SystemNoiseInteraction;
model PRNGNoise "Shows the modelling of a noisy sensor"
   extends Modelica.Icons.Example;
   parameter Integer downSampling = 20;

  Noise.PRNG prng(
    infiniteFreq=false,
    redeclare function SampleFreeRNG = Noise.RNG.SampleFree.RNG_DIRCS,
    redeclare function SampleBasedRNG =
        Noise.RNG.SampleBased.RNG_LCG_NumericalRecipes,
    useSampleBasedMethods=false,
    redeclare function PDF = Noise.PDF.PDF_Bates (interval={-0.05,0.05}, n=20),
    samplePeriod=1/6000*downSampling,
    redeclare function PSD = Noise.PSD.PSD_WhiteNoise)
    annotation (Placement(transformation(extent={{-38,-10},{-18,10}})));

  Modelica.Blocks.Continuous.CriticalDamping criticalDamping(f=10,
    n=50,
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(prng.y, criticalDamping.u) annotation (Line(
      points={{-17,0},{58,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
            graphics={                    Rectangle(
          extent={{46,38},{92,-20}},
          lineColor={0,127,0},
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid),
                      Rectangle(
          extent={{-90,38},{40,-20}},
          lineColor={127,0,0},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-90,38},{40,18}},
          lineColor={0,0,255},
          fontSize=14,
          textString="Equivalent model of a sampled noisy signal
averaged using a 20 point average filter"),
        Text(
          extent={{46,38},{92,18}},
          lineColor={0,0,255},
          fontSize=14,
          textString="Model
"),     Text(
          extent={{-100,96},{96,56}},
          lineColor={0,0,255},
          fontSize=16,
          textString="Sample free noise generator. The resulting signal mimics the noise of a sampled noisy
signal with 6000 Samples/s between [-0.05 0.05]
that is filtered using a FIR filter to average the signal with 20 averages.")}),
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This is an elegant approach to implementing noise using the <a href=\"Noise.PRNG\">Noise.PRNG</a> block. It is as fast as the <a href=\"Noise.Examples.SystemNoiseInteraction.LinearSystemsNoiseSmartAveraging\">LinearSystemsNoiseSmartAveraging</a> implementation, but much more modular.</p>
</html>"));
end PRNGNoise;
