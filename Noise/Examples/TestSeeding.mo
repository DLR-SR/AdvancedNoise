within Noise.Examples;
model TestSeeding
    extends Modelica.Icons.Example;

  Noise.RandomNoise prng(
    redeclare function SampleBasedRNG =
        Noise.Generators.LinearCongruentialGenerator_NumericalRecipes,
    redeclare function PDF = Noise.Distributions.Uniform,
    redeclare function SampleFreeRNG = Noise.Generators.SampleFree.RNG_DIRCS,
    redeclare function PSD = Noise.PSD.PSD_WhiteNoise,
    useGlobalSeed=true,
    useSampleBasedMethods=false,
    infiniteFreq=false,
    localSeed=66)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Noise.RandomNoise prng1(
    useGlobalSeed=true,
    useSampleBasedMethods=false,
    localSeed=25634)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  inner Noise.GlobalSeed globalSeed(userSeed=1446)
    annotation (Placement(transformation(extent={{70,70},{90,90}})));
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This example shows the GlobalSeed machanism at work.</p>
</html>"));
end TestSeeding;
