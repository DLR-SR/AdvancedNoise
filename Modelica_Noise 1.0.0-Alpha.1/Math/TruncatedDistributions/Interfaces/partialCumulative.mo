within Modelica_Noise.Math.TruncatedDistributions.Interfaces;
partial function partialCumulative
  "Common interface of truncated cumulative distribution functions"
  extends Distributions.Interfaces.partialCumulative;
  input Real u_min=0 "Lower limit of u" annotation(Dialog);
  input Real u_max=1 "Upper limit of u" annotation(Dialog);
  annotation (Documentation(info="<html>
<p>
A partial function containing the common
arguments of the cumulative distribution functions.
</p>
</html>"));
end partialCumulative;
