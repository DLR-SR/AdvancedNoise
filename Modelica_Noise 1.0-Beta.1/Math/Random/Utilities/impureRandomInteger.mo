within Modelica_Noise.Math.Random.Utilities;
function impureRandomInteger
  "Impure random number generator for integer values (with hidden state vector)"
  input Integer id
    "Identification number from initializeImpureRandom(..) function (is needed for correct sorting)";
  input Integer imin = 1 "Minimum integer to generate";
  input Integer imax = Modelica.Constants.Integer_inf
    "Maximum integer to generate";
  output Integer y
    "A random number with a uniform distribution on the interval [imin,imax]";
protected
  Real r "Impure Real random number";
algorithm
  r  := impureRandom(id=id);
  y  := integer(  r  *imax) + integer((1-r)*imin);
  y  := min(imax, max(imin, y));

  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
r = <b>impureRandomInteger</b>(id, imin=1, imax=Modelica.Constants.Integer_inf);
</pre></blockquote>

<h4>Description</h4>
<p>
Returns an Integer random number in the range imin &le; random &le; imax with the xorshift1024* algorithm,
(the random number in the range 0 ... 1 returned by the xorshift1024* algorithm is mapped to
an Integer number in the range imin ... imax).
The dummy input Integer argument id must be the output argument of a call to function
<a href=\"modelica://Modelica_Noise.Math.Random.Utilities.initializeImpureRandom\">initializeImpureRandom</a>,
in order that the sorting order is correct (so that impureRandomInteger is always called
after initializeImpureRandom). For every call of impureRandomInteger(id), a different random number
is returned, so the function is impure.
</p>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Random.Utilities.initializeImpureRandom\">initializeImpureRandom</a>,
<a href=\"modelica://Modelica_Noise.Math.Random.Generators\">Random.Generators</a>
</p>
<h4>Note</h4>
<p>This function is impure!</p>
</html>"));
end impureRandomInteger;
