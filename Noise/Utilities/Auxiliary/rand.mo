within Noise.Utilities.Auxiliary;
impure function rand "Implements an impure random number generator"
  output Real y "The uniform random number";
protected
  Integer state[33];
algorithm
  state      := getExternalState();
  (state, y) := xorshift1024star(state);
  setExternalState(state);

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p></p>
</html>"));
end rand;
