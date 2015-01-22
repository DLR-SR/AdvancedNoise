within Modelica_Noise.Math.Random.Utilities.Interpolators.LinearFirstOrder;
function kernel "Kernel for first-order ideal low pass (k / (Ts + 1))"
  import Modelica_Noise.Math.Special.sinc;
  import Modelica.Constants.pi;
  extends Random.Utilities.Interfaces.partialKernel;
  input Real k=1 "Gain" annotation(Dialog);
  input Modelica.SIunits.Period T=0.1 "Time Constant" annotation(Dialog);
protected
  Real a;
  Real b;
algorithm

  // Transfer function:
  // G = k / (Ts + 1)
  //   = b / ( s + a) => b = k/T, a = 1/T
  b := k/T;
  a := 1/T;

  // Impulse response:
  // h =  b *   e^(-at)  for t >= 0
  //
  // Step response:
  // h = b/a*(1-e^(-at)) for t >= 0
  //
  // Step response after a zero-order hold:
  // h = b/a*(1-e^(-at))           for t >= 0 and t < 1
  //   = b/a*(1-e^(-a ))*(-a(t-1)) for t >= 1
  h := if t < 0 then 0 else
       if t < 1 then b/a * (1-exp(-a*t)) else
                     b/a * (1-exp(-a))   * exp(-a* (t-1.0));
  annotation(Inline=true);
end kernel;
