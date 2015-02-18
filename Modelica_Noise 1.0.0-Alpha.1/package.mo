within ;
package Modelica_Noise "Modelica_Noise version 1.0.0-Alpha.1 (Library for random numbers and noise signals; planned to be included into the Modelica Standard Library)"


  annotation(version =      "1.0.0-Alpha.1",
             versionDate =  "2015-02-15",
             versionBuild = 1,
             uses(Modelica(version="3.2.1"), Noise(version="0.4.0")),
  Documentation(info="<html>
<p>
This library contains blocks to generate reproducible noise in an efficient way,
as well as various utility functions.
It is planed to include this library in the Modelica Standard Library.
The library is structured, so that all parts can be directly copied into
the Modelica Standard Library by just exchanging \"Modelica_Noise\" with \"Modelica\".
The sublibrary \"Modelica_Noise.ToModelicaTest\" shall be copied into the
ModelicaTest library.
</p>
</html>"));
end Modelica_Noise;
