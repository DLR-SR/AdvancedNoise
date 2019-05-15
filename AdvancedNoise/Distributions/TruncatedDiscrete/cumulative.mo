within AdvancedNoise.Distributions.TruncatedDiscrete;
function cumulative "Cumulative distribution function of discrete distribution"
  extends Modelica.Math.Distributions.Interfaces.partialTruncatedCumulative;
  input Real x[:] = {0,1} "Discrete values to be chosen from" annotation(Dialog);
  input Real p[size(x,1)] = ones(size(x,1))/size(x,1)
    "The probabilities of the discrete values" annotation(Dialog);
protected
  Real x0[size(x,1)+2];
  Real p0[size(x,1)+2];
algorithm
  x0 := cat(1,x,{u_min,u_max});
  p0 := cat(1,p,{    0,    0});
  for i in 1:size(x,1) loop
    if x[i] < u_min then
      p0[end-1] := p0[end-1] + p0[i];
      p0[i]     := 0;
    elseif x[i] > u_max then
      p0[end-0] := p0[end-0] + p0[i];
      p0[i]     := 0;
    end if;
  end for;
  AdvancedNoise.Distributions.Discrete.cumulative(
    u,
    x0,
    p0);

  annotation (Inline=true,Documentation(info="<html>
<p>This function returns the cumulative distribution function according to a discrete distribution in a band. </p>
<p><span style=\"font-family: MS Shell Dlg 2;\">For more details of this distribution see <a href=\"https://en.wikipedia.org/wiki/Uniform_distribution_(discrete)\">Wikipedia</a>. </span></p>
</html>"));
end cumulative;
