within Noise.Utilities.Math;
function factorial "The product of all integer <= the input"
  input Integer n;
  output Integer f;
algorithm
  f := 1;
  for i in 1:n loop
    f := f*i;
  end for;
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end factorial;
