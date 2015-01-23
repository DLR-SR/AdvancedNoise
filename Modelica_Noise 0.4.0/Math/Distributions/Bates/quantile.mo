within Modelica_Noise.Math.Distributions.Bates;
function quantile
  "Quantile of Bates distribution (= inverse cumulative distribution function)"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialQuantile;
  input Real y_min=0 "Lower limit of band" annotation (Dialog);
  input Real y_max=1 "Upper limit of band" annotation (Dialog);
  input Integer n=12 "Number of uniform random values" annotation (Dialog);
  input Real tol = 1e-6 "Required acuracy of the quantile" annotation (Dialog);
protected
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
      //Modelica.Utilities.Streams.print(String(y_l)+","+String(y_m)+","+String(y_h)+" -- "+String(p_l)+","+String(p_m)+","+String(p_h));

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
    Modelica.Utilities.Streams.print(String(i));

    // Select correct boundary
    if abs(u-p_l) < abs(u-p_h) then
      y := y_l;
    else
      y := y_h;
    end if;
  end if;

  annotation (Inline=true,Documentation(info="<html>
<p>
This function returns a number according to a uniform distribution in a band.
This means the returned number is in the range:
</p>

<blockquote>
<p>
y_min &le; y &le; y_max
</p>
</blockquote>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Uniform_distribution_(continuous)\">Wikipedia</a>.
</p>
</html>"));
end quantile;
