within Noise.Generators.SampleBased;
function RNG_xorshift1024star "xorshift1024*"
  extends Noise.Utilities.Interfaces.SampleBasedRNG;
algorithm
  assert(size(states_in,1) >= 33, "State must have at least 33 elements!");

  // Fill output state
  states_out               := states_in;

  // Run the RNG
  (states_out[1:33], rand) := Noise.Utilities.Auxiliary.xorshift1024star(states_out[1:33]);

  annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end RNG_xorshift1024star;
