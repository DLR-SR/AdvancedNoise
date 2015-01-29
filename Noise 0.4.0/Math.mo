within Noise;
package Math "Mathematical functions use in this library"
  extends Modelica.Icons.Package;
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
end Math;
