within Noise.Utilities.Interfaces;
partial function Seed "The basic interface for a seeding function"
  extends Icons.Seed;
  input Integer local_seed = 12345
    "The local seed to be used for generating initial RNG states";
  input Integer global_seed = 67890
    "The global seed to be combined with the local seed";
  input Real real_seed = 1.234
    "A Real value to use as a seed for continuous seeding";
  input Integer n = 33 "The number of initial state values to be generated";
  output Integer states[n] "The generated initial states";
  annotation (Icon(graphics), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Seed;
