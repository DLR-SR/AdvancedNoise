within Noise;
model sdfg
  outer Noise.GlobalSeed globalSeed;
  //  parameter Integer dodo = globalSeed.generator.stateSize;
  parameter Boolean d = globalSeed.enableNoise;
  Integer i = globalSeed.generator.abcd;

  inner GlobalSeed globalSeed1
    annotation (Placement(transformation(extent={{-66,36},{-46,56}})));
equation

end sdfg;
