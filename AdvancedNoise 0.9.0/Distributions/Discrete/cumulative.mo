within AdvancedNoise.Distributions.Discrete;
function cumulative "Cumulative distribution function of discrete distribution"
  extends Modelica.Math.Distributions.Interfaces.partialCumulative;
  input Real x[:] = {0,1} "Discrete values to be chosen from" annotation(Dialog);
  input Real p[size(x,1)] = ones(size(x,1))/size(x,1)
    "The probabilities of the discrete values" annotation(Dialog);
algorithm
  y := 0;
  for i in 1:size(x,1) loop
    if u >= x[i] then
      y := y + p[i];
    end if;
  end for;
  y := y / sum(p);

  annotation (Inline=true,Documentation(info="<html>
<p>This function returns the cumulative distribution function according to a discrete distribution. </p>
<p><span style=\"font-family: MS Shell Dlg 2;\">For more details of this distribution see <a href=\"https://en.wikipedia.org/wiki/Uniform_distribution_(discrete)\">Wikipedia</a>. </span></p>
</html>"));
end cumulative;
