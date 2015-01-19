within Modelica_Noise.Math.Random.Utilities;
impure function automaticLocalSeed
  "Creates an automatic local seed from the instance name"
  input String path
    "Full path name of the instance (inquire with getInstanceName())";
  output Integer seed "Automatically generated seed";
protected
  Integer pos;
  Integer len;
  String str;
algorithm
  // Remove first name from the path, because all instances have the same root name
  pos := Modelica.Utilities.Strings.find(path, ".");
  len := Modelica.Utilities.Strings.length(path);
  if pos > 0 and pos < len then
    str := Modelica.Utilities.Strings.substring(path, pos+1, len);
  else
    str := path;
  end if;

  // Generate a hash value from the generated string
  seed := Modelica_Noise.Utilities.Strings.hashString(str);

 annotation (Documentation(info="<html>
<p>Returns an automatically computed seed (Integer) from the hash value of 
the full path name of an instance (has to be inquired in the model or block
where this function is called by getInstanceName()).
</p>
</html>"));
end automaticLocalSeed;
