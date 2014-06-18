within Noise.Utilities.Interfaces;
partial function PSD
  "The basic interface for a power spectral density function"
  extends Icons.PSD;
  output Real rand_hold "The raw random number";
  extends Interfaces.InputOutput(instance = t);
  input Modelica.SIunits.Time t
    "The current value of the internal simulation time";
  input Modelica.SIunits.Period dt
    "The intended period of the raw random number";
  input Modelica.SIunits.Time t_last
    "The last time a random number was generated";
  replaceable function PDF = Noise.PDF.PDF_Uniform
    constrainedby Interfaces.PDF "The probability density function to be used"
    annotation(choicesAllMatching=true,
               Dialog(enable=false,
                      tab = "Do not use"),
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));

  annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PSD;
