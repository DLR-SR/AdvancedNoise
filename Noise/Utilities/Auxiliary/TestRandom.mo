within Noise.Utilities.Auxiliary;
model TestRandom
  import Noise;
  Real r;
equation
  when initial() then
    srand(4);
  end when;
  when sample(0,0.01) then
    r = rand();
  end when;

end TestRandom;
