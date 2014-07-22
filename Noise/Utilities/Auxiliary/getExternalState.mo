within Noise.Utilities.Auxiliary;
impure function getExternalState
  "Retrieves the state vector from an external static variable"
  constant Integer n = 33
    "The size of the state vector as defined in the external C file";
  output Integer[n] state "The output state";

  external "C" NOISE_getExternalState(state, size(state,1));

  annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p></p>
</html>"));
end getExternalState;
