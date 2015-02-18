within Modelica_Noise.Blocks.Examples.NoiseExamples;
model ImpureGenerator
  "Demonstrates the usage of the impure random number generator"
  extends Modelica.Icons.Example;
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{20,40},{40,60}})));

  NoiseExamples.Utilities.ImpureRandom impureRandom(samplePeriod=0.01)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
 annotation (experiment(StopTime=2), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(info="<html>
<p>
This example demonstrates how to use the globalSeed.random() impure function
to generate random values at event instants. Typically, this approach is only
used when implementing an own, specialized block that needs a random number
generator.
</p>
</html>"));
end ImpureGenerator;
