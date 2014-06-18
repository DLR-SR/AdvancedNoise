within Noise.Utilities.Analysis;
block Mu "Calculates the empirical expectation value of a signal"
  extends Modelica.Blocks.Interfaces.BlockIcon;

  Modelica.Blocks.Interfaces.RealInput u "Input for the noise signal" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  output Real mu "The expectation value of the signal";

protected
  Real mu_0 "Internal integrator variable";
  parameter Real t_0(fixed=false) "Start time";
initial equation
  t_0 = time;
equation
  der(mu_0) = u;
  mu = if time > t_0 then mu_0/(time-t_0) else u;

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Mu;
