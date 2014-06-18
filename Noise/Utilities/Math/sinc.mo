within Noise.Utilities.Math;
function sinc
  input Real x;
  output Real y;
algorithm

  y := if abs(x) > 0.5e-4 then sin(x)/x else 1 - (x^2)/6 + (x^4)/120;

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end sinc;
