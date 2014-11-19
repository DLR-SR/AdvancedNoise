within Noise.Utilities.Interfaces;
partial function Seed "The basic interface for a seeding function"
  extends Icons.Seed;
  input Integer localSeed = 12345
    "The local seed to be used for generating initial states";
  input Integer globalSeed = 67890
    "The global seed to be combined with the local seed";
  input Integer stateSize = 23
    "The number of initial state values to be generated";
  output Integer state[stateSize] "The generated initial states";
  annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Seed;
