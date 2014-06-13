within Noise.PSD.Kernels;
function IdealLowPass "The kernel for an ideal low-pass filter"
  extends Noise.Utilities.Interfaces.Kernel;
  import Noise.Utilities.Math.sinc;
  import Modelica.Constants.pi;
  input Modelica.SIunits.Frequency B=1/2/dt
    "The cut-off frequency of the filter" annotation(Dialog);
algorithm
  h := 2*B*sinc(2*pi*B*t);

  annotation (Icon(graphics={Line(
          points={{-70,-10},{-64,-2},{-60,0},{-56,-2},{-50,-10},{-44,-20},{-40,-24},
              {-36,-20},{-30,-10},{-20,50},{-10,60},{0,50},{10,-10},{16,-20},{20,
              -24},{24,-20},{30,-10},{36,-2},{40,0},{44,-2},{50,-10}},
          color={255,0,0},
          smooth=Smooth.None)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end IdealLowPass;
