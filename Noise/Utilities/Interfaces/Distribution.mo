within Noise.Utilities.Interfaces;
partial function Distribution "The basic interface for a distribution function"
  extends Icons.PDF;
  extends Interfaces.InputOutput;
  input Generator generator = Noise.RNG.SampleBased.RNG_LCG
    "The random number generator function to be used"
    annotation(Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Distribution;
