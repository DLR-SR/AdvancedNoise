within Modelica_Noise.Math.Distributions.Interfaces;
partial function partialQuantile
  "Interface of quantile functions (= inverse cumulative distribution functions)"
  extends Modelica.Icons.Function;
  input Real u(min=0, max=1) "Random number in the range 0 <= u <= 1";
  output Real y
    "Random number u transformed according to the given distribution";
end partialQuantile;
