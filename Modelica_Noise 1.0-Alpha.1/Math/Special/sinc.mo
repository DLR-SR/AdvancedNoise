within Modelica_Noise.Math.Special;
function sinc "Unnormalized sinc function: sinc(u) = sin(u)/u"
  input Real u "Input argument";
  output Real y "= sinc(u) = sin(u)/u";
algorithm

  y := if abs(u) > 0.5e-4 then sin(u)/u else 1 - (u^2)/6 + (u^4)/120;

  annotation (Inline=true, Documentation(revisions="<html>
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
</html>", info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Special.<b>sinc</b>(u);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the unnormalized sinc function sinc(u) = sin(u)/u. The implementation utilizes
a Taylor series approximation for small values of u. Plot 
of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Special/sinc.png\">
</blockquote></p>

<p>
For more details, see <a href=\"http://en.wikipedia.org/wiki/Sinc_function\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  sinc(0)   // = 1
  sinc(3)   // = 0.0470400026866224
</pre></blockquote>
</html>"));
end sinc;
