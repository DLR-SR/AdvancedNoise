within Modelica_Noise.Math.TruncatedDistributions.Uniform;
function density
  "Density of truncated uniform distribution (= identical to uniform distribution)"
  extends Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialDensity;
algorithm
  y := Modelica_Noise.Math.Distributions.Uniform.density(u,u_min,u_max);

  annotation(Inline=true, Documentation(info="<html>
<p>
The truncated uniform distribution is identical to the uniform distribution.
For details about function density(..), see therefore
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.density\">Math.Distributions.Uniform.density</a>.
</p>
</html>"));
end density;
