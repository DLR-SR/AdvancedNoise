within Noise.Utilities.Math;
function nchoosek "Binomial coefficient"
  input Integer n;
  input Integer k;
  output Integer b;
algorithm
  b := integer(factorial(n)/factorial(n - k)/factorial(k));
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end nchoosek;
