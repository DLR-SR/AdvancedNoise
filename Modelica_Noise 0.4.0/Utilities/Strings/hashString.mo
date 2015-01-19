within Modelica_Noise.Utilities.Strings;
function hashString "Creates a hash value of a String"
  input String str "The string to create a hash from";
  output Integer hash "The hash value of str";
  external "C" hash = NOISE_APHash(str)
      annotation (Include = "#include \"ModelicaNoise.c\"");
end hashString;
