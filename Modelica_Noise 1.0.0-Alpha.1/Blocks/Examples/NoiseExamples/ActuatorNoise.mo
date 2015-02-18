within Modelica_Noise.Blocks.Examples.NoiseExamples;
model ActuatorNoise
  extends Blocks.Examples.NoiseExamples.Actuator(
                   controller(redeclare
        Modelica_Noise.Blocks.Examples.NoiseExamples.Utilities.Parts.Modelica_Noise
        noiseModel));
  annotation (
    experiment(
      StopTime=8,
      __Dymola_NumberOfIntervals=800,
      Tolerance=1e-005),Documentation(info="<html>
<p>This example models an actuator with a noisy sensor:</p>
<p><img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/ActuatorNoiseDiagram.png\"/></p>
<p>The drive train consists of a motor with a gear box. These drive a rod through a linear translation model. Softly attached to the rod is another mass representing the actual actuator. The actuator is loaded with a constant force.</p>
<p>The whole model is steered by a rate limited step command through a controller model. In this controller model, the TimeBasedNoise block is used to implement additive noise on the controllers measurement input, that is the current motor position.</p>
<p>In the following plot, the position of the actuator and the motor output torque are plotted. The noise is not very strong, such that it has no visible effect on the position of the actuator. But it can be seen in the motor torque.</p>
<p><img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/ActuatorNoise.png\"/></p>
</html>", revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end ActuatorNoise;
