within AdvancedNoise.Statistics;
block Correlation
  extends Modelica.Blocks.Interfaces.SI2SO;

// Parameters
public
  parameter Modelica.SIunits.Time delta_t(min=0) = 0.0
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
  Real X = u1
    "The first random variable to calculate the correlation coefficient";
  Real Y = delay(u2,delta_t, delta_t+0.1)
    "The second random variable to calculate the correlation coefficient";

// Some integrals
public
  Real int_X "The integral of X";
  Real int_Y "The integral of Y";
  Real int_X2 "The integral of X^2";
  Real int_Y2 "The integral of Y^2";
  Real int_XY "The integral of X*Y";
initial equation
  int_X  = 0;
  int_Y  = 0;
  int_X2 = 0;
  int_Y2 = 0;
  int_XY = 0;
equation
  der(int_X)  = if t <  0 then 0 else X;
  der(int_Y)  = if t <  0 then 0 else Y;
  der(int_X2) = if t <  0 then 0 else X^2;
  der(int_Y2) = if t <  0 then 0 else Y^2;
  der(int_XY) = if t <  0 then 0 else X*Y;

// The mean values
public
  Real mean_X = if t <= 0 then X else int_X / t "The mean value of X";
  Real mean_Y = if t <= 0 then Y else int_Y / t "The mean value of Y";

// The variance values
public
  Real var_X =  if t <= 0 then 0 else (int_X2 - 2*mean_X*int_X + mean_X^2*t)                   / t
    "The variance of X";
  Real var_Y =  if t <= 0 then 0 else (int_Y2 - 2*mean_Y*int_Y + mean_Y^2*t)                   / t
    "The variance of Y";
  Real cov_XY = if t <= 0 then 0 else (int_XY - mean_X*int_Y - mean_Y*int_X + mean_X*mean_Y*t) / t
    "The co-variance of X and Y";

// The actual correlation
public
  Real r = noEvent(if var_X       <= 0        then 1.0 else
                   if var_Y       <= 0        then 1.0 else
                   if var_X*var_Y <= cov_XY^2 then 1.0 else cov_XY / sqrt(abs(var_X)) / sqrt(abs(var_Y)))
    "The Bravais- or Pearson-Correlation-Coefficient r = cov_XY / std_X / std_Y";

equation
  y=r;

  annotation (    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of SYstem DYnamics and Control</b> </p>
</html>"));
end Correlation;
