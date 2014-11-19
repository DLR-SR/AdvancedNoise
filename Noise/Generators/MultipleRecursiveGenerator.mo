within Noise.Generators;
model MultipleRecursiveGenerator
  "Multiple recursive generator implementing the equation i = mod( sum(a*i) + c, m)"
  extends Noise.Utilities.Interfaces.PartialGenerator(stateSize=7);

  parameter Integer[stateSize] a = {1071064,0,0,0,0,0,2113664}
    "The multiplier for the linear congruential generator";
  parameter Integer c = 0
    "The increment for abstracting linear congruential generators";
  parameter Integer m = 2147483629
    "The modulus for the multiple recursive generator";

  redeclare function extends generator
    input Integer p = 1 "Number of iterations to do";
  algorithm
    assert(size(stateIn, 1) == 33, "State must have exactly 33 elements!");

    // Calculate new state
    for i in 1:p loop
      (stateOut, rand) := Noise.Utilities.Auxiliary.xorshift1024star(stateIn);
    end for;

    annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  end generator;

end MultipleRecursiveGenerator;
