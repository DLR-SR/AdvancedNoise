within Modelica_Noise.Math.Random.Utilities.Interfaces;
function partialKernel "Interface for convolution kernels"
  input Real t "The (scaled) time for sampling period=1";
  output Real h "The impulse response of the convolution filter";
end partialKernel;
