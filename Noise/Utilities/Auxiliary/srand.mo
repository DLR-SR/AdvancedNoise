within Noise.Utilities.Auxiliary;
function srand "Seeds the impure random number generator"
  input Integer s "The input seed";
protected
  constant Integer p=20 "The number of iterations";
  Integer state[33] "The state vector";
algorithm

  // Seed the state
  state := Noise.Seed.xorshift64star(localSeed=s, globalSeed=0, stateSize=33);

  // Set the state
  setExternalState(state);

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p></p>
</html>"));
end srand;
