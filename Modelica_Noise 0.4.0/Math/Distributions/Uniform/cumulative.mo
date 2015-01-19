within Modelica_Noise.Math.Distributions.Uniform;
function cumulative "Cumulative distribution function of uniform distribution"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialCumulative;
  input Real y_min=0 "Lower limit of band" annotation (Dialog);
  input Real y_max=1 "Upper limit of band" annotation (Dialog);
algorithm
  y := if u < y_min then 0.0 else
       if u > y_max then 1.0 else (u-y_min)/(y_max-y_min);

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
