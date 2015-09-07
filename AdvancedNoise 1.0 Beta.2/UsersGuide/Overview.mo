within AdvancedNoise.UsersGuide;
class Overview
  extends Modelica.Icons.IconsPackage;
  annotation (__Dymola_DocumentationClass=true, Documentation(info="<html>
<h4>Information</h4>
<p>The blocks in this library can be used to generate accurate noise without further modifications. The functionality of the library consists of:</p>
<ul>
<li>Different <a href=\"Generators\">random number generators</a> can be chosen and custom generators implemented.</li>
<li>Multiple <a href=\"Distributions\">distibutions</a> are supplied, but also own distributions can be added.</li>
<li>Different<a href=\"Interpolators\"> interpolation algorithms</a> can be used to smooth the noise signal, which can improve the system simulation performance. Furthermore this allows to model a &QUOT;continuous noise&QUOT;.</li>
<li>Calculation of <a href=\"Statistics\">statistical properties</a>.</li>
</ul>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end Overview;
