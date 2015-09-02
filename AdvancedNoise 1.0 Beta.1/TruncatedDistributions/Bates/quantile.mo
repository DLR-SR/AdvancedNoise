within AdvancedNoise.TruncatedDistributions.Bates;
function quantile "Quantile of Bates distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialTruncatedQuantile;
  input Integer n=12 "Number of uniform random values" annotation (Dialog);
algorithm
  y := Distributions.Bates.quantile(u, y_min, y_max, n);
  annotation (Inline=true,Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Bates.<b>quantile</b>(u, y_min=0, y_max=1, n=12);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the inverse cumulative distribution function (= quantile) according to a <b>Bates</b>
distribution (= mean of n uniform distributions). Input argument u must be in the range:
</p>

<blockquote>
<p>
0 &le; u &le; 1
</p>
</blockquote>

<p>
The returned number y is in the range:
</p>

<blockquote>
<p>
y_min &le; y &le; y_max
</p>
</blockquote>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Bates.quantile.png\">
</blockquote></p>

<p>
For more details, see 
<a href=\"http://en.wikipedia.org/wiki/Bates_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  quantile(0.5,-3,3,12) // = -7.450831063238184E-010
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Bates.density\">Bates.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Bates.cumulative\">Bates.cumulative</a>.
</p>
</html>"));
end quantile;
