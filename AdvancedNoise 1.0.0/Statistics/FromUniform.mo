within AdvancedNoise.Statistics;
block FromUniform
  "Converts a uniformly distributed random number to a different distribution"
  extends Modelica.Blocks.Interfaces.SISO;
  replaceable function distribution =
    Modelica.Math.Distributions.Interfaces.partialQuantile
    "The target distribution"
    annotation(choicesAllMatching=true);
equation
  y = distribution(u);
end FromUniform;
