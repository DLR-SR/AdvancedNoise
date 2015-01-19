within Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass;
function kernel "Kernel for ideal low pass (sinc-function)"
  import Modelica_Noise.Math.Special.sinc;
  import Modelica.Constants.pi;
  extends Random.Utilities.Interfaces.partialKernel;
  input Modelica.SIunits.Frequency f=1/2 "The cut-off frequency of the filter";
algorithm
  h := 2*f*sinc(2*pi*f*t);
  annotation(Inline=true);
end kernel;
