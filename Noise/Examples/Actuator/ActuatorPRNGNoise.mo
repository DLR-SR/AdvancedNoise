within Noise.Examples.Actuator;
model ActuatorPRNGNoise
  extends Actuator(controller(redeclare Noise.Examples.Actuator.Parts.PRNG
        noiseModel));
  inner GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  annotation (
    experiment(
      StopTime=8,
      Interval=0.01,
      Tolerance=1e-005),Documentation(info="<html>
<p>Simulation of the same actuator with a noisy position sensor using the <a href=\"Noise.PRNG\">PRNG</a> block.</p>
</html>", revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end ActuatorPRNGNoise;
