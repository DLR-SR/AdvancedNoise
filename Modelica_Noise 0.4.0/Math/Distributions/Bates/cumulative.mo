within Modelica_Noise.Math.Distributions.Bates;
function cumulative "Cumulative distribution function of Bates distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialCumulative;
  input Real y_min=0 "Lower limit of band" annotation (Dialog);
  input Real y_max=1 "Upper limit of band" annotation (Dialog);
  input Integer n=12 "Number of uniform random values" annotation (Dialog);
protected
  Real x = (u - y_min) / (y_max - y_min) "Abbreviation into the interval (0,1)";
algorithm

  // This is the formula for the PDF:
  // pdf = n^n    /(n-1)!*sum( (-1)^k * binomial(n,k) * (x-k/n)^(n-1) , k = 0..floor(n*x))

  // The integral is actually only once over x
  // cdf = n^(n-1)/(n-1)!*sum( (-1)^k * binomial(n,k) * (x-k/n)^( n ) , k = 0..floor(n*x))

  // Only calculate a number within the boundary
  y := 0;
  if u > y_max then
    y := 1;
  elseif u >= y_min and u <= y_max then

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
  annotation (Inline=true,Documentation(info="<html>
<p>
This function returns the cumulative distribution function according to a uniform distribution in a band.
</p>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Uniform_distribution_(continuous)\">Wikipedia</a>.
</p>
</html>"));
end cumulative;
