within Noise.RNG.SampleFree;
function RNG_DIRCS "DIRCS Immediate Random with Continuous Seed"
  extends Noise.Utilities.Interfaces.SampleFreeRNG;
  replaceable function Seed = Noise.Seed.Seed_Real
    constrainedby Noise.Utilities.Interfaces.Seed
    "The seeding function to be used"
    annotation(choicesAllMatching=true, Dialog,
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This replaceable function is used to seed the RNG used in the DIRCS algorithm. You can redeclare any function from here: <a href=\"Noise.Seed\">Noise.Seed</a>.</p>
</html>"));
  replaceable function RNG = Noise.RNG.SampleBased.RNG_MRG(a={134775813,134775813},c=1)
    constrainedby Noise.Utilities.Interfaces.RNG
    "The random number generator function to be used"
    annotation(choicesAllMatching=true, Dialog,
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This replaceable RNG function is used in the DIRCS algorithm. You can redeclare any SampleBased RNG from here: <a href=\"Noise.RNG.SampleBased\">Noise.RNG.SampleBased</a>.</p>
</html>"));
  input Integer k = 1 "The number of RNG iterations to apply to the seed";
protected
  Integer states_internal[2];
algorithm
  states_internal := Seed(real_seed=instance, local_seed=states_in[1], global_seed=0, n=2);
  for i in 1:k loop
    (rand, states_internal) := RNG(instance=instance, states_in=states_internal);
  end for;
  states_out := states_in;

  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This is the random number generator &QUOT;DIRCS Immediate Random with Continuous Seed&QUOT;. It uses the time to seed a conventional sampled random number generator and does a number of discrete steps with this generator. The seeding function <a href=\"Seed\">Seed</a> and the random number generator <a href=\"RNG\">RNG</a> can be specified modularly.</p>
</html>"));
end RNG_DIRCS;
