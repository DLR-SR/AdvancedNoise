within Modelica_Noise.Math.Special;
function erfInv "Inverse error function: u = erf(erfInv(u))"
  input Real u "Input argument in the range -1 <= u <= 1";
  output Real y "= inverse of error function";
protected
  constant Real eps = 0.1;
algorithm
  if u >= 1 then
     y := Modelica.Constants.inf;
  elseif u <= -1 then
     y := -Modelica.Constants.inf;
  elseif u == 0 then
     y := 0;
  elseif u < 0 then
     y :=-Internal.erfInvUtil(-u, 1 + u);
  else
     y :=Internal.erfInvUtil(u, 1 - u);
  end if;

  annotation (smoothOrder=1, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Special.<b>erfInv</b>(u);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the inverse of the error function erf(u) = 2/sqrt(pi)*Integral_0_u exp(-t^2)*dt numerically with a relative precision of about 1e-15. Therefore, u = erf(erfInv(u)). Input argument u must be in the range
(otherwise an assertion is raised):
</p>

<p><blockquote>
-1 &le; u &le; 1
</blockquote></p>

<p>
If u = 1, the function returns Modelica.Constants.inf.<br>
If u = -1, the function returns -Modelica.Constants.inf<br>
The implementation utilizes the formulation of the Boost library (<a href=\"http://www.boost.org/doc/libs/1_57_0/boost/math/special_functions/detail/erf_inv.hpp\">erf_inv.hpp</a>,
developed by John Maddock).<br>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Special/erfInv.png\">
</blockquote></p>

<p>
For more details, see <a href=\"http://en.wikipedia.org/wiki/Error_function\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  erfInv(0)            // = 0
  erfInv(0.5)          // = 0.4769362762044699
  erfInv(0.999999)     // = 3.458910737275499
  erfInv(0.9999999999) // = 4.572824958544925
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Special.erf\">erf</a>,
<a href=\"modelica://Modelica_Noise.Math.Special.erfc\">erfc</a>,
<a href=\"modelica://Modelica_Noise.Math.Special.erfcInv\">erfcInv</a>.
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
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end erfInv;
