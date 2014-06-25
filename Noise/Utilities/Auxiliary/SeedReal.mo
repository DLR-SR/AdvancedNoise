within Noise.Utilities.Auxiliary;
function SeedReal "Uses a real value for initializing an RNG's state vector"

  input Integer local_seed "The local seed";
  input Integer global_seed "The global seed";
  input Real real_seed "The real seed";
  input Integer n "The number of initial state values to be generated";
  output Integer states[n] "The generated initial states";

  external "C" NOISE_SeedReal(local_seed, global_seed, real_seed, n, states);

 annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This function converts the Real value to Integer values and fills the state vector with them.</p>
</html>"));
end SeedReal;
