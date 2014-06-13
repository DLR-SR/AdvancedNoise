within Noise.PDF;
function PDF_CauchyLorentz "A random number with Cauchy-Lorentz distribution"
  extends Noise.Utilities.Interfaces.PDF;
  import Modelica.Constants.pi;
  input Real mu = 0 "The expectation (mean) value of the distribution" annotation(Dialog);
  input Real gamma = 1 "The standard deviation of the normal distribution" annotation(Dialog);
algorithm

  // Retrieve uniformly distributed random number
  (rand,states_out) := RNG(instance=instance, states_in=states_in);

  // Transform by inverse cumulative density function
  // CDF = 1/pi atan( (x-mu)/gamma ) + 1/2
  // x   = mu + gamma tan pi (CDF - 1/2)
  rand              := mu + gamma * tan(pi * (rand - 0.5));
  annotation (Icon(graphics={Line(
          points={{-80.000000,-71.764706},{-76.500000,-70.932642},{-73.000000,-69.971347},{-69.500000,-68.853503},{-66.000000,-67.544484},{-62.500000,-66.000000},{-59.000000,-64.162896},{-55.500000,-61.958763},{-52.000000,-59.289941},{-48.500000,-56.027397},{-45.000000,-52.000000},{-41.500000,-46.981132},{-38.000000,-40.674157},{-34.500000,-32.702703},{-31.000000,-22.622951},{-27.500000,-10.000000},{-24.000000,5.365854},{-20.500000,22.941176},{-17.000000,40.689655},{-13.500000,54.615385},{-10.000000,60.000000},{-6.500000,54.615385},{-3.000000,40.689655},{0.500000,22.941176},{4.000000,5.365854},{7.500000,-10.000000},{11.000000,-22.622951},{14.500000,-32.702703},{18.000000,-40.674157},{21.500000,-46.981132},{25.000000,-52.000000},{28.500000,-56.027397},{32.000000,-59.289941},{35.500000,-61.958763},{39.000000,-64.162896},{42.500000,-66.000000},{46.000000,-67.544484},{49.500000,-68.853503},{53.000000,-69.971347},{56.500000,-70.932642},{60.000000,-71.764706}},
          color={255,0,0},
          smooth=Smooth.Bezier)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PDF_CauchyLorentz;
