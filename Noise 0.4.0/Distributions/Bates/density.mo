within Noise.Distributions.Bates;
function density "Density of Bates distribution"
  import Noise.Math.factorial;
  import Noise.Math.binomial;
  extends Modelica_Noise.Math.Distributions.Interfaces.partialDensity;
  input Real y_min=0 "Lower limit of band" annotation (Dialog);
  input Real y_max=1 "Upper limit of band" annotation (Dialog);
  input Integer n=12 "Number of uniform random values" annotation (Dialog);
protected
  Real x "Abbreviation into the interval (0,1)";
algorithm
  // This is the formula for the PDF:
  // pdf = n^n/(n-1)!*sum( (-1)^k * binomial(n,k) * (x-k/n)^(n-1)               , k = 0..floor(n*x))

  // Map the scaled distribution to the stable region
  x := (u - y_min) / (y_max - y_min);
  if u > 0.5*(y_min+y_max) then
    x := 1 - x;
  end if;

  // Only calculate a number within the boundary
  y := 0;
  if u >= y_min and u <= y_max then

    // Loop over k = 0 .. floor(n*x)
    for k in 0:integer(n*x) loop
      // Sum up the inner part
      y := y + (-1)^k * binomial(n,k) * (x-k/n)^(n-1);
    end for;
    // Multiply by the outer factor
    y := n^(n)/3 / factorial(n-1) * y;

  end if;

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
