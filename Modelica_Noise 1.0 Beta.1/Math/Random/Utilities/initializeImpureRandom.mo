within Modelica_Noise.Math.Random.Utilities;
function initializeImpureRandom
  "Initializes the internal state of the impure random number generator"
  input Integer seed
    "The input seed to initialize the impure random number generator";
  output Integer id
    "Identification number to be passed as input to function impureRandom, in order that sorting is correct";
protected
  constant Integer localSeed = 715827883
    "Since there is no local seed, a large prime number is used";
  Integer state[33]
    "The internal state vector of the impure random number generator";

  function setInternalState
    "Stores the given state vector in an external static variable"
    input Integer[33] state "The initial state";
    input Integer id;
    external "C" ModelicaRandom_setInternalState_xorshift1024star(state, size(state,1), id)
      annotation (Include = "#include \"ModelicaRandom.c\"");
  end setInternalState;

algorithm
  // Determine the internal state (several iterations with a generator that quickly generates good numbers
  state := Random.Utilities.initialStateWithXorshift64star(localSeed,seed,size(state, 1));
  id :=localSeed;

  // Copy the internal state into the internal C static memory
  setInternalState(state, id);
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
id = <b>initializeImpureRandom</b>(seed);
</pre></blockquote>

<h4>Description</h4>

<p>
Generates a hidden initial state vector for the
<a href=\"modelica://Modelica_Noise.Math.Random.Generators.Xorshift1024star\">Xorshift1024star</a>
random number generator (= xorshift1024* algorithm), from Integer input argument seed. Argument seed
can be given any value (including zero or negative number). The function returns the
dummy Integer number id. This number needs to be passed as input to function
<a href=\"modelica://Modelica_Noise.Math.Random.Utilities.impureRandom\">impureRandom</a>,
in order that the sorting order is correct (so that impureRandom is always called
after initializeImpureRandom). The function stores a reasonable initial state vector
in a C-static memory by using the
<a href=\"modelica://Modelica_Noise.Math.Random.Generators.Xorshift64star\">Xorshift64star</a>
random number generator to fill the internal state vector with 64 bit random numbers.
</p>

<h4>Example</h4>
<blockquote><pre>
  <b>parameter</b> Integer seed;
  Real r;
  <b>function</b> random = impureRandom (<b>final id=id);
<b>protected </b>
  Integer id;
<b>equation</b>
  // Initialize the random number generator
  <b>when</b> initial() <b>then</b>
    id = initializeImpureRandom(seed);
  <b>end when</b>;

  // Use the random number generator
  <b>when</b> sample(0,0.001) <b>then</b>
     r = random();
  <b>end when</b>;
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Random.Utilities.impureRandom\">Utilities.impureRandom</a>,
<a href=\"modelica://Modelica_Noise.Math.Random.Generators\">Random.Generators</a>
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
end initializeImpureRandom;
