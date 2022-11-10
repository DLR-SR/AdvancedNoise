within AdvancedNoise;
package UsersGuide "User's guide"
  extends Modelica.Icons.Information;


  annotation (
    DocumentationClass=true,
    Documentation(info="<html>
<p>
The AdvancedNoise Library is a&nbsp;library that is used to supply Modelica
models of a&nbsp;high-quality noise input. In addition to the random number
generation contained in the Modelica standard library, this library provides:
</p>
<ul>
  <li>
    an event-free noise generator using DIRCS Immediate Random with Continuous Seed,
  </li>
  <li>
    additional distributions and statistics tools,
  </li>
  <li>
    smooth interpolation methods for noise sources,
  </li>
  <li>
    frequency shaping according to given power spectral densities.
  </li>
</ul>
<p>
By using different distributions, interpolation methods and the possibility to
use time or a&nbsp;signal as the base of the noise, most cases of real-life system
noise can be modeled. Examples of such noise inputs are:
</p>
<ul>
  <li>
    sensor noise
  </li>
  <li>
    rail irregulatities in train simulations
  </li>
  <li>
    gust loads on aircraft
  </li>
  <li>
    inputs for Monte-Carlo analysis
  </li>
</ul>
<p>
The library gives the user acces to a&nbsp;high quality noise source with good
statistcal properties.
</p>
</html>", revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      <strong>Copyright</strong> <strong>&copy; DLR Institute of System Dynamics and Control</strong><br>
      Initial version implemented by
      A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
      <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>"));
end UsersGuide;
