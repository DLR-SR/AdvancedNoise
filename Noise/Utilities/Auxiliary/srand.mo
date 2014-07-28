within Noise.Utilities.Auxiliary;
function srand "Seeds the impure random number generator"
  input Integer s "The input seed";
protected
  constant Integer p=20 "The number of iterations";
  Integer state[33] "The state vector";
algorithm

  // Set the first values
  state[1:2] := xorshift64star({s,0});

  // Do the iterations
  for i in 1:p loop
    state[1:2] := xorshift64star(state[1:2]);
  end for;

  // Fill the state vector
  for i in 3:2:31 loop
    state[i:i+1] := xorshift64star(state[i-2:i-1]);
  end for;

  // The last value
  state[33] := 0;

  // Set the state
  setExternalState(state);

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p></p>
</html>"));
end srand;
