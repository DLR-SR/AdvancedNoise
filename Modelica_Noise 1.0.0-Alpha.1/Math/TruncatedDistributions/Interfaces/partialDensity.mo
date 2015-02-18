within Modelica_Noise.Math.TruncatedDistributions.Interfaces;
partial function partialDensity
  "Common interface of truncated probability density functions"
  extends Distributions.Interfaces.partialDensity;
  input Real u_min=0 "Lower limit of u" annotation(Dialog);
  input Real u_max=1 "Upper limit of u" annotation(Dialog);
  annotation (Documentation(info="<html>
<p>
A partial function containing the common
arguments of the probability density functions.
</p>
</html>"));
end partialDensity;
