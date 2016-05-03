within Modelica_Noise.Math.Distributions.Uniform;
function cumulative "Cumulative distribution function of uniform distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialCumulative;
  input Real u_min=0 "Lower limit of u" annotation (Dialog);
  input Real u_max=1 "Upper limit of u" annotation (Dialog);
algorithm
  y := if u < u_min then 0.0 else
       if u > u_max then 1.0 else (u-u_min)/(u_max-u_min);

  annotation (Inline=true,Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Uniform.<b>cumulative</b>(u, u_min=0, u_max=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the cumulative distribution function
according to a <b>uniform</b> distribution in a band.
The returned value y is in the range:
</p>

<p><blockquote>
0 &le; y &le; 1
</blockquote></p>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Uniform.cumulative.png\">
</blockquote></p>

<p>
For more details, see
<a href=\"http://en.wikipedia.org/wiki/Uniform_distribution_(continuous)\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  cumulative(0.5)    // = 0.5
  cumulative(0,-1,1) // = 0.5
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.density\">Uniform.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.quantile\">Uniform.quantile</a>.
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
end cumulative;
