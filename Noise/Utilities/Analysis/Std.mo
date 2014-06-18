within Noise.Utilities.Analysis;
block Std "Calculates the empirical standard deviation of a signal"
  extends Modelica.Blocks.Interfaces.BlockIcon;

  Modelica.Blocks.Interfaces.RealInput u "Input for the noise signal" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

// Calculate the variance
protected
  Var var;
equation
  connect(var.u,u);

// Calcualte the standard deviation
public
  output Real std "The variance of the signal";
equation
  std = if var.var > 1e-5 then sqrt(var.var) else 0;

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Std;
