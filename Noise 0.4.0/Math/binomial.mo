within Noise.Math;
function binomial "Binomial coefficient"
  input Integer n;
  input Integer k;
  output Real b;
algorithm
  b :=(Noise.Math.factorial(n)/Noise.Math.factorial(n - k)/
    Noise.Math.factorial(k));
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end binomial;
