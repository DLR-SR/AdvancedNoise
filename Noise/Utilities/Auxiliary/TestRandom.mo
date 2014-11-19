within Noise.Utilities.Auxiliary;
model TestRandom
  import Noise;
  Real r;
equation
  when initial() then
    Noise.Utilities.Auxiliary.seedRandom(hashString(removePackageName(
      getInstanceName())) + 0*automaticSeed());
  end when;
  when sample(0,0.01) then
    r =hashString(removePackageName(getInstanceName())) + 0*automaticSeed() +
      Noise.Utilities.Auxiliary.random()*0;
  end when;

end TestRandom;
