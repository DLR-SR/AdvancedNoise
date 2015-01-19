within Modelica_Noise.Math.Random.Utilities.Interfaces;
partial function partialTruncatedQuantile
  "Interface of truncated quantile functions (= inverse cumulative distribution functions)"
  extends Modelica.Icons.Function;
  input Real u(min=0, max=1) "Random number in the range 0 <= u <= 1";
  input Real y_min=0 "Lower limit of y";
  input Real y_max=1 "Upper limit of y";
  output Real y
    "Random number u transformed according to the given distribution and in the limits y_min ... y_max";
end partialTruncatedQuantile;
