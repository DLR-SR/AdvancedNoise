within Noise.Seed;
function xorshift64star "Uses the xorshift64star algorithm for seeding"
  extends Utilities.Interfaces.Seed;
  import Noise.Utilities.Auxiliary.xorshift64star;
protected
  constant Integer p = 20 "The number of iterations to use";
algorithm

  // Set the first values
  state[1:2] := {localSeed,globalSeed};

  // Do the iterations
  for i in 1:p loop
    state[1:2] := xorshift64star(state[1:2]);
  end for;

  // Fill the state vector
  for i in 3:2:(stateSize-1) loop
    state[i:i+1] := xorshift64star(state[i-2:i-1]);
  end for;

  // The last value
  state[end-1:end] := xorshift64star(state[end-3:end-2]);

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This function fills the initial state vector using the <a href=\"Noise.RNG.SampleBased.RNG_MRG\">MRG</a> random number generator.</p>
</html>"));
end xorshift64star;
