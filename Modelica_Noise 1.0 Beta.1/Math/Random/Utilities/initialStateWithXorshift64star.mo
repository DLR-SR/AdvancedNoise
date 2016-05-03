within Modelica_Noise.Math.Random.Utilities;
function initialStateWithXorshift64star
  "Return an initial state vector for a random number generator (based on xorshift64star algorithm)"
  import Modelica_Noise.Math.Random.Generators.Xorshift64star;
  extends Modelica.Icons.Function;
  input Integer localSeed
    "The local seed to be used for generating initial states";
  input Integer globalSeed "The global seed to be combined with the local seed";
  input Integer nState(min=1) "The dimension of the state vector (>= 1)";
  output Integer[nState] state "The generated initial states";

protected
  Real r "Random number only used inside function";
  Integer aux[2] "Intermediate container of state integers";
  Integer nStateEven "Highest even number <= nState";
algorithm
  // Set the first 2 states by using the initialState() function
  aux            := Xorshift64star.initialState(localSeed, globalSeed);
  if nState >= 2 then
    state[1:2]   := aux;
  else
    state[1]     := aux[1];
  end if;

  // Fill the next elements of the state vector
  nStateEven     := 2*div(nState, 2);
  for i in 3:2:nStateEven loop
    (r,aux)      := Xorshift64star.random(state[i-2:i-1]);
    state[i:i+1] := aux;
  end for;

  // If nState is uneven, fill the last element as well
  if nState >= 3 and nState <> nStateEven then
    (r,aux)       := Xorshift64star.random(state[nState-2:nState-1]);
    state[nState] := aux[1];
  end if;

  annotation (Documentation(revisions="<html>
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
</html>", info="<html>
<h4>Syntax</h4>
<blockquote><pre>
state = Utilities.<b>initialStateWithXorshift6star</b>(localSeed, globalSeed, nState);
</pre></blockquote>

<h4>Description</h4>

<p>
The <a href=\"modelica://Modelica_Noise.Math.Random.Generators.Xorshift64star\">Xorshift64star</a>
random number generator is used to fill a state vector of length nState (nState &ge; 1) with random numbers and return
this vector. Arguments localSeed and globalSeed are any Integer numbers (including zero or negative number)
that characterize the initial state.
If the same localSeed, globalSeed, nState is given, the same state vector is returned.
</p>

<h4>Example</h4>
<blockquote><pre>
  parameter Integer localSeed;
  parameter Integer globalSeed;
  Integer state[33];
<b>initial equation</b>
  state = Utilities.initialStateWithXorshift64star(localSeed, globalSeed, size(state,1));
</pre></blockquote>
</html>"));
end initialStateWithXorshift64star;
