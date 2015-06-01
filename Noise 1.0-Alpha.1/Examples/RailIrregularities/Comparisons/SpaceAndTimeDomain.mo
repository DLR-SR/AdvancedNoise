within Noise.Examples.RailIrregularities.Comparisons;
model SpaceAndTimeDomain "Compares implementation in space and time domain"
  extends FilterAndConvolution(doMinimum = true, doZero = false, doFilter = false, doTime = true);
  annotation (experiment(
      StopTime=20,
      Interval=0.01,
      Tolerance=0.001), __Dymola_experimentSetupOutput);
end SpaceAndTimeDomain;
