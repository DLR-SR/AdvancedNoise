within Noise.Examples.RailIrregularities.Comparisons;
model MinimumAndZeroPhase
  "Compares implementation of convolution with minim and zero phase filters"
  extends FilterAndConvolution(doMinimum = true, doZero = true, doFilter = false, doTime = false);
  annotation (experiment(
      StopTime=20,
      Interval=0.0001,
      Tolerance=0.001), __Dymola_experimentSetupOutput);
end MinimumAndZeroPhase;
