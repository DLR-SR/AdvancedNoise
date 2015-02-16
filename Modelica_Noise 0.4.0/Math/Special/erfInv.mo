within Modelica_Noise.Math.Special;
function erfInv "Inverse error function: u = erf(erfInv(u))"
  input Real u "Input argument in the range -1 <= u <= 1";
  output Real y "= inverse of error function";
algorithm
  assert(u >= -1 and u <= 1, "Input argument u not in range -1 <= u <= 1");

  if u == 1 then
     y := Modelica.Constants.inf;
  elseif u == -1 then
     y := -Modelica.Constants.inf;
  elseif u == 0 then
     y := 0;
  elseif u < 0 then
     y :=-Internal.erfInvUtil(-u, 1 + u);
  else
     y :=Internal.erfInvUtil(u, 1 - u);
  end if;

  annotation (Documentation(info="<html>
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
</html>"));
end erfInv;
