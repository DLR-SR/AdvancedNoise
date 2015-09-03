within AdvancedNoise.Statistics;
block CorrelationTest
  "Tests the null hypothesis that two signals have a given true correlation coefficient"
  extends Modelica.Blocks.Interfaces.SI2SO;

// The start time of the simulation
public
  parameter Real t_0(fixed=false) "Start time of the simulation";
  parameter Real t_eps = 0.001 "Start time of the simulation";
initial equation
  t_0 = time;

// The distribution parameters
public
  parameter Real rho = 0.0;
  Real sigma = if time-t_0 > t_eps then 1 / sqrt(time-t_0) else 1/sqrt(t_eps);
protected
  encapsulated model FisherTransformation
    "Transforms a correlation to be approximately normally distributed"
    import Modelica;
    extends Modelica.Blocks.Interfaces.SISO;
    parameter Real r_max = 0.99 "Cut-off for correlation coefficient";
  equation
    y = noEvent(if u >=  r_max then 0.5 * log( (1+r_max) / (1-r_max))  else
                if u <= -r_max then 0.5 * log( (1+r_max) / (1-r_max))  else 0.5 * log(max(1e-8, (1+u) / (1-u))));
  end FisherTransformation;
public
  Correlation correlation
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  SignificanceTest significanceTest(redeclare function H =
        Modelica_Noise.Math.Distributions.Normal.cumulative (mu=rho, sigma=sigma))
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  FisherTransformation fisherTransformation
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
equation
  connect(correlation.u1, u1) annotation (Line(
      points={{-82,6},{-100,6},{-100,60},{-120,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(correlation.u2, u2) annotation (Line(
      points={{-82,-6},{-100,-6},{-100,-60},{-120,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(correlation.y, fisherTransformation.u) annotation (Line(
      points={{-59,0},{-22,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fisherTransformation.y, significanceTest.u) annotation (Line(
      points={{1,0},{58,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(significanceTest.y, y) annotation (Line(
      points={{81,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end CorrelationTest;
