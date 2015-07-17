within ;
package Modelica_Noise "Modelica_Noise version 1.0-Beta.1 (Library for random numbers and noise signals; planned to be included into the Modelica Standard Library)"


  annotation(preferredView="info",
             version =     "1.0 Beta.1",
             versionDate =  "2015-06-22",
             versionBuild = 0,
             uses(Modelica(version="3.2.1")),
  Documentation(info="<html>
<p>
This library contains blocks to generate reproducible noise, as well as various utility functions.
It is planned to include this library in the Modelica Standard Library.
The library is structured, so that all parts can be directly copied into
the Modelica Standard Library by just exchanging \"Modelica_Noise\" with \"Modelica\".
The sublibrary \"Modelica_Noise.ToModelicaTest\" shall be copied into the
ModelicaTest library.
</p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> June 22, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end Modelica_Noise;
