within Noise.Utilities.Seedings;
function combineSeedLCG "combines two seed values in an LCG fashion"
  extends Interfaces.combineSeed;

//algorithm
//    newSeed := seed1 + seed2 + 1;
//  newSeed := seed1*134775813 + seed2*134775813 + 1;

  external "C" newSeed = NOISE_combineSeedLCG(seed1,seed2);

 annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));

end combineSeedLCG;
