within Noise.Utilities.Interfaces;
partial function InputOutput
  "The basic interface for inputs and outputs of a random number generator function"
  input Modelica.SIunits.Time instance
    "The current time for an arithmetic random number generator";
  input Integer[:] states_in
    "The discrete states for a recursive random number generator";
  output Real rand
    "The random number with a uniform distribution on the interval [1,0]";
  output Integer[size(states_in,1)] states_out
    "The new states of a recursive random number generator";
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end InputOutput;
