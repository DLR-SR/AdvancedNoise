within Noise.Examples.RailIrregularities.Comparisons;
model MinimumAndZeroPhase
  "Compares implementation of convolution with minim and zero phase filters"
  extends FilterAndConvolution(doMinimum = true, doZero = true, doFilter = false, doTime = false);
end MinimumAndZeroPhase;
