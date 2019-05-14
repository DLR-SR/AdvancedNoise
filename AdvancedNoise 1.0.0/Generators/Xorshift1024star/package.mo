within AdvancedNoise.Generators;
package Xorshift1024star "Random number generator xorshift1024*"
  extends Utilities.Interfaces.PartialGenerator(final nState=33);
  import generator = Modelica.Math.Random.Generators.Xorshift1024star;


  redeclare function extends initialState
  "Returns an initial state for the xorshift1024* algorithm"
  algorithm
    state := generator.initialState(localSeed,globalSeed);
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
The <a href=\"modelica://Modelica.Math.Random.Generators.Xorshift64star\">Xorshift64star</a>
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
<a href=\"modelica://Modelica.Math.Random.Generators.Xorshift1024star.random\">Random.Generators.Xorshift1024star.random</a>.
</p>
</html>", revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th align=\"left\">Description</th>
  </tr>
  <tr>
    <td valign=\"top\"> June 22, 2015 </td>
    <td valign=\"top\">
      <table border=\"0\">
        <tr>
          <td valign=\"top\">
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));
  end initialState;


  redeclare function extends random
  "Returns a uniform random number with the xorshift1024* algorithm"
  algorithm
    (result, stateOut) := generator.random(stateIn);
    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(r, stateOut) = Xorshift128plus.<b>random</b>(stateIn);
</pre></blockquote>

<h4>Description</h4>
<p>
Returns a uniform random number in the range 0&nbsp;&lt;&nbsp;random&nbsp;&le;&nbsp;1 with the xorshift1024* algorithm.
Input argument <b>stateIn</b> is the state vector of the previous call.
Output argument <b>stateOut</b> is the updated state vector.
If the function is called with identical stateIn vectors, exactly the
same random number&nbsp;r is returned.
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
<a href=\"modelica://Modelica.Math.Random.Generators.Xorshift1024star.initialState\">Random.Generators.Xorshift1024star.initialState</a>.
</p>
</html>", revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th align=\"left\">Description</th>
  </tr>
  <tr>
    <td valign=\"top\"> June 22, 2015 </td>
    <td valign=\"top\">
      <table border=\"0\">
        <tr>
          <td valign=\"top\">
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));
  end random;


  annotation (Documentation(info="<html>
<p>
Random number generator <b>xorshift1024*</b>. This generator has a period of 2^1024
(the period defines the number of random numbers generated before the sequence begins to repeat itself).
For an overview, comparison with other random number generators, and links to articles, see
<a href=\"modelica://Modelica.Math.Random.Generators\">Math.Random.Generators</a>.
</p>
</html>", revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th align=\"left\">Description</th>
  </tr>
  <tr>
    <td valign=\"top\"> June 22, 2015 </td>
    <td valign=\"top\">
      <table border=\"0\">
        <tr>
          <td valign=\"top\">
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"),
 Icon(graphics={
    Ellipse(
      extent={{-70,78},{-20,28}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{20,58},{70,8}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{-64,6},{-14,-44}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{16,-20},{66,-70}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid)}));
end Xorshift1024star;
