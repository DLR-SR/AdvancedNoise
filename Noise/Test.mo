within Noise;
model Test

  inner GlobalSeed globalSeed(redeclare package generator =
        Noise.Generators.MultipleRecursiveGenerator)
    annotation (Placement(transformation(extent={{-18,56},{2,76}})));
  EventBasedNoise prng
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  sdfg sdfg1 annotation (Placement(transformation(extent={{-76,20},{-56,40}})));
end Test;
