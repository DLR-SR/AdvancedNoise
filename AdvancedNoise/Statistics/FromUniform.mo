within AdvancedNoise.Statistics;
block FromUniform
  "Convert uniformly distributed random number to different distribution"
  extends Modelica.Blocks.Interfaces.SISO;
  replaceable function distribution =
    Modelica.Math.Distributions.Interfaces.partialQuantile
    "The target distribution"
    annotation(choicesAllMatching=true);
equation
  y = distribution(u);
  annotation (Documentation(info="<html>
<p>
This block converts a uniformly distributed random input to a different distribution.
</p>
</html>"));
end FromUniform;
