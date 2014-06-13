within Noise.PSD.Kernels;
function Gaussian "The kernel for a Gaussian filter"
  extends Noise.Utilities.Interfaces.Kernel;
  import Modelica.Constants.pi;
  import Modelica.Math.log;

  input Real f_cutoff = 1/2/dt "Cut-off frequency" annotation(Dialog);
  input Real c =        2
    "Cut-off value: Cut-off frequency is defined at a filter response of 1/c"                       annotation(Dialog);
protected
  Real sigma_f "Standard deviation in the frequency domain";
  Real sigma "Standard deviation in the time domain";
algorithm

  // Impulse response:
  sigma_f := f_cutoff / sqrt(2*log(c));
  sigma   := 1/2/pi/sigma_f;
  h       := 1/sqrt(2*pi)/sigma * exp(-t^2/2/sigma^2);

  annotation (Icon(graphics={Line(
          points={{-10,74},{-22,60},{-34,28},{-42,2},{-56,-4},{-88,-10}},
          color={255,0,0},
          smooth=Smooth.None), Line(
          points={{-10,74},{2,60},{14,28},{22,2},{36,-4},{68,-10}},
          color={255,0,0},
          smooth=Smooth.None)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Gaussian;
