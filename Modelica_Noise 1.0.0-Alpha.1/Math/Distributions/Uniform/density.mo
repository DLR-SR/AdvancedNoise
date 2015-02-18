within Modelica_Noise.Math.Distributions.Uniform;
function density "Density of uniform distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialDensity;
  input Real u_min=0 "Lower limit of u" annotation (Dialog);
  input Real u_max=1 "Upper limit of u" annotation (Dialog);
algorithm
  y := if u < u_min or u > u_max then 0.0 else 1/(u_max - u_min);

  annotation (Inline=true,Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Uniform.<b>density</b>(u, u_min=0, u_max=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the probability density function according to a <b>uniform</b> distribution in a band.
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/Uniform.density.png\">
</blockquote></p>

<p>
For more details, see 
<a href=\"http://en.wikipedia.org/wiki/Uniform_distribution_(continuous)\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  density(0.5)    // = 1
  density(0,-1,1) // = 0.5
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.cumulative\">Uniform.cumulative</a>,
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.quantile\">Uniform.quantile</a>.
</p>
</html>"));
end density;
