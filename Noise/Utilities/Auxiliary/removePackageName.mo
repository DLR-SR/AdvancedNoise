within Noise.Utilities.Auxiliary;
function removePackageName "Removes the package name from a Modelica path"
  input String pathIn "Input Modelica path";
  output String pathOut "Output Modelica path without package name";
protected
  Integer pos;
  Integer len;
algorithm
  pos := Modelica.Utilities.Strings.find(  pathIn, ".");
  len := Modelica.Utilities.Strings.length(pathIn);
  if pos > 0 then
    pathOut := Modelica.Utilities.Strings.substring(pathIn, pos+1, len);
  else
    pathOut := pathIn;
  end if;

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end removePackageName;
