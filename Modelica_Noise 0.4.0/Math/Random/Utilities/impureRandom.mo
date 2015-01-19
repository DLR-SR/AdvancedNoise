within Modelica_Noise.Math.Random.Utilities;
impure function impureRandom "Impure random number generator"
  input Integer id
    "Identification number from initializeImpureRandom(..) function (is needed for correct sorting)";
  output Real y
    "A random number with a uniform distribution on the interval (0,1]";
  external "C" y = NOISE_impureRandom_xorshift1024star(id);
  annotation (Include = "#include \"ModelicaNoise.c\"");
end impureRandom;
