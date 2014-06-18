within Noise.Utilities.Analysis;
block Var "Calculates the empirical variance of a signal"
  extends Modelica.Blocks.Interfaces.BlockIcon;

  Modelica.Blocks.Interfaces.RealInput u "Input for the noise signal" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

// Calculate the expectation value
protected
  Mu mu;
equation
  connect(mu.u,u);

// Calculate the squared expectation value
protected
  Mu mu2;
  Modelica.Blocks.Interfaces.RealOutput u2 = u^2;
equation
  connect(mu2.u,u2);

// Calcualte the variance
public
  output Real var "The variance of the signal";
equation
  var = mu2.mu - mu.mu^2;

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Var;
