within Modelica_Noise.Math.Special;
function erf "Error function erf(u) = 2/sqrt(pi)*Integral_0_u exp(-t^2)*d"
  input Real u "Input argument";
  output Real y "= 2/sqrt(pi)*Integral_0_u exp(-t^2)*dt";
protected
   Boolean inv;
   Real z;
   Real zz;
   constant Real y1 = 1.044948577880859375;
   constant Real P[5] = {0.0834305892146531832907,
                         -0.338165134459360935041,
                         -0.0509990735146777432841,
                         -0.00772758345802133288487,
                         -0.000322780120964605683831};
   constant Real Q[5] = {1,
                         0.455004033050794024546,
                         0.0875222600142252549554,
                         0.00858571925074406212772,
                         0.000370900071787748000569};
algorithm
   if u >= 0 then
      z :=u;
      inv :=false;
   else
      z :=-u;
      inv :=true;
   end if;

   if z < 0.5 then
      if z <= 0 then
         y := 0;
      elseif z < 1.0e-10 then
         y := z*1.125 + z*0.003379167095512573896158903121545171688;
      else
         // Maximum Deviation Found:                     1.561e-17
         // Expected Error Term:                         1.561e-17
         // Maximum Relative Change in Control Points:   1.155e-04
         // Max Error found at double precision =        2.961182e-17
         zz := z*z;
         y := z*(y1 + Internal.polyEval(P, zz)/Internal.polyEval(Q, zz));
      end if;

   elseif z < 5.8 then
      y :=1 - Internal.erfcUtil(z);

   else
      y :=1;
   end if;

   if inv then
      y :=-y;
   end if;

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Special.<b>erf</b>(u);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the error function erf(u) = 2/sqrt(pi)*Integral_0_u exp(-t^2)*dt numerically with a relative precision of about 1e-15. The implementation utilizes the formulation of the Boost library
(53-bit implementation of <a href=\"http://www.boost.org/doc/libs/1_57_0/boost/math/special_functions/erf.hpp\">erf.hpp</a>,
developed by John Maddock). Plot
of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Special/erf.png\">
</blockquote></p>

<p>
For more details, see <a href=\"http://en.wikipedia.org/wiki/Error_function\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  erf(0)    // = 0
  erf(10)   // = 1
  erf(0.5)  // = 0.520499877813047
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Special.erfc\">erfc</a>,
<a href=\"modelica://Modelica_Noise.Math.Special.erfInv\">erfInv</a>,
<a href=\"modelica://Modelica_Noise.Math.Special.erfcInv\">erfcInv</a>.
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
end erf;
