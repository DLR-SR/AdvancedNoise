within Modelica_Noise.Math.Random.Interfaces;
partial function initialState
  "Return the initial internal states for the uniform random number generator"
  extends Modelica.Icons.Function;
  input Integer localSeed
    "The local seed to be used for generating initial states";
  input Integer globalSeed "The global seed to be combined with the local seed";
  input Integer stateSize "The dimension of the internal state vector";
  output Integer[stateSize] state "The generated initial states";
annotation (Documentation(info="<html>
<p>
This partial function defines the input and output arguments of an
initialState(..) function of a random number generator package.
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
end initialState;
