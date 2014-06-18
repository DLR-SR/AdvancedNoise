within Noise.PDF;
function PDF_BoxMuller
  "A random number with approximate normal distribution using the BoxMuller method"
  extends Noise.Utilities.Interfaces.PDF;
  input Real mu = 0 "The expectation (mean) value of the normal distribution" annotation(Dialog);
  input Real sigma = 1 "The standard deviation of the normal distribution" annotation(Dialog);
protected
  Real U;
  Real V;
algorithm

  // Retrieve two independent uniformly distributed random numbers
  states_out      := states_in;
  (U, states_out) := RNG( instance=instance, states_in=states_out);
  (V, states_out) := RNG( instance=U*U + U,  states_in=states_out);

  // Apply Box-Muller transformation
  rand            := mu + sigma*sqrt(-2*log(U))*cos(2*Modelica.Constants.pi*V);
  annotation (Icon(graphics={Line(
          points={{-80.000000,-79.953019},{-76.500000,-79.897513},{-73.000000,-79.785194},{-69.500000,-79.567435},{-66.000000,-79.163076},{-62.500000,-78.444219},{-59.000000,-77.221315},{-55.500000,-75.231757},{-52.000000,-72.138496},{-48.500000,-67.546796},{-45.000000,-61.046702},{-41.500000,-52.284885},{-38.000000,-41.061716},{-34.500000,-27.438814},{-31.000000,-11.831816},{-27.500000,4.942787},{-24.000000,21.694980},{-20.500000,36.977071},{-17.000000,49.279657},{-13.500000,57.273865},{-10.000000,60.046981},{-6.500000,57.273865},{-3.000000,49.279657},{0.500000,36.977071},{4.000000,21.694980},{7.500000,4.942787},{11.000000,-11.831816},{14.500000,-27.438814},{18.000000,-41.061716},{21.500000,-52.284885},{25.000000,-61.046702},{28.500000,-67.546796},{32.000000,-72.138496},{35.500000,-75.231757},{39.000000,-77.221315},{42.500000,-78.444219},{46.000000,-79.163076},{49.500000,-79.567435},{53.000000,-79.785194},{56.500000,-79.897513},{60.000000,-79.953019}},
          color={255,0,0},
          smooth=Smooth.Bezier)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PDF_BoxMuller;
