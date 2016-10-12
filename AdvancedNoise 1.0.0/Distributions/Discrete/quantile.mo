within AdvancedNoise.Distributions.Discrete;
function quantile
  "Quantile of discrete distribution (= inverse cumulative distribution function)"
  extends Modelica.Math.Distributions.Interfaces.partialQuantile;
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
<p>This function returns a number according to a discrete distribution. </p>
<p><span style=\"font-family: MS Shell Dlg 2;\">For more details of this distribution see <a href=\"https://en.wikipedia.org/wiki/Uniform_distribution_(discrete)\">Wikipedia</a>. </span></p>
</html>"));
end quantile;
