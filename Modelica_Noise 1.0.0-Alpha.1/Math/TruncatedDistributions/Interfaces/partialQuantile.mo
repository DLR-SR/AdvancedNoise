within Modelica_Noise.Math.TruncatedDistributions.Interfaces;
partial function partialQuantile
  "Common interface of truncated quantile functions (= inverse cumulative distribution functions)"
  extends Distributions.Interfaces.partialQuantile;
  input Real y_min=0 "Lower limit of y" annotation(Dialog);
  input Real y_max=1 "Upper limit of y" annotation(Dialog);
  annotation (Documentation(info="<html>
<p>
A partial function containing the common
arguments of the quantile functions.
</p>
</html>"));
end partialQuantile;
