within Modelica_Noise.Math.Random.Generators;
package Xorshift128plus "Random number generator xorshift128+"
  constant Integer nState=4 "The dimension of the internal state vector";

  extends Modelica.Icons.Package;


  function initialState
  "Returns an initial state for the xorshift128+ algorithm"
    extends Interfaces.initialState(final stateSize=Xorshift128plus.nState);
  algorithm
    state := Random.Utilities.initialStateWithXorshift64star(localSeed,globalSeed,size(state, 1));
    annotation(Inline=true, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
state = Xorshift128plus.<b>initialState</b>(localSeed, globalSeed);
</pre></blockquote>

<h4>Description</h4>
<p>
Generates an initial state vector for the Xorshift128plus random number generator
(= xorshift128+ algorithm), from
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
  Integer state[Xorshift128plus.nState];
<b>initial equation</b>
  state = initialState(localSeed, globalSeed);
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Random.Generators.Xorshift128plus.random\">Random.Generators.Xorshift128plus.random</a>.
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
  end initialState;


  function random
  "Returns a uniform random number with the xorshift128+ algorithm"
    extends Interfaces.random(final stateSize=Xorshift128plus.nState);
    external "C" ModelicaRandom_xorshift128plus(stateIn, stateOut, result)
      annotation (Include = "#include \"ModelicaRandom.c\"");
    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(r, stateOut) = Xorshift128plus.<b>random</b>(stateIn);
</pre></blockquote>

<h4>Description</h4>
<p>
Returns a uniform random number in the range 0 &lt; random &le; 1 with the xorshift128+ algorithm.
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
  Integer state[Xorshift128plus.nState];
<b>initial equation</b>
  state = initialState(localSeed, globalSeed);
<b>equation</b>
  <b>when</b> sample(0,0.1) <b>then</b>
    (r, state) = random(<b>pre</b>(state));
  <b>end when</b>;
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Random.Generators.Xorshift128plus.initialState\">Random.Generators.Xorshift128plus.initialState</a>.
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
  end random;


  annotation (Documentation(info="<html>
<p>
Random number generator <b>xorshift128+</b>. This generator has a period of 2^128
(the period defines the number of random numbers generated before the sequence begins to repeat itself).
For an overview, comparison with
other random number generators, and links to articles, see
<a href=\"modelica://Modelica_Noise.Math.Random.Generators\">Math.Random.Generators</a>.
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
</html>"),
 Icon(graphics={
    Ellipse(
      extent={{-70,60},{-20,10}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{32,58},{82,8}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{-20,-12},{30,-62}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid)}));
end Xorshift128plus;
