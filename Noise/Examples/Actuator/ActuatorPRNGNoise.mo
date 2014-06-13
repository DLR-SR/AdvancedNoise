within Noise.Examples.Actuator;
model ActuatorPRNGNoise
  extends Actuator(controller(redeclare Noise.Examples.Actuator.Parts.PRNG
        noiseModel));
  annotation (
    experiment(
      StopTime=8,
      __Dymola_NumberOfIntervals=800,
      Tolerance=1e-005),Documentation(info="<html>
<p>Simulation of the same actuator with a noisy position sensor using the <a href=\"Noise.PRNG\">PRNG</a> block.</p>
</html>", revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end ActuatorPRNGNoise;
