within Noise.Utilities.Auxiliary;
function hashString "Creates a hash value of a String"
  input String str "The string to create a hash from";
  output Integer hash "The hash value";

  external "C" hash = NOISE_APHash(str);

 annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p></p>
</html>"));
end hashString;
