within Modelica_Noise.Math.Random.Utilities;
function initialStateWithXorshift64star
  "Return an initial state vector for a random number generator (based on xorshift64star algorithm)"
  import Modelica_Noise.Math.Random.Generators.Xorshift64star;
  extends Modelica.Icons.Function;
  input Integer localSeed
    "The local seed to be used for generating initial states";
  input Integer globalSeed "The global seed to be combined with the local seed";
  input Integer nState(min=4) "The dimension of the state vector (>= 4)";
  output Integer[nState] state "The generated initial states";
protected
  Real r;
algorithm
  // Set the first 2 states
  state[1:2] :=Xorshift64star.initialState(localSeed, globalSeed);

  // Fill the next elements of the state vector (besides last)
  for i in 3:2:(nState-1) loop
    (r,state[i:i+1]) :=Xorshift64star.random(state[i - 2:i - 1]);
  end for;

  // Fill the last element of the state vector (to handle the case if nState is uneven)
 (r,state[nState-1:nState]) :=Xorshift64star.random(state[nState - 3:nState - 2]);

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This function fills the initial state vector using the <a href=\"Noise.RNG.SampleBased.RNG_MRG\">MRG</a> random number generator.</p>
</html>"));
end initialStateWithXorshift64star;
