within Noise.Generators;
function xorshift64star "The xorshift64star generator"
  extends Noise.Utilities.Interfaces.Generator;
  input Integer p = 1 "Number if itrations to do";
algorithm
  assert(size(stateIn,1) >= 2, "State must have at least 2 elements!");

  // Calculate new state
  stateOut                := stateIn;
  for i in 1:p loop
    (stateOut[1:2], rand) := Noise.Utilities.Auxiliary.xorshift64star(stateOut[1:2]);
  end for;

  annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end xorshift64star;
