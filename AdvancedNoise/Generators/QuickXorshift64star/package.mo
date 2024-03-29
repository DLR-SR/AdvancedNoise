within AdvancedNoise.Generators;
package QuickXorshift64star "Random number generator xorshift64* with quicker initialization"
  extends Utilities.Interfaces.PartialGenerator(final nState=2);


  redeclare function extends initialState
  "Returns an initial state for the xorshift64* algorithm"

    /* According to http://vigna.di.unimi.it/ftp/papers/xorshift.pdf, the xorshoft*
     random number generator generates statistically random numbers from a bad seed
     within one iteration.
    */
    input Integer p = 5 "The number of iterations to use";
protected
    Real r "Random number not used outside the function";

  algorithm
    // If seed=0 use a large prime number as seed (seed must be different from 0).
    if localSeed == 0 and globalSeed == 0 then
      state := {126247697,globalSeed};
    else
      state := {localSeed,globalSeed};
    end if;

    // Generate p-times a random number, in order to get a "good" state
    // even if starting from a bad seed.
    for i in 1:p loop
      (r,state) := random(state);
    end for;
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
state = Xorshift64star.<strong>initialState</strong>(localSeed, globalSeed, p);
</pre></blockquote>

<h4>Description</h4>
<p>
Generates the initial state vector <strong>state</strong> for the Xorshift64star random number generator
(= xorshift64* algorithm), from
two Integer numbers given as input (arguments localSeed, globalSeed). Any Integer numbers
can be given (including zero or negative number). The function returns
a reasonable initial state vector with the following strategy:
</p>

<p>
If both input
arguments are zero, a fixed non-zero value is used internally for localSeed.
According to <a href=\"http://vigna.di.unimi.it/ftp/papers/xorshift.pdf\">xorshift.pdf</a>,
the xorshift64* random number generator generates statistically random numbers from a
bad seed within one iteration. To be on the safe side, actually 5 random numbers are generated
and the returned state is the one from the last iteration. 
The number of iterations can be modified by input&nbsp;<code>p</code>.
</p>

<h4>Example</h4>
<blockquote><pre>
  <strong>parameter</strong> Integer localSeed;
  <strong>parameter</strong> Integer globalSeed;
  Integer state[Xorshift64star.nState];
<strong>initial equation</strong>
  state = initialState(localSeed, globalSeed);
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Math.Random.Generators.Xorshift64star.random\">Random.Generators.Xorshift64star.random</a>.
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
  "Returns a uniform random number with the xorshift64* algorithm"
    external "C" ModelicaRandom_xorshift64star(stateIn, stateOut, result)
      annotation (Library="ModelicaExternalC");
    annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(r, stateOut) = Xorshift64star.<strong>random</strong>(stateIn);
</pre></blockquote>

<h4>Description</h4>
<p>
Returns a uniform random number r in the range 0&nbsp;&lt;&nbsp;r&nbsp;&le;&nbsp;1 with the xorshift64* algorithm.
Input argument <strong>stateIn</strong> is the state vector of the previous call.
Output argument <strong>stateOut</strong> is the updated state vector.
If the function is called with identical stateIn vectors, exactly the
same random number r is returned.
</p>

<h4>Example</h4>
<blockquote><pre>
  <strong>parameter</strong> Integer localSeed;
  <strong>parameter</strong> Integer globalSeed;
  Real r;
  Integer state[Xorshift64star.nState];
<strong>initial equation</strong>
  state = initialState(localSeed, globalSeed);
<strong>equation</strong>
  <strong>when</strong> sample(0,0.1) <strong>then</strong>
    (r, state) = random(<strong>pre</strong>(state));
  <strong>end when</strong>;
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Math.Random.Generators.Xorshift64star.initialState\">Random.Generators.Xorshift64star.initialState</a>.
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
<p>Random number generator <strong>xorshift64*</strong>. This generator has a period of 2^64 (the period defines the number of random numbers generated before the sequence begins to repeat itself). In contrast to the <a href=\"modelica://Modelica.Math.Random.Generators.Xorshift64star\">version</a> in Modelica, this version of the generator uses a single iteration to generate a new random number.</p>
<p>For an overview, comparison with other random number generators, and links to articles, see <a href=\"modelica://Modelica.Math.Random.Generators\">Math.Random.Generators</a>. </p>
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
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
    Ellipse(
      extent={{-64,0},{-14,-50}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{12,52},{62,2}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid)}));
end QuickXorshift64star;
