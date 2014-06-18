within Noise;
package RNG "Random number generators"
  extends Modelica.Icons.Package;


annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
          {100,100}}),
                 graphics={
      Text(
        extent={{-74,52},{-14,-14}},
        lineColor={0,0,255},
        textString="1"),
      Text(
        extent={{-54,-10},{6,-76}},
        lineColor={0,0,255},
        textString="3"),
      Text(
        extent={{-10,52},{50,-14}},
        lineColor={0,0,255},
        textString="8"),
      Text(
        extent={{16,-10},{76,-76}},
        lineColor={0,0,255},
        textString="7")}),  Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<h4><span style=\"color:#008000\">Introduction</span></h4>
<p>This package contains the implemented random number generators.</p>
<h5>SampleBased RNGs</h5>
<p>These need a state and correspond to many well-known and well-studied RNGs.</p>
<h5>SampleFree RNGs</h5>
<p>These do not need a state and thus don&apos;t issue events. They are, however, not yet as well studied...</p>
<h4><span style=\"color:#008000\">Important properties</span></h4>
<h5>Period</h5>
<p>When does the randum number stream repeat?</p>
<h5>Uniformity</h5>
<p>Are the random numbers uniformly distributed between 0 and 1?</p>
<h5>Correlation of randum numbers</h5>
<p>Are subsequent random numbers correlated? Are random numbers with different seeds correlated?</p>
</html>"));
end RNG;
