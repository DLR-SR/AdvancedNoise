within Modelica_Noise.Math.Distributions.Weibull;
function density "Density of Weibull distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialDensity;
  input Real lambda(min=0) = 1 "Scale parameter of the Weibull distribution" annotation(Dialog);
  input Real k(min=0) = 1 "Shape parameter of the Weibull distribution" annotation(Dialog);
algorithm
  y :=if u >= 0 then (k/lambda)*(u/lambda)^(k - 1)*exp(-(u/lambda)^k) else 0.0;

  annotation (Inline=true, Documentation(info="<html>
<p>
<h4>Syntax</h4>
<blockquote><pre>
Weibull.<b>density</b>(u, lambda=1, k=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the probability density function according to a <b>Weibull</b> distribution
with scale parameter <b>lambda</b> and shape parameter <b>k</b>. Equation:
</p>

<blockquote><pre>
y = if u >= 0 then (k/lambda)*(u/lambda)^(k - 1)*exp(-(u/lambda)^k) else 0.0;
</pre></blockquote>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Weibull.density.png\">
</blockquote></p>

<p>
For more details, see 
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  density(0.5)     // = 0.36787944117144233
  density(1,0.5,2) // = 0.14652511110987343
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Weibull.cumulative\">Weibull.cumulative</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Weibull.quantile\">Weibull.quantile</a>.
</p>
</html>"));
end density;
