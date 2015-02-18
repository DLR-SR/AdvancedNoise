within Modelica_Noise.Utilities.Strings;
function hashString "Creates a hash value of a String"
  input String string "The string to create a hash from";
  output Integer hash "The hash value of string";
  external "C" hash = ModelicaRandom_hashString(string)
      annotation (Include = "#include \"ModelicaRandom.c\"");
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
hash = Strings.<b>hashString</b>(string);
</pre></blockquote>
<h4>Description</h4>
<p>
Returns an Integer hash value of the provided string
(the hash can be any Integer, including zero or a negative number).
</p>

<h4>Example</h4>
<blockquote><pre>
  hashString(\"this is a test\")     // =  1827717433
  hashString(\"Controller.noise1\")  // = -1025762750
</pre></blockquote>
</html>"));
end hashString;
