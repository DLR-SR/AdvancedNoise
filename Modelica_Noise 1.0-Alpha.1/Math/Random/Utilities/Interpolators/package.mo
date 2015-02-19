within Modelica_Noise.Math.Random.Utilities;
package Interpolators "Library of functions to interpolate in a buffer of random numbers"
   extends Modelica.Icons.Package;


annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
        -100,-100},{100,100}}), graphics={Line(
      points={{-92,-32},{-52,-32},{-30,48},{30,48},{50,-32},{94,-32}},
      color={0,0,0},
      smooth=Smooth.Bezier)}), Documentation(info="<html>
<p>
This package provides functions to interpolate in a buffer. Usually, the buffer
consists of random values
(such as by the blocks of package <a href=\"Modelica_Noise.Blocks.Noise\">Blocks.Noise</a>).
</p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end Interpolators;
