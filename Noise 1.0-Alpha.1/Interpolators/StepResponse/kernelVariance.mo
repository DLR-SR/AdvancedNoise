within Noise.Interpolators.StepResponse;
function kernelVariance
  input Real t;
  output Real y;
algorithm
  y := (kernel(t) - kernel(t-suggestedSamplePeriod))^2;
end kernelVariance;
