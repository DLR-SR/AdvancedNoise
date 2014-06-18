within Noise.Utilities.Auxiliary;
function shuffleDouble
   input Real x;
   input Integer seed;
   output Real y;

  external "C" y = NOISE_shuffleDouble(x,seed);

 annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));

end shuffleDouble;
