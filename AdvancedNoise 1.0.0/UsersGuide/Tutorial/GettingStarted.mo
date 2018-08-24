within AdvancedNoise.UsersGuide.Tutorial;
class GettingStarted "Getting started"
extends Modelica.Icons.Information;
    annotation (Documentation(info="<html>
<p>The <b>AdvancedNoise</b> Toolbox has 3 main sources of noise:</p>
<ol>
<li><a href=\"AdvancedNoise.Sources.TimeBasedNoise\">TimeBasedNoise</a>: This block generated a noise output based on the simulation time.</li>
<li><a href=\"AdvancedNoise.Sources.SignalBasedNoise\">SignalBasedNoise</a>: This block generates a noise output based on a given input variable. One of the main applications of this block is a position dependant noise. Such position dependant noise is used e.g. for rail irragulatities in railway vehicles or road irragularities in road vehicles. </li>
<li><a href=\"AdvancedNoise.Sources.ColoredSignalBasedNoise\">ColoredSignalBasedNoise</a>: This block is used if a colored noise is needed when. Using this block, a specified frequency spectrum can be suppliedby the user.</li>
</ol>
<p>Please refer to the documentation of these blocks to understand their working. </p>
<p>If the supplied noise distributions or interpolation algorithms are not suitable for the needed application, the user can generate custom distributions and interpolation algorithms that can be used with this library.</p>
</html>", revisions="<html>
<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
</td><td valign=\"bottom\">
         <b>Copyright</b> <b>&copy; DLR Institute of System Dynamics and Control</b><br>
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</html>"));
end GettingStarted;
