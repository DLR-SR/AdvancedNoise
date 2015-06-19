within Modelica_Noise.Math.Random.Utilities;
function impureRandomInteger
  "Impure random number generator for integer values (with hidden state vector)"
  input Integer id
    "Identification number from initializeImpureRandom(..) function (is needed for correct sorting)";
  input Integer imin = 1 "Minimum integer to generate";
  input Integer imax = Modelica.Constants.Integer_inf
    "Maximum integer to generate";
  output Integer y
    "A random number with a uniform distribution on the interval (0,1]";
protected
  Real r "Impure Real random number";
algorithm
  r  := impureRandom(id=id);
  y  := integer(  r  *imax) + integer((1-r)*imin);
  y  := min(imax, max(imin, y));

end impureRandomInteger;
