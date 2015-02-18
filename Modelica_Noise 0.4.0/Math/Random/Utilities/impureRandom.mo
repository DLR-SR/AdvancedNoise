within Modelica_Noise.Math.Random.Utilities;
impure function impureRandom
  "Impure random number generator (with hidden state vector)"
  input Integer id
    "Identification number from initializeImpureRandom(..) function (is needed for correct sorting)";
  output Real y
    "A random number with a uniform distribution on the interval (0,1]";
  external "C" y = ModelicaRandom_impureRandom_xorshift1024star(id);
  annotation (Include = "#include \"ModelicaRandom.c\"", Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
r = <b>impureRandom</b>(id);
</pre></blockquote>

<h4>Description</h4>
<p>
Returns a uniform random number in the range 0 &lt; random &le; 1 with the xorshift1024* algorithm.
The dummy input Integer argument id must be the output argument of a call to function
<a href=\"modelica://Modelica_Noise.Math.Random.Utilities.initializeImpureRandom\">initializeImpureRandom</a>,
in order that the sorting order is correct (so that impureRandom is always called
after initializeImpureRandom). For every call of impureRandom(id), a different random number
is returned, so the function is impure.
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
<a href=\"modelica://Modelica_Noise.Math.Random.Utilities.initializeImpureRandom\">initializeImpureRandom</a>,
<a href=\"modelica://Modelica_Noise.Math.Random.Generators\">Random.Generators</a>
</p>
</html>"));
end impureRandom;
