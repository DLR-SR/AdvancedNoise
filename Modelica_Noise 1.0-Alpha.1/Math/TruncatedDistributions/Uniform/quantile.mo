within Modelica_Noise.Math.TruncatedDistributions.Uniform;
function quantile "Quantile of uniform distribution"
  extends Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialQuantile;
algorithm
  y := Modelica_Noise.Math.Distributions.Uniform.quantile(u,y_min,y_max);

  annotation(Inline=true, Documentation(info="<html>
<p>
The truncated uniform distribution is identical to the uniform distribution.
For details about function quantile(..), see therefore
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.quantile\">Math.Distributions.Uniform.quantile</a>.
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
end quantile;
