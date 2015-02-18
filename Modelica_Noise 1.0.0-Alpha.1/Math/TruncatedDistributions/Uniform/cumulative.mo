within Modelica_Noise.Math.TruncatedDistributions.Uniform;
function cumulative
  "Cumulative distribution function of truncated uniform distribution (= identical to uniform distribution)"
  extends
    Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialCumulative;
algorithm
  y := Modelica_Noise.Math.Distributions.Uniform.cumulative(u,u_min,u_max);

  annotation(Inline=true, Documentation(info="<html>
<p>
The truncated uniform distribution is identical to the uniform distribution.
For details about function cumulative(..), see therefore
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.cumulative\">Math.Distributions.Uniform.cumulative</a>.
</p>
</html>"));
end cumulative;
