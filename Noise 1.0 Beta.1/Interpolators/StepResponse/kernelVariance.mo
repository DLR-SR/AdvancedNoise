within Noise.Interpolators.StepResponse;
function kernelVariance "Function to be integrated for the varianceFactor"
  extends Utilities.Interfaces.partialKernel;
algorithm
  h := (kernel(t) - kernel(t-suggestedSamplePeriod))^2;
end kernelVariance;
