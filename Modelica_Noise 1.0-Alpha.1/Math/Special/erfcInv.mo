within Modelica_Noise.Math.Special;
function erfcInv "Inverse complementary error function: u = erfc(erfcInv(u))"
  input Real u "Input argument";
  output Real y "erfcInv(u)";
algorithm
  assert(u >= 0 and u <= 2, "Input argument u not in range 0 <= u <= 2");

  if u == 0 then
     y := Modelica.Constants.inf;

  elseif u == 2 then
     y := -Modelica.Constants.inf;

  elseif u == 1 then
     y := 0;

  elseif u > 1 then
     y :=-Internal.erfInvUtil(u-1, 2-u);

  else
     y :=Internal.erfInvUtil(1-u, u);
  end if;

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Special.<b>erfInv</b>(u);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the inverse of the complementary error function 
erfc(u) = 1 - erf(u) with a relative precision of about 1e-15.
Therefore, u = erfc(erfcInv(u)) and erfcInv(u) = erfInv(1 - u). Input argument u must be in the range
(otherwise an assertion is raised):
</p>

<p><blockquote>
0 &le; u &le; 2
</blockquote></p>

<p>
If u = 2, the function returns -Modelica.Constants.inf.<br>
If u = 0, the function returns Modelica.Constants.inf<br>
The implementation utilizes the formulation of the Boost library (<a href=\"http://www.boost.org/doc/libs/1_57_0/boost/math/special_functions/detail/erf_inv.hpp\">erf_inv.hpp</a>,
developed by John Maddock).<br>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Special/erfcInv.png\">
</blockquote></p>

<p>
For more details, see <a href=\"http://en.wikipedia.org/wiki/Error_function\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  erfcInv(1)         // = 0
  erfcInv(0.5)       // = 0.4769362762044699
  erfInv(1.999999)   // = -3.4589107372909473
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Special.erf\">erf</a>,
<a href=\"modelica://Modelica_Noise.Math.Special.erfc\">erfc</a>,
<a href=\"modelica://Modelica_Noise.Math.Special.erfInv\">erfInv</a>.
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
end erfcInv;
