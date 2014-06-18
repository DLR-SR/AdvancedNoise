within Noise.Examples.Actuator;
model ActuatorLinearSystemsNoise
extends Actuator(controller(redeclare
        Noise.Examples.Actuator.Parts.LinearSystemsNoise noiseModel));
  annotation (
    experiment(
      StopTime=8,
      Interval=0.01,
      Tolerance=1e-005),
  Documentation(info="<html>
<p>Simulation of the same actuator with a noisy position sensor using the <a href=\"Modelica_LinearSystems2\">LinearSystems2</a> library.</p>
</html>", revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end ActuatorLinearSystemsNoise;
