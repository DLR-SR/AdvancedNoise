within Modelica_Noise.Math.TruncatedDistributions.Interfaces;
partial function partialQuantile
  "Common interface of truncated quantile functions (= inverse cumulative distribution functions)"
  extends Distributions.Interfaces.partialQuantile;
  input Real y_min=0 "Lower limit of y" annotation(Dialog);
  input Real y_max=1 "Upper limit of y" annotation(Dialog);
  annotation (Documentation(info="<html>
<p>
A partial function containing the common
arguments of the quantile functions.
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
end partialQuantile;
