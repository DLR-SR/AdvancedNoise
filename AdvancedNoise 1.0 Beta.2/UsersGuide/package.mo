within AdvancedNoise;
package UsersGuide "User's guide"
  extends FaultTriggering.Utilities.Icons.InformationPackage;


  annotation (__Dymola_DocumentationClass=true, Documentation(info="<html>
<p>The AdvancedNoise Library is a library that is used to supply Modelica models of a high-quality noise input. By using different distributions, interpolation methods and the possibility to use time or a signal as the base of the noise, most cases of real-life system noise can be modeled. Examples of such noise inputs are:</p>
<ul>
<li>Sensor noise</li>
<li>Rail irregulatities in train simulations</li>
<li>Gust loads on aircrafts</li>
<li>Inputs for Monte-Carlo analysis</li>
</ul>
<p>The library gives the user acces to a high quality noise source with good statistcal properties.</p>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end UsersGuide;
