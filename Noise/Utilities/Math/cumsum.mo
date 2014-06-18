within Noise.Utilities.Math;
function cumsum
  input Real x[:] = {0,0};
  output Real X[size(x,1)];
algorithm
  X[1] :=x[1];
  for i in 2:size(x,1) loop
    X[i] :=X[i - 1] + x[i];
  end for;

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end cumsum;
