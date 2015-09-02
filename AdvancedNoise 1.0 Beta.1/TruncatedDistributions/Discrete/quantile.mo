within AdvancedNoise.TruncatedDistributions.Discrete;
function quantile
  "Quantile of discrete distribution (= inverse cumulative distribution function)"
  extends Modelica_Noise.Math.Distributions.Interfaces.partialTruncatedQuantile;
  input Real x[:] = {0,1} "Discrete values to be chosen from" annotation(Dialog);
  input Real p[size(x,1)] = ones(size(x,1))/size(x,1)
    "The probabilities of the discrete values" annotation(Dialog);
protected
  Real x0[size(x,1)+2];
  Real p0[size(x,1)+2];
algorithm
  x0 := cat(1,x,{y_min,y_max});
  p0 := cat(1,p,{    0,    0});
  for i in 1:size(x,1) loop
    if x[i] < y_min then
      p0[end-1] := p0[end-1] + p0[i];
      p0[i]     := 0;
    elseif x[i] > y_max then
      p0[end-0] := p0[end-0] + p0[i];
      p0[i]     := 0;
    end if;
  end for;
  AdvancedNoise.Distributions.Discrete.quantile(
    u,
    x0,
    p0);

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
