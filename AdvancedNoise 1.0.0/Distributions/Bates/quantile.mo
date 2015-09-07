within AdvancedNoise.Distributions.Bates;
function quantile "Quantile of Bates distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialQuantile;
  input Real y_min=0 "Lower limit of band" annotation (Dialog);
  input Real y_max=1 "Upper limit of band" annotation (Dialog);
  input Integer n=12 "Number of uniform random values" annotation (Dialog);
protected
  Real tol = 1e-6 "Required acuracy of the quantile";
  Real y_l, y_m, y_h "Random values during search";
  Real p_l, p_m, p_h "Probabilities during search";
  Integer i "A counter for debugging";
algorithm

  // Return the limits, if the probability is not in (0,1)
  if u > 1 then
    y := y_max;
  elseif u < 0 then
    y := y_min;

  // Iterate the value, because we have not found an inverse CDF
  else

    // Initialize variables
    i   := 0;
    y_l := y_min;
    y_h := y_max;
    p_l := cumulative(y_l, y_min, y_max, n);
    p_h := cumulative(y_h, y_min, y_max, n);

    // Keep iterating as long as both estimations are not close enough
    while abs(u-p_l) > tol and abs(u-p_h) > tol loop
      i   := i + 1;

      // Calculate an intermediate point
      y_m := y_l + (y_h-y_l)/(p_h-p_l)*(u-p_l);
      p_m := cumulative(y_m, y_min, y_max, n);

      // Select narrower boundaries than before
      if p_m >= u then
        y_h := y_m;
        p_h := p_m;
      end if;
      if p_m <= u then
        y_l := y_m;
        p_l := p_m;
      end if;
    end while;

    // Select correct boundary
    if abs(u-p_l) < abs(u-p_h) then
      y := y_l;
    else
      y := y_h;
    end if;
  end if;

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
