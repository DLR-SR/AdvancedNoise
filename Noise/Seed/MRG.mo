within Noise.Seed;
function MRG "Uses an MRG for seeding"
  extends Utilities.Interfaces.Seed;
  input Integer[:] a = fill(134775813,stateSize)
    "The multiplier for the linear congruential generator"
    annotation(Dialog);
  input Integer c = 1
    "The increment for abstracting linear congruential generators"
    annotation(Dialog);
  input Integer m = 2147483629
    "The modulus for the multiple recursive generator"
    annotation(Dialog);
  input Integer k = stateSize
    "The number times the MRG shall be applied to the initial state vector";
protected
  Real dummy;
  Integer internal_states[max(stateSize,2)];
algorithm
  assert(stateSize>0, "You are seeding a state vector of size 0!");

  // Build an initial state vector
  internal_states := cat(1,{localSeed,globalSeed},fill(0, max(stateSize, 2) - 2));

  // Do the iterations
  for i in 1:k loop
    (dummy, internal_states) :=Generators.MultipleRecursiveGenerator_f(
      stateIn=internal_states,
      a=a,
      c=c,
      m=m);
  end for;

  // Fill the output state vector
  for i in 1:stateSize loop
    state[i] := internal_states[i];
  end for;

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This function fills the initial state vector using the <a href=\"Noise.RNG.SampleBased.RNG_MRG\">MRG</a> random number generator.</p>
</html>"));
end MRG;
