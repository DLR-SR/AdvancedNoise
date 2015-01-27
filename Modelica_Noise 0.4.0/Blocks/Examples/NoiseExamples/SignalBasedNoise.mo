within Modelica_Noise.Blocks.Examples.NoiseExamples;
model SignalBasedNoise
  "Demonstrates noise with startTime and automatic local seed"
  import Modelica_Noise;
   extends Modelica.Icons.Example;
   parameter Real startTime = 0.5;
   parameter Real y_off = -1.0;

  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false, enableNoise=true)
    annotation (Placement(transformation(extent={{0,40},{20,60}})));

  Modelica_Noise.Blocks.Noise.SignalBasedNoise signalBasedNoise(redeclare
      package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.LinearFirstOrder)
    annotation (Placement(transformation(extent={{-66,-2},{-46,18}})));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end SignalBasedNoise;
