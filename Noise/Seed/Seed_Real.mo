within Noise.Seed;
function Seed_Real "Uses the real value for seeding"
  extends Utilities.Interfaces.Seed;
  external "C" NOISE_SeedReal(local_seed, global_seed, real_seed, n, states);

 annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This function converts the Real value to Integer values and fills the state vector with them.</p>
</html>"));
end Seed_Real;
