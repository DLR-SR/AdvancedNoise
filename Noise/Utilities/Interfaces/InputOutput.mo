within Noise.Utilities.Interfaces;
partial function InputOutput
  "The basic interface for inputs and outputs of a random number generator function"
  input Integer[:] stateIn
    "The discrete states for the random number generator";
  output Real rand
    "The generated random number with a uniform distribution on the interval (0,1]";
  output Integer[size(stateIn,1)] stateOut
    "The new states of the random number generator";
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"), Icon(graphics={
        Rectangle(
          lineColor={255,128,0},
          extent={{-100,-100},{100,100}},
          radius=25)}));
end InputOutput;
