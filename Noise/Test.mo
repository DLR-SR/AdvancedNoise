within Noise;
model Test
  inner GlobalSeed globalSeed(redeclare function generator =
        Noise.Generators.LinearCongruentialGenerator)
    annotation (Placement(transformation(extent={{-18,56},{2,76}})));
  EventBasedNoise prng
    annotation (Placement(transformation(extent={{-24,-8},{-4,12}})));
end Test;
