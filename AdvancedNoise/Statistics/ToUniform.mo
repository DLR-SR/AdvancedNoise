within AdvancedNoise.Statistics;
block ToUniform
  "Convert random number with a different distribution to uniform distribution"
  extends Modelica.Blocks.Interfaces.SISO;
  replaceable function distribution =
    Modelica.Math.Distributions.Interfaces.partialCumulative
    "The source distribution"
    annotation(choicesAllMatching=true);
equation
  y = distribution(u);
  annotation (Documentation(info="<html>
<p>
This block converts a&nbsp;random number with a&nbsp;different distribution to
a&nbsp;uniformly distributed random output.</p>
</html>"));
end ToUniform;
