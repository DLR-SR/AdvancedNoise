within AdvancedNoise.UsersGuide;
class Overview "Overview"
  extends Modelica.Icons.Information;
  annotation (
    DocumentationClass=true,
    Documentation(info="<html>
<p>
The blocks in this library can be used to generate accurate noise without
further modifications. The functionality of the library consists of:
</p>
<ul>
  <li>
    Different <a href=\"modelica://AdvancedNoise.Generators\">random number generators</a>
    can be chosen and custom generators implemented. See also
    <a href=\"modelica://Modelica.Math.Random.Generators\">Modelica.Math.Random.Generators</a>.
  </li>
  <li>
    Multiple <a href=\"modelica://AdvancedNoise.Distributions\">distibutions</a> are
    supplied, but also own distributions can be added. See also
    <a href=\"modelica://Modelica.Math.Distributions\">Modelica.Math.Distributions</a>.
  </li>
  <li>
    Different <a href=\"modelica://AdvancedNoise.Interpolators\">interpolation algorithms</a>
    can be used to smooth the noise signal, which can improve the system simulation
    performance. Furthermore this allows to model a &quot;continuous noise&quot;.
  </li>
  <li>
    Calculation of <a href=\"modelica://AdvancedNoise.Statistics\">statistical properties</a>.
  </li>
</ul>
</html>", revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      Initial version implemented by
      A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
      <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>"));
end Overview;
