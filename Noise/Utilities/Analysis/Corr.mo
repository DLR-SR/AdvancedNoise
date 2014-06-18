within Noise.Utilities.Analysis;
block Corr "Calculates the correlation of a signal for a fixed time delay"
  extends Modelica.Blocks.Interfaces.BlockIcon;

  Modelica.Blocks.Interfaces.RealInput u "Input for the noise signal" annotation (Placement(transformation(extent={{-140,
            -20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput u1 "Input for the noise signal" annotation (Placement(transformation(extent={{-140,
            -80},{-100,-40}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));

// Parameters
public
  parameter Modelica.SIunits.Time delta_t = 1
    "Time delay for auto-correlation of signal";

// The start time of the simulation
public
  parameter Real t_0(fixed=false) "Start time of the simulation";
initial equation
  t_0 = time;

// The local integration time
public
  Real t = max(0, time - delta_t - t_0)
    "The local integration time (starts only after an offset of delta_t";

// The actual signals to correlate
public
  Real x = u
    "The first random variable to calculate the correlation coeffcient";
  Real y = delay(u,delta_t, delta_t)
    "The second random variable to calculate the correlation coeffcient";

// Some integrals
public
  Real int_x "The integral of x";
  Real int_y "The integral of y";
  Real int_x2 "The integral of x^2";
  Real int_y2 "The integral of y^2";
  Real int_xy "The integral of x*y";
equation
  der(int_x)  = if t <= 0 then 0 else x;
  der(int_y)  = if t <= 0 then 0 else y;
  der(int_x2) = if t <= 0 then 0 else x^2;
  der(int_y2) = if t <= 0 then 0 else y^2;
  der(int_xy) = if t <= 0 then 0 else x*y;

// The mean values
public
  Real mean_x = if t <= 0 then x else int_x / t "The mean value of x";
  Real mean_y = if t <= 0 then y else int_y / t "The mean value of y";

// The variance values
public
  Real var_x =  if t <= 0 then 0 else (int_x2 - 2*mean_x*int_x + mean_x^2*t)                   / t
    "The variance of x";
  Real var_y =  if t <= 0 then 0 else (int_y2 - 2*mean_y*int_y + mean_y^2*t)                   / t
    "The variance of y";
  Real cov_xy = if t <= 0 then 0 else (int_xy - mean_x*int_y - mean_y*int_x + mean_x*mean_y*t) / t
    "The co-variance of x and y";

// The actual correlation
public
  Real r =      if var_x > 0.1 and var_y > 0.1 then cov_xy / sqrt(var_x) / sqrt(var_y) else 0
    "The Bravais- or Pearson-Correlation-Coefficient r = cov_xy / std_x / std_y";

// Fisher transformation
public
  Real f =      if r >= 0.9 then 9 else 0.5 * log( (1+r) / (1-r))
    "The Fisher transformed correlation coefficient";
  Real z =      if t <= 0 then 0 else f * sqrt(t)
    "The z-score of the Fisher transformed correlation coefficient";

// Z-Test
protected
  Real Z[:] =  { -50,  -4.0000,  -3.6000,  -3.2000,  -2.8000,  -2.4000,  -2.0000,  -1.6000,  -1.2000,  -0.8000,  -0.4000,        0,   0.4000,   0.8000,   1.2000,   1.6000,   2.0000,   2.4000,   2.8000,   3.2000,   3.6000,   4.0000,  50};
  Real F[:] =  {   0,   1e-6,     0.0002,   0.0007,   0.0026,   0.0082,   0.0228,   0.0548,   0.1151,   0.2119,   0.3446,   0.5000,   0.6554,   0.7881,   0.8849,   0.9452,   0.9772,   0.9918,   0.9974,   0.9993,   0.9998,   1-1e-6,   1};
public
  Real P =     Modelica.Math.Vectors.interpolate(Z,F,z)
    "The probability for the actual correlation r_true <= r assuming f to be normally distributed";
  Real p = 1 - 2*abs(P - 0.5)
    "Probability to find the current correlation coefficient r, assuming the two signals to be uncorrelated. If p < 0.05, we have strong evidence for the signals being correlated";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Corr;
