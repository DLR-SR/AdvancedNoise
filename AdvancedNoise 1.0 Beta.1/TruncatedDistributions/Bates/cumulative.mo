within AdvancedNoise.TruncatedDistributions.Bates;
function cumulative "Cumulative distribution function of Bates distribution"
  extends
    Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialCumulative;
  input Integer n=12 "Number of uniform random values" annotation (Dialog);
algorithm
  y := Distributions.Bates.cumulative(u, u_min, u_max, n);
  annotation (Inline=true,Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Bates.<b>cumulative</b>(u, y_min=0, y_max=1, n=12);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the cumulative distribution function 
according to a <b>Bates</b> distribution (= mean of n uniform distributions).
The returned value y is in the range:
</p>

<p><blockquote>
0 &le; y &le; 1
</blockquote></p>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Bates.cumulative.png\">
</blockquote></p>

<p>
For more details, see 
<a href=\"http://en.wikipedia.org/wiki/Bates_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  cumulative(0,-3,3,12) // = 0.5
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Bates.density\">Bates.density</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Bates.quantile\">Bates.quantile</a>.
</p>
</html>"));
end cumulative;
