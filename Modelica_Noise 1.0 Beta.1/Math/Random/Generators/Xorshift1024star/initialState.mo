within Modelica_Noise.Math.Random.Generators.Xorshift1024star;
function initialState
  "Returns an initial state for the xorshift1024* algorithm"
  extends Interfaces.initialState(final stateSize=Xorshift1024star.nState);
algorithm
  state := Random.Utilities.initialStateWithXorshift64star(localSeed,globalSeed,size(state, 1));
  annotation(Inline=true, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
state = Xorshift1024star.<b>initialState</b>(localSeed, globalSeed);
</pre></blockquote>

<h4>Description</h4>

<p>
Generates an initial state vector for the Xorshift1024star random number generator
(= xorshift1024* algorithm), from
two Integer numbers given as input (arguments localSeed, globalSeed). Any Integer numbers
can be given (including zero or negative number). The function returns
a reasonable initial state vector with the following strategy:
</p>

<p>
The <a href=\"modelica://Modelica_Noise.Math.Random.Generators.Xorshift64star\">Xorshift64star</a>
random number generator is used to fill the internal state vector with 64 bit random numbers.
</p>

<h4>Example</h4>
<blockquote><pre>
  <b>parameter</b> Integer localSeed;
  <b>parameter</b> Integer globalSeed;
  Integer state[Xorshift1024star.nState];
<b>initial equation</b>
  state = initialState(localSeed, globalSeed);
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Random.Generators.Xorshift1024star.random\">Random.Generators.Xorshift1024star.random</a>.
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
