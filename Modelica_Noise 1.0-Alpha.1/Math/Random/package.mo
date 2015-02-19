within Modelica_Noise.Math;
package Random "Library of functions for the generation of random numbers"
   extends Modelica.Icons.Package;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
        -100},{100,100}}), graphics={
    Ellipse(
      extent={{-84,84},{-24,24}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{22,62},{82,2}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{-58,6},{2,-54}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{26,-30},{86,-90}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
This package contains low level functions for the generation of random numbers.
Usually, the functions in this package are not used directly, but are utilized
as building blocks of higher level functionality.
</p>

<p>
Package <a href=\"modelica://Modelica_Noise.Math.Random.Generators\">Math.Random.Generators</a>
contains various pseudo random number generators. These generators are used in the blocks
of package <a href=\"modelica://Modelica_Noise.Blocks.Noise\">Blocks.Noise</a> to generate
reproducible noise signals.
Package <a href=\"modelica://Modelica_Noise.Math.Random.Utilities\">Math.Random.Utilities</a>
contains utility functions for the random number generators,
that are usually of no interested for the user
(they are, for example, used to implement the blocks in
package <a href=\"modelica://Modelica_Noise.Blocks.Noise\">Blocks.Noise</a>).
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
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end Random;
