within Noise.Examples;
model FrequencyShaping
  "Demonstrates shaping of the frequency content with a convolution filter"
  extends Modelica.Icons.Example;
  Modelica_Noise.Blocks.Noise.TimeBasedNoise filteredNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    sampleFactor=10,
    redeclare package interpolation = Noise.Interpolators.FirstOrder)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{60,60},{80,80}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end FrequencyShaping;
