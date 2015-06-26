within AdvancedNoise.Sources;
block ColoredSignalBasedNoise
  "Implements a filter directly within the (signal-based) noise signal"
  extends SignalBasedNoise(
    redeclare replaceable package interpolation =
      AdvancedNoise.Interpolators.FirstOrder constrainedby
      AdvancedNoise.Interpolators.Utilities.Interfaces.PartialInterpolatorWithKernel,
    redeclare replaceable function distribution =
      Modelica_Noise.Math.TruncatedDistributions.Normal.quantile (
        mu =    0,
        sigma = 1 / sqrt(samplePeriod)),
    samplePeriod = interpolation.suggestedSamplePeriod);
end ColoredSignalBasedNoise;
