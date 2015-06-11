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
algorithm
  y := imin + integer(impureRandom(id=id)*(imax-imin+1));
  y := min(imax, max(imin, y));

end impureRandomInteger;
