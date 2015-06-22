within Noise.Interpolators.StepResponse;
function trapz "Integral of a time signal using trapezium rule"
  input Real[:] T "Time vector";
  input Real[size(T,1)] X "Values vector";
  output Real Y "Integral";
algorithm
  Y := 0.5 .* sum((X[2:end] + X[1:(end-1)]) .* (T[2:end] - T[1:(end-1)]));
end trapz;
