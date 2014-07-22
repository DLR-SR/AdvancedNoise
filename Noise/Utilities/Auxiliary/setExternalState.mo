within Noise.Utilities.Auxiliary;
function setExternalState
  "Stores the given state vector in an external static variable"
  constant Integer n = 33
    "The size of the state vector as defined in the external C file";
  input Integer[n] state = 1:n "The input state";

  external "C" NOISE_setExternalState(state, size(state,1));

  annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p></p>
</html>"));
end setExternalState;
