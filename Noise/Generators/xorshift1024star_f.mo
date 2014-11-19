within Noise.Generators;
function xorshift1024star_f "The xorshift1024* generator"
  extends Noise.Utilities.Interfaces.Generator;
  input Integer p = 1 "Number if iterations to do";
algorithm
  assert(size(stateIn,1) >= 33, "State must have at least 33 elements!");

  // Calculate new state
  stateOut                 := stateIn;
  for i in 1:p loop
    (stateOut[1:33], rand) := Noise.Utilities.Auxiliary.xorshift1024star(stateOut[1:33]);
  end for;

  annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end xorshift1024star_f;
