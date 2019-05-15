within AdvancedNoise.Statistics;
block ToUniform
  "Converts a random number with a different distribution to a uniform distribution"
  extends Modelica.Blocks.Interfaces.SISO;
  replaceable function distribution =
    Modelica.Math.Distributions.Interfaces.partialCumulative
    "The source distribution"
    annotation(choicesAllMatching=true);
equation
  y = distribution(u);
end ToUniform;
