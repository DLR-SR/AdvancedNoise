within Modelica_Noise.Math.Distributions.Interfaces;
partial function partialDensity
  "Common interface of probability density functions"
  extends Modelica.Icons.Function;
  input Real u "Random number over the real axis (-inf < u < inf)";
  output Real y "Density of u";
  annotation (Documentation(info="<html>
<p>
A partial function containing the common
arguments of the probability density functions.
</p>
</html>"));
end partialDensity;
