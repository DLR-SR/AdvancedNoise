within ;
package Noise "An open Library for the Generation of Stochastic Signals in Modelica"
  extends Modelica.Icons.Package;


annotation (version =                        "0.2",
            versionDate =                    "2014-06-13",
            versionBuild =                   1,
            revisionId =                     "$Id: package.mo 23235 2014-06-13 12:38:31Z kloe_ad $",
    uses(Modelica(version="3.2.1"),
         Modelica_StateGraph2(version="2.0.2"),
         Design(version="1.0.3"),
         Modelica_LinearSystems2(version="2.3.1")),
  Icon(graphics={Line(
        points={{-80,-52},{-70,22},{-64,-46},{-54,6},{-46,-58},{-40,36},{-34,
            -44},{-22,50},{-20,-60},{-8,24},{2,-58},{10,34},{14,-22},{26,14},{
            30,-38},{42,20},{50,-62},{56,26}},
        color={0,0,255},
        smooth=Smooth.None)}),
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>The Noise library is developed to consistently define an algorithmically random source in Modelica. Care has been taken to develop a source which has a high statistical randomness. This is illustrated in an <a href=\"Noise.Examples.Analysis\">example</a>. Furthermore, care has been taken to generate a continuous, event-free source to avoid extremely high performance penalties due to integrator restarts</p>
<p>Potential applications are:</p>
<ul>
<li>Sensor Noise</li>
<li>Stochastical excitations like air gusts and road excitation </li>
</ul>
<p>If you want to refer to this library, please cite the following publication: </p>
<p>Kl&ouml;ckner, A., van der Linden, F.L.J., &AMP; Zimmer, D. (2014), <a href=\"http://www.ep.liu.se/ecp/096/087/ecp14096087.pdf\">Noise Generation for Continuous System Simulation</a>.<br/>In <i>Proceedings of the 10th International Modelica Conference</i>, Lund, Sweden. </p>
<p>
<b>Licensed by the DLR German Aerospace Center under the Modelica License 2</b><br>
Copyright &copy; 2014, DLR.
</p>

<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
<br/>
</html>"));
end Noise;
