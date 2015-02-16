within Modelica_Noise.Math;
function binomial "Binomial coefficient"
  import Modelica_Noise.Math.factorial;
  input Integer n;
  input Integer k;
  output Real b;
algorithm
  b :=(factorial(n)/factorial(n - k)/factorial(k));
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end binomial;
