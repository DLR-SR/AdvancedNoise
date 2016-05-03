within Modelica_Noise.Math.Random.Generators.Xorshift64star;
function initialState "Returns an initial state for the xorshift64* algorithm"
  extends Interfaces.initialState(final stateSize=Xorshift64star.nState);
protected
  Real r "Random number not used outside the function";

  /* According to http://vigna.di.unimi.it/ftp/papers/xorshift.pdf, the xorshoft*
     random number generator generates statistically random numbers from a bad seed
      within one iteration. To be on the safe side, 10 iterations are actually used
    */
  constant Integer p = 10 "The number of iterations to use";

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
state = Xorshift64star.<b>initialState</b>(localSeed, globalSeed);
</pre></blockquote>

<h4>Description</h4>
<p>
Generates the initial state vector <b>state</b> for the Xorshift64star random number generator
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
bad seed within one iteration. To be on the safe side, actually 10 random numbers are generated
and the returned state is the one from the last iteration.
</p>

<h4>Example</h4>
<blockquote><pre>
  <b>parameter</b> Integer localSeed;
  <b>parameter</b> Integer globalSeed;
  Integer state[Xorshift64star.nState];
<b>initial equation</b>
  state = initialState(localSeed, globalSeed);
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Random.Generators.Xorshift64star.random\">Random.Generators.Xorshift64star.random</a>.
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
