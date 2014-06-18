within Noise.PSD;
function PSD_WhiteNoise
  "Unmodified white noise with constant power spectral density"
  extends Noise.Utilities.Interfaces.PSD;
algorithm

  // Make ure, we can pass highest-frequency noise!
  if dt > 0 then
    (rand, states_out) := PDF(instance=floor(t/dt)*dt, states_in=states_in);
  else
    (rand, states_out) := PDF(instance=t,              states_in=states_in);
  end if;
  rand_hold:=rand;

  annotation (Icon(graphics={Line(
          points={{-80,60},{-80,-76},{60,-76}},
          color={255,0,0},
          smooth=Smooth.None)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PSD_WhiteNoise;
