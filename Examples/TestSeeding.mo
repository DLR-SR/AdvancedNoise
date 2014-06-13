within Noise.Examples;
model TestSeeding
    extends Modelica.Icons.Example;

  Noise.PRNG prng(
    redeclare function SampleBasedRNG =
        Noise.RNG.SampleBased.RNG_LCG_NumericalRecipes,
    redeclare function PDF = Noise.PDF.PDF_Uniform,
    redeclare function SampleFreeRNG = Noise.RNG.SampleFree.RNG_DIRCS,
    redeclare function PSD = Noise.PSD.PSD_WhiteNoise,
    useGlobalSeed=true,
    useSampleBasedMethods=false,
    infiniteFreq=false,
    localSeed=66)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Noise.PRNG prng1(
    useGlobalSeed=true,
    useSampleBasedMethods=false,
    localSeed=25634)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  inner Noise.GlobalSeed globalSeed(userSeed=1446)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This example shows the GlobalSeed machanism at work.</p>
</html>"));
end TestSeeding;
