within Noise.Utilities.Auxiliary;
impure function random "Implements an impure random number generator"
  output Real y "The uniform random number";
  input xorshift1024star generator = xorshift1024star
    "The random number generator algorithm";
protected
  Integer state[33];
algorithm
  state      := getExternalState();
  (state, y) := generator(state);
  setExternalState(state);

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p></p>
</html>"));
end random;
