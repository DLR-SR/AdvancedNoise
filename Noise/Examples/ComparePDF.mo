within Noise.Examples;
model ComparePDF "Compares different PSDs"
  import Noise;
  extends Modelica.Icons.Example;

  Noise.RandomNoise UniformNoise(useSampleBasedMethods=false, redeclare
      function PDF = Noise.Distributions.Uniform)
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Noise.RandomNoise BoxMueller(useSampleBasedMethods=false, redeclare function
      PDF = Noise.Distributions.Normal)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Noise.RandomNoise CauchyLorenz(useSampleBasedMethods=false, redeclare
      function PDF = Noise.Distributions.CauchyLorentz)
    annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Noise.RandomNoise Weibull(useSampleBasedMethods=false, redeclare function PDF
      = Noise.Distributions.Weibull)
    annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  Noise.RandomNoise IrwinHall(useSampleBasedMethods=false, redeclare function
      PDF = Noise.Distributions.IrwinHall (
                                     n=10))
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Noise.RandomNoise Bates(useSampleBasedMethods=false, redeclare function PDF
      = Noise.Distributions.Bates (
                             n=10))
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Noise.RandomNoise DiscreteDistribution(useSampleBasedMethods=false,
      redeclare function PDF = Noise.Distributions.Discrete)
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
  inner Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{70,70},{90,90}})));
  annotation (
    experiment(StopTime=100, Interval=0.001),
Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This example compares all currently available Probability Density Functions, so distributions of values in the random numbers.</p>
</html>"));
end ComparePDF;
