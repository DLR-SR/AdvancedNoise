within Noise.Generators;
function MultipleRecursiveGenerator
  "Multiple recursive generator implementing the equation i = mod( sum(a*i) + c, m)"
  extends Noise.Utilities.Interfaces.SampleBasedRNG;
  input Integer[:] a = {1071064,0,0,0,0,0,2113664}
    "The multiplier for the linear congruential generator"
    annotation(Dialog);
  input Integer c = 0
    "The increment for abstracting linear congruential generators"
    annotation(Dialog);
  input Integer m = 2147483629
    "The modulus for the multiple recursive generator"
    annotation(Dialog);
algorithm
  assert(size(stateIn,1) >= size(a,1), "State must have at least as many elements as a!");

  // Calculate new state
  stateOut        := stateIn;
  stateOut[1]     := 0;
  for i in 1:size(a,1) loop
    stateOut[1]   := stateOut[1] + a[i] * stateIn[i];
  end for;
  stateOut[1]     := integer(mod(stateOut[1] + c, m));

  // Advance old states
  for i in 1:size(a,1)-1 loop
    stateOut[i+1] :=                      stateIn[i];
  end for;

  // Calculate the random number
  rand            := abs(stateOut[1] / (m-1)); // m is sometimes negative?!

  annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end MultipleRecursiveGenerator;
