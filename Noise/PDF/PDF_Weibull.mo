within Noise.PDF;
function PDF_Weibull "A random number with Weibull distribution"
  extends Noise.Utilities.Interfaces.PDF;
  input Real lambda(min=0) = 1 "The scale parameter of the distribution" annotation(Dialog);
  input Real k(min=0) = 1 "The shape parameter of the normal distribution" annotation(Dialog);
algorithm

  // Retrieve uniformly distributed random number
  (rand,states_out) := RNG(instance=instance, states_in=states_in);

  // Transform by inverse cumulative density function
  // CDF = 1 - exp( -(x/lambda)^k ) for x >= 0
  // x   = lambda * (-ln( 1-CDF ))^(1/k)
  rand              := lambda * (-log( 1-rand)) ^(1/k);
  annotation (Icon(graphics={Line(
          points={{-80.000000,-80.000000},{-76.500000,-80.000000},{-73.000000,-80.000000},{-69.500000,-80.000000},{-66.000000,-80.000000},{-62.500000,-80.000000},{-59.000000,-80.000000},{-55.500000,-80.000000},{-52.000000,-80.000000},{-48.500000,-80.000000},{-45.000000,-80.000000},{-41.500000,-80.000000},{-38.000000,-80.000000},{-34.500000,-80.000000},{-31.000000,-80.000000},{-27.500000,-80.000000},{-24.000000,-80.000000},{-20.500000,-80.000000},{-17.000000,-80.000000},{-13.500000,-80.000000},{-10.000000,-80.000000},{-6.500000,23.142415},{-3.000000,51.165814},{0.500000,60.000000},{4.000000,57.358546},{7.500000,47.664453},{11.000000,34.008182},{14.500000,18.615722},{18.000000,3.045785},{21.500000,-11.676110},{25.000000,-24.942357},{28.500000,-36.459579},{32.000000,-46.157908},{35.500000,-54.115267},{39.000000,-60.497454},{42.500000,-65.513306},{46.000000,-69.383220},{49.500000,-72.318701},{53.000000,-74.510492},{56.500000,-76.122963},{60.000000,-77.292788}},
          color={255,0,0},
          smooth=Smooth.Bezier)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PDF_Weibull;
