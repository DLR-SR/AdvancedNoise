within AdvancedNoise.Distributions.Bates;
function cumulative "Cumulative distribution function of Bates distribution"
  import AdvancedNoise.Math.factorial;
  import AdvancedNoise.Math.binomial;
  extends Modelica.Math.Distributions.Interfaces.partialCumulative;
  input Real y_min=0 "Lower limit of band" annotation (Dialog);
  input Real y_max=1 "Upper limit of band" annotation (Dialog);
  input Integer n=12 "Number of uniform random values" annotation (Dialog);
protected
  Real x "Abbreviation into the interval (0,1)";
algorithm

  // This is the formula for the PDF:
  // pdf = n^n    /(n-1)!*sum( (-1)^k * binomial(n,k) * (x-k/n)^(n-1) , k = 0..floor(n*x))

  // The integral is actually only once over x
  // cdf = n^(n-1)/(n-1)!*sum( (-1)^k * binomial(n,k) * (x-k/n)^( n ) , k = 0..floor(n*x))

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
      y := y + (-1)^k * binomial(n,k) * (x-k/n)^(n);
    end for;
    // Multiply by the outer factor
    y := n^(n-1) / factorial(n-1) * y;

  elseif u > y_max then
    y := 1;
  end if;

  // Invert the CDF for x > 0.5
  if u > 0.5*(y_min+y_max) and u <= y_max then
    y := 1 - y;
  end if;
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

<blockquote>
0 &le; y &le; 1
</blockquote>

<p>
Plot of the function:
</p>

<blockquote>
<img src=\"modelica://Modelica/Resources/Images/Math/Distributions/Bates.cumulative.png\" alt=\"Diagram cumulative.png\">
</blockquote>

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
<a href=\"modelica://Modelica.Math.Distributions.Bates.density\">Bates.density</a>,
<a href=\"modelica://Modelica.Math.Distributions.Bates.quantile\">Bates.quantile</a>.
</p>
</html>"));
end cumulative;
