within Noise.PSD.Kernels;
function FirstOrder "The kernel for a first order filter"
  extends Noise.Utilities.Interfaces.Kernel;
  input Real k=1 "Gain" annotation(Dialog);
  input Modelica.SIunits.Period T=0.05 "Time Constant" annotation(Dialog);
protected
  Real a;
  Real b;
algorithm

  // Transfer function:
  // G = k / (Ts + 1)
  //   = b / ( s + a) => b = k/T, a = 1/T
  // Impulse response:
  // h = b*e^(-at) for t >= 0
  b := k/T;
  a := 1/T;
//  h := if t >= 0 then b * exp(-abs(a*t))*exp(t-dt) else 0;
  h := if t >= 0 then b * exp(-a*t) else 0;
//  h := b * exp(-abs(a*t));
//  h := if t >=0 then b/a*(1 - exp(-abs(a*t))) else 0;
//  h := if t >=0 then b/a*(1 - exp(-abs(a*t))) else 0;
// //  h := if t >= 0 then b/a * exp(-a*t) * (1-exp(a*dt)) else 0;
//    h := if t <  0 then 0 else
//         if t < dt then 1 else 0;
//  h :=h/b*a/50;

 h:= if t >= -0.0001 then -b/a*exp(-a*t) else -b/a;

  annotation (Icon(graphics={Line(
          points={{-74,-10},{-10,-10},{-10,68},{-4,44},{6,14},{24,-2},{44,-8},{
              70,-8}},
          color={255,0,0},
          smooth=Smooth.None)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end FirstOrder;
