within Modelica_Noise;
package Math
    extends Modelica.Icons.Package;


function sinc "sinc(x) = sin(x)/x"
  input Real x;
  output Real y;
algorithm

  y := if abs(x) > 0.5e-4 then sin(x)/x else 1 - (x^2)/6 + (x^4)/120;

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end sinc;

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
function binomialCoefficients "Binomial coefficients"
  import Modelica_Noise;
  input Integer n;
  input Integer k;
  output Integer b;
algorithm
  b :=integer(Modelica_Noise.Math.factorial(n)/Modelica_Noise.Math.factorial(n -
    k)/Modelica_Noise.Math.factorial(k));
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end binomialCoefficients;

function cumsum "Cumulative sum"
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




end Math;
