within Noise.Generators;
function LinearCongruentialGenerator
  "Linear congruential generator implementing the equation i = mod(a*i+c, m)"
  extends Noise.Utilities.Interfaces.SampleBasedRNG;
  input Integer a = 69069
    "The multiplier for the linear congruential generator"
    annotation(Dialog);
  input Integer c = 1 "The increment for the linear congruential generator" annotation(Dialog);
  input Integer m = 2147483647
    "The modulus for the linear congruential generator"
    annotation(Dialog);
algorithm
  (rand,stateOut) := MultipleRecursiveGenerator(stateIn=stateIn,a={a},c=c,m=m);

  annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end LinearCongruentialGenerator;
