within Modelica_Noise.Math.Distributions.Interfaces;
partial function partialQuantile
  "Common interface of quantile functions (= inverse cumulative distribution functions)"
  extends Modelica.Icons.Function;
  input Real u(min=0, max=1) "Random number in the range 0 <= u <= 1";
  output Real y
    "Random number u transformed according to the given distribution";
  annotation (Documentation(info="<html>
<p>
A partial function containing the common
arguments of the quantile functions.
</p>
</html>"));
end partialQuantile;
