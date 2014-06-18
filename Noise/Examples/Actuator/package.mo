within Noise.Examples;
package Actuator
extends Modelica.Icons.ExamplesPackage;


annotation (Documentation(info="<html>
<p>In this model several noise scenarios have been prepared:</p>
<ol>
<li>no noise</li>
<li>Noise using PRNG</li>
<li>Noise using LinearSystems2</li>
</ol>
<p><br>The frequency content of the signals is comparable:</p>
<p><br>The time and frequency domain plot of the linearsystems noise is:</p>
<p><img src=\"modelica://Noise/Resources/Images/FrequencyLinearSystems2.png\"/></p>
<p>and the time and frequency domain plot of the PRNG using a Bates distribution noise is:</p>
<p><br><img src=\"modelica://Noise/Resources/Images/FrequencyPRNG_Bates.png\"/></p>
<p><br>This leads to comparable noise signatures. In practice, the simulations using the PRNG block are faster, since less time events have to be handled.</p>
</html>", revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Actuator;
