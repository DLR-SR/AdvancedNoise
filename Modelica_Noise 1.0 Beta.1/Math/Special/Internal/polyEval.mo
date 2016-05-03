within Modelica_Noise.Math.Special.Internal;
function polyEval "Evaluate a polynomial c[1] + c[2]*u + c[3]*u^2 + ...."
  input Real  c[:] "Polnomial coefficients";
  input Real  u "Abscissa value";
  output Real y "= c[1] + u*(c[2] + u*(c[3] + u*(c[4]*u^3 + ...)))";
algorithm
  y := c[size(c,1)];
  for j in size(c, 1)-1:-1:1 loop
     y := c[j] + u*y;
  end for;
 annotation (Documentation(info="<html>
<p>
Evaluate a polynomial using Horner's scheme.
</p>
</html>",
       revisions="<html>
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
end polyEval;
