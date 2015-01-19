within Modelica_Noise.Math.Distributions.Interfaces;
partial function partialDensity "Interface of probability density functions"
  extends Modelica.Icons.Function;
  input Real u "Random number over the real axis (-inf < u < inf)";
  output Real y "Density of u";
end partialDensity;
