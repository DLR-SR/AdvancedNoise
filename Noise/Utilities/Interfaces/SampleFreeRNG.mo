within Noise.Utilities.Interfaces;
partial function SampleFreeRNG
  "The interface for sample free  random number generators"
  extends RNG;
  annotation (Icon(graphics={Line(
          points={{-80,40},{-70,0},{-60,58},{-52,20},{-40,-40},{-30,-20},{-20,-80},
              {-10,20},{0,-20},{10,40},{20,-40},{30,20},{40,26},{50,60},{60,20},
              {70,-80},{80,0}},
          color={255,0,0},
          smooth=Smooth.None)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end SampleFreeRNG;
