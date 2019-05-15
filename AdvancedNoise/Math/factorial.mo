within AdvancedNoise.Math;
function factorial "The product of all integer <= the input"
  input Integer n(min=0) "Positive integer";
  output Integer f "Factorial of n";
algorithm
  f := 1;
  for i in 1:n loop
    f := f*i;
  end for;
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
f = Math.<strong>factorial</strong>(n);
</pre></blockquote>

<h4>Description</h4>
<p>
This function returns product of all positive integers less
then or equal to input <code>n</code>.
</p>

<h4>Example</h4>
<blockquote><pre>
<strong>factorial</strong>(5);
// = 120
<strong>factorial</strong>(0);
// = 1
</pre></blockquote>
</html>"));
end factorial;
