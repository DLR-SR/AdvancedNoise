within Noise.PSD;
function PSD_IdealLowPass
  "An ideal low-pass filter based on the convolution with the sinc function"
  extends PSD_Interpolation(redeclare function Kernel = Kernels.IdealLowPass);
  annotation (Icon(graphics={Line(
          points={{-80,60},{60,60},{60,-80}},
          color={255,0,0},
          smooth=Smooth.None)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PSD_IdealLowPass;
