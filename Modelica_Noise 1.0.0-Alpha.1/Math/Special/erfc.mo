within Modelica_Noise.Math.Special;
function erfc "Complementary error function erfc(u) = 1 - erf(u)"
  input Real u "Input argument";
  output Real y "= 1 - erf(u)";

algorithm
  if u < 0 then
     if u < -0.5 then
        if u > -28 then
           y := 2 - Internal.erfcUtil(-u);
        else
           y := 2;
        end if;
     else
        y := 1 + erf(-u);
     end if;

  elseif u < 0.5 then
     y := 1 - erf(u);

  elseif u < 28 then
     y := Internal.erfcUtil(u);

  else
     y := 0;
  end if;
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Special.<b>erfc</b>(u);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the complementary error function erfc(u) = 1 - erf(u) with a relative precision of about 1e-15. The implementation utilizes the formulation of the Boost library
(53-bit implementation of <a href=\"http://www.boost.org/doc/libs/1_57_0/boost/math/special_functions/erf.hpp\">erf.hpp</a>
developed by John Maddock). Plot 
of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Special/erfc.png\">
</blockquote></p>

<p>
If u is large and erf(u) is subtracted from 1.0, the result is not accurate.
It is then better to use erfc(u). For more details, 
see <a href=\"http://en.wikipedia.org/wiki/Error_function\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  erfc(0)    // = 1
  erfc(10)   // = 0
  erfc(0.5)  // = 0.4795001221869534
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Special.erf\">erf</a>,
<a href=\"modelica://Modelica_Noise.Math.Special.erfInv\">erfInv</a>,
<a href=\"modelica://Modelica_Noise.Math.Special.erfcInv\">erfcInv</a>.
</p>
</html>"));
end erfc;
