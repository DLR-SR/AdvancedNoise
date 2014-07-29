within Noise.Generators.SampleBased;
function RNG_xorshift64star "xorshift64*"
  extends Noise.Utilities.Interfaces.SampleBasedRNG;
algorithm
  assert(size(states_in,1) >= 2, "State must have at least 2 elements!");

  // Fill output state
  states_out               := states_in;

  // Run the RNG
  (states_out[1:2], rand) := Noise.Utilities.Auxiliary.xorshift64star(states_out[1:2]);

  annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end RNG_xorshift64star;
