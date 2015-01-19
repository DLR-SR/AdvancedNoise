within Modelica_Noise.Math.Special;
function sinc "Unnormalized sinc function"
  input Real u;
  output Real y;
algorithm

  y := if abs(u) > 0.5e-4 then sin(u)/u else 1 - (u^2)/6 + (u^4)/120;

  annotation (Documentation(revisions="<html>
</html>", info="<html>
<p>
For details see <a href=\"http://en.wikipedia.org/wiki/Sinc_function\">wikipedia</a>
</p>
</html>"));
end sinc;
