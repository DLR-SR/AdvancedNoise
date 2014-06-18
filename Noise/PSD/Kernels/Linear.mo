within Noise.PSD.Kernels;
function Linear "The kernel for linear interpolation"
  extends Noise.Utilities.Interfaces.Kernel;
  import Modelica.Constants.pi;
algorithm
  h := if t < -dt then 0        else
       if t <   0 then (1+t/dt) else
       if t <  dt then (1-t/dt) else 0;

  annotation (Icon(graphics={Line(
          points={{-80,-10},{-60,-10},{-10,60},{40,-10},{60,-10}},
          color={255,0,0},
          smooth=Smooth.None)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Linear;
