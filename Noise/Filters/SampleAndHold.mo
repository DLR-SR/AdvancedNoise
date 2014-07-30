within Noise.Filters;
function SampleAndHold
  "Unmodified white noise with constant power spectral density"
  extends Noise.Utilities.Interfaces.Filter;
algorithm

  // Make sure, we can pass highest-frequency noise!
  y := buffer[integer(offset+1)];

  annotation (Icon(graphics={Line(
          points={{-80,60},{-80,-76},{60,-76}},
          color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end SampleAndHold;
