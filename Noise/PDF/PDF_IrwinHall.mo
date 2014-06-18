within Noise.PDF;
function PDF_IrwinHall
  "A random number with Irwin-Hall distribution (sum of uniform variables)"
  extends Noise.Utilities.Interfaces.PDF;
  input Real[2] interval = {0,1}
    "The interval from which the uniformly distributed random number is generated"
    annotation(Dialog);
  input Integer n = 1 "The number of samples used for summation"
    annotation(Dialog);
protected
  Real temp;
algorithm

  // Retrieve n uniformly distributed random numbers and sum them up
  rand       := 0;
  states_out := states_in;
  for i in 1:n loop
    (temp,states_out) := RNG(instance=instance^i, states_in=states_out);
    rand              := rand + temp;
  end for;

  // Scale with interval boundaries
  rand := rand * (interval[2] - interval[1]) + interval[1]*n;

  annotation (Icon(graphics={Line(
          points={{-80.000000,-80.000000},{-76.500000,-80.000000},{-73.000000,-80.000000},{-69.500000,-80.000000},{-66.000000,-80.000000},{-62.500000,-80.000000},{-59.000000,-80.000000},{-55.500000,-80.000000},{-52.000000,-80.000000},{-48.500000,-80.000000},{-45.000000,-80.000000},{-41.500000,-80.000000},{-38.000000,-80.000000},{-34.500000,-80.000000},{-31.000000,-80.000000},{-27.500000,-80.000000},{-24.000000,-80.000000},{-20.500000,-80.000000},{-17.000000,-80.000000},{-13.500000,-80.000000},{-10.000000,-80.000000},{-6.500000,-79.961957},{-3.000000,-79.391304},{0.500000,-76.918478},{4.000000,-70.260870},{7.500000,-56.413043},{11.000000,-33.739130},{14.500000,-4.065217},{18.000000,27.130435},{21.500000,51.097826},{25.000000,60.000000},{28.500000,51.097826},{32.000000,27.130435},{35.500000,-4.065217},{39.000000,-33.739130},{42.500000,-56.413043},{46.000000,-70.260870},{49.500000,-76.918478},{53.000000,-79.391304},{56.500000,-79.961957},{60.000000,-80.000000}},
          color={255,0,0},
          smooth=Smooth.Bezier)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PDF_IrwinHall;
