within Modelica_Noise.Utilities.System;
function convertRealToIntegers "Casts a double value to two integers"
  input Real real "The Real value";
  output Integer[2] int "The Integer values";

  external "C" NOISE_double2int(real,int);

  annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p></p>
</html>"));
end convertRealToIntegers;
