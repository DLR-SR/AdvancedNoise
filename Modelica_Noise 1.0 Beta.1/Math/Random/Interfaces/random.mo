within Modelica_Noise.Math.Random.Interfaces;
partial function random
  "Return a random number with a uniform distribution in the range 0.0 < result <= 1.0"
  extends Modelica.Icons.Function;
  input Integer[stateSize] stateIn
    "The internal states for the random number generator";
  input Integer stateSize "The dimension of the internal state vector";
  output Real result
    "A random number with a uniform distribution on the interval (0,1]";
  output Integer[stateSize] stateOut
    "The new internal states of the random number generator";
annotation (Documentation(info="<html>
<p>
This partial function defines the input and output arguments of a
random(..) function of a random number generator package.
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
end random;
