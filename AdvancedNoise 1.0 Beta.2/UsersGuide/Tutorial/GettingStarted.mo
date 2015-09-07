within AdvancedNoise.UsersGuide.Tutorial;
class GettingStarted "Getting started"
extends FaultTriggering.Utilities.Icons.Information;
    annotation (Documentation(info="<html>
<p>The <b>AdvancedNoise</b> Toolbox has 3 main sources of noise:</p>
<ol>
<li><a href=\"AdvancedNoise.Sources.TimeBasedNoise\">TimeBasedNoise</a>: This block generated a noise output based on the simulation time.</li>
<li><a href=\"AdvancedNoise.Sources.SignalBasedNoise\">SignalBasedNoise</a>: This block generates a noise output based on a given input variable. One of the main applications of this block is a position dependant noise. Such position dependant noise is used e.g. for rail irragulatities in railway vehicles or road irragularities in road vehicles. </li>
<li><a href=\"AdvancedNoise.Sources.ColoredSignalBasedNoise\">ColoredSignalBasedNoise</a>: This block is used if a colored noise is needed when. Using this block, a specified frequency spectrum can be suppliedby the user.</li>
</ol>
<p>If the supplied noise distributions are not suitable for the needed application, the user can generate custom distributions. </p>
</html>", revisions="<html><table border=0 cellspacing=0 cellpadding=0>
  <tr><td valign=\"center\"> <img src=\"modelica://FaultTriggering/Resources/Documentation/Images/logo_dlr.png\" width=60></td>
    <td valign=\"center\"><b>Copyright</b>
      <br><b>&copy; 2012-2015, DLR Institute of System Dynamics and Control</b></td>
  </tr>
 </table>
</html>"));
end GettingStarted;
