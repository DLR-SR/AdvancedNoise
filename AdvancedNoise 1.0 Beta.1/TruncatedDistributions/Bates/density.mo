within AdvancedNoise.TruncatedDistributions.Bates;
function density "Density of Bates distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialTruncatedDensity;
  input Integer n=12 "Number of uniform random values" annotation (Dialog);
algorithm
  y := Distributions.Bates.density(u, u_min, u_max, n);

  annotation (Inline=true,Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Bates.<b>density</b>(u, y_min=0, y_max=1, n=12);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the probability density function according to a <b>Bates</b> distribution
(= mean of n uniform distributions). Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Bates.density.png\">
</blockquote></p>

<p>
For more details, see 
<a href=\"http://en.wikipedia.org/wiki/Bates_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  density(0, -3, 3, 12) // = 4.7271067821068185
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Bates.cumulative\">Bates.cumulative</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Bates.quantile\">Bates.quantile</a>.
</p>
</html>"));
end density;
