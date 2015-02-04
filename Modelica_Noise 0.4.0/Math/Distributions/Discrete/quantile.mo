within Modelica_Noise.Math.Distributions.Discrete;
function quantile
  "Quantile of discrete distribution (= inverse cumulative distribution function)"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialQuantile;
  input Real x[:] = {0,1} "Discrete values to be chosen from" annotation(Dialog);
  input Real p[size(x,1)] = ones(size(x,1))/size(x,1)
    "The probabilities of the discrete values" annotation(Dialog);
protected
  Integer iSorted[size(x,1)] "Sorted indices";
  Real    xSorted[size(x,1)] "Sorted values of x";
  Real    pSorted[size(x,1)] "Sorted values of p";
  Real    cdf;
algorithm
  (xSorted, iSorted) := Modelica.Math.Vectors.sort(x);

  cdf := 0;
  for i in 1:size(x,1) loop
    if u > cdf/sum(p) then
      y := xSorted[i];
    end if;
    cdf := cdf + p[iSorted[i]];
  end for;

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
