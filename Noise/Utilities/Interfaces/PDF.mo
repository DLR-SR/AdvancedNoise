within Noise.Utilities.Interfaces;
partial function PDF "The basic interface for a probability density function"
  extends Icons.PDF;
  extends Interfaces.InputOutput;
  replaceable function RNG = Noise.RNG.SampleBased.RNG_LCG
    constrainedby Interfaces.RNG
    "The random number generator function to be used"
    annotation(choicesAllMatching=true,
               Dialog(enable=false,
                      tab = "Do not use"),
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PDF;
