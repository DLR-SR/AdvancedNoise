within Modelica_Noise.Math.Random.Generators.Xorshift1024star;
function random
  "Returns a uniform random number with the xorshift1024* algorithm"
  extends Interfaces.random(final stateSize=Xorshift1024star.nState);
  external "C" ModelicaRandom_xorshift1024star(stateIn, stateOut, result)
    annotation (Include = "#include \"ModelicaRandom.c\"");
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(r, stateOut) = Xorshift128plus.<b>random</b>(stateIn);
</pre></blockquote>

<h4>Description</h4>
<p>
Returns a uniform random number in the range 0 &lt; random &le; 1 with the xorshift1024* algorithm.
Input argument <b>stateIn</b> is the state vector of the previous call.
Output argument <b>stateOut</b> is the updated state vector.
If the function is called with identical stateIn vectors, exactly the
same random number r is returned.
</p>

<h4>Example</h4>
<blockquote><pre>
  <b>parameter</b> Integer localSeed;
  <b>parameter</b> Integer globalSeed;
  Real r;
  Integer state[Xorshift1024star.nState];
<b>initial equation</b>
  state = initialState(localSeed, globalSeed);
<b>equation</b>
  <b>when</b> sample(0,0.1) <b>then</b>
    (r, state) = random(<b>pre</b>(state));
  <b>end when</b>;
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Random.Generators.Xorshift1024star.initialState\">Random.Generators.Xorshift1024star.initialState</a>.
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
