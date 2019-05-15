within AdvancedNoise;
package Sources "More noise sources"
extends Modelica.Icons.Package;


  annotation (
    Icon(graphics={  Line(
      points={{-84,0},{-54,0},{-54,40},{-24,40},{-24,-70},{6,-70},{6,80},{36,80},
            {36,-20},{66,-20},{66,60}})}),
    Documentation(info="<html>
<p>
This package contains noise signal sources.
These blocks are used either as time based or signal based signal generators.
While the former blocks have only output signals, the latter need an input signal
in order to generate noise output.
</p>
</html>"));
end Sources;
