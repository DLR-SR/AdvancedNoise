within Modelica_Noise.Math.Distributions.Interfaces;
partial function partialCumulative
  "Common interface of cumulative distribution functions"
  extends Modelica.Icons.Function;
  input Real u "Value over the real axis (-inf < u < inf)";
  output Real y "Value in the range 0 <= y <= 1";
  annotation (Documentation(info="<html>
<p>
A partial function containing the common
arguments of the cumulative distribution functions.
</p>
</html>"));
end partialCumulative;
