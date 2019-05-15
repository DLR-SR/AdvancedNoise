within AdvancedNoise.Math;
function binomial "Binomial coefficient"
  input Integer n;
  input Integer k;
  output Real b;
algorithm
  b :=(factorial(n)/factorial(n - k)/factorial(k));
  annotation (Documentation(revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      Developed 2014 at the
      <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>", info="<html>
<h4>Syntax</h4>
<blockquote><pre>
b = Math.<strong>binomial</strong>(n, k);
</pre></blockquote>

<h4>Description</h4>
<p>
...tbd...
</p>
</html>"));
end binomial;
