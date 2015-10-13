within Modelica_Noise.Math.Random.Generators;
package Xorshift64star "Random number generator xorshift64*"
  constant Integer nState=2 "The dimension of the internal state vector";


  extends Modelica.Icons.Package;




  annotation (Documentation(info="<html>
<p>
Random number generator <b>xorshift64*</b>. This generator has a period of 2^64
(the period defines the number of random numbers generated before the sequence begins to repeat itself).
For an overview, comparison with other random number generators, and links to articles, see
<a href=\"modelica://Modelica_Noise.Math.Random.Generators\">Math.Random.Generators</a>.
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
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
    Ellipse(
      extent={{-64,0},{-14,-50}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{12,52},{62,2}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid)}));
end Xorshift64star;
