within Noise.Examples.RailIrregularities.Comparisons;
model SpaceAndTimeDomain "Compares implementation in space and time domain"
  extends FilterAndConvolution(doMinimum = true, doZero = false, doFilter = false, doTime = true);
end SpaceAndTimeDomain;
