within Modelica_Noise.Math.Random.Utilities;
function initializeImpureRandom
  "Initializes the internal state of the impure random number generator"
  input Integer seed
    "The input seed to initialize the impure random number generator";
  output Integer id
    "Identification number to be passed as input to function impureRandom, in order that sorting is correct";
protected
  constant Integer localSeed = 715827883
    "Since there is no local seed, a large prime number is used";
  Integer state[33]
    "The internal state vector of the impure random number generator";

  function setInternalState
    "Stores the given state vector in an external static variable"
    input Integer[33] state "The initial state";
    input Integer id;
    external "C" NOISE_setInternalState_xorshift1024star(state, size(state,1), id);
    annotation (Include = "#include \"ModelicaNoise.c\"");
  end setInternalState;

algorithm
  // Determine the internal state (several iterations with a generator that quickly generates good numbers
  state := Random.Utilities.initialStateWithXorshift64star(localSeed,seed,size(state, 1));
  id :=localSeed;

  // Copy the internal state into the internal C static memory
  setInternalState(state, id);
end initializeImpureRandom;
