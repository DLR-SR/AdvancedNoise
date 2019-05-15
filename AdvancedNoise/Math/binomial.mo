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
This function returns positive integer being a coefficient in the binominal theorem,
i.e. it is the coefficient of the <var>x</var><sup><var>k</var></sup> term
of the binomial power (1 + <var>x</var>)<sup><var>n</var></sup>,
see also <a href=\"https://en.wikipedia.org/wiki/Binomial_coefficient\">Wikipedia</a>.
The coefficient is given by
</p>
<blockquote><pre>
        n!
b = -----------
    k! (n - k)!
</pre></blockquote>


<h4>Example</h4>
<blockquote><pre>
<strong>binomial</strong>(3, 0);
// = 1.0
<strong>binomial</strong>(4, 2);
// = 6.0
</pre></blockquote>
</html>"));
end binomial;
