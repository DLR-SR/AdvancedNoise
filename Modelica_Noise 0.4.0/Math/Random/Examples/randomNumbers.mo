within Modelica_Noise.Math.Random.Examples;
function randomNumbers
  "Demonstrate the generation of uniform random numbers in the range 0..1"
  import Modelica.Utilities.Streams.print;
  extends Modelica.Icons.Function;
  input Integer localSeed = 614657;
  input Integer globalSeed = 30020;
protected
  constant Integer nRandom = 5;
  Integer state2[2];
  Integer state4[4];
  Integer state33[33];
  Real r;
algorithm
  print("\nDemonstrate how to generate uniform random numbers with xorshift64*:");

  // Generate initial state from localSeed and globalSeed
  state2 := Generators.Xorshift64star.initialState(localSeed, globalSeed);

  // Generate random numbers
  for i in 1:nRandom loop
    (r,state2) :=Generators.Xorshift64star.random(state2);
    print("   random = " + String(r));
  end for;

  print("\nDemonstrate how to generate uniform random numbers with xorshift128+:");

  // Generate initial state from localSeed and globalSeed
  state4 := Generators.Xorshift128plus.initialState(localSeed, globalSeed);

  // Generate random numbers
  for i in 1:nRandom loop
    (r,state4) :=Generators.Xorshift128plus.random(state4);
    print("   random = " + String(r));
  end for;

  print("\nDemonstrate how to generate uniform random numbers with xorshift1024*:");

  // Generate initial state from localSeed and globalSeed
  state33 := Generators.Xorshift1024star.initialState(localSeed, globalSeed);

  // Generate random numbers
  for i in 1:nRandom loop
    (r,state33) :=Generators.Xorshift1024star.random(state33);
    print("   random = " + String(r));
  end for;
end randomNumbers;
