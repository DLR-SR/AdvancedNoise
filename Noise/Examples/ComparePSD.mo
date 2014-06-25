within Noise.Examples;
model ComparePSD "Compares different PSDs"
  import Noise;
  extends Modelica.Icons.Example;

  Noise.PRNG WhiteNoise(
    redeclare function PSD = Noise.PSD.PSD_WhiteNoise,
    useSampleBasedMethods=false,
    redeclare function PDF = Noise.PDF.PDF_Uniform (interval={-1,1}))
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Noise.PRNG IdealLowPass(
    redeclare function PSD = Noise.PSD.PSD_IdealLowPass (n=10),
    useSampleBasedMethods=false,
    redeclare function PDF = Noise.PDF.PDF_Uniform (interval={-1,1}))
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Noise.PRNG Linear(
    redeclare function PSD = Noise.PSD.PSD_LinearInterpolation (n=5),
    useSampleBasedMethods=false,
    redeclare function PDF = Noise.PDF.PDF_Uniform (interval={-1,1}))
    annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
  inner Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  annotation (
    experiment(StopTime=100, Interval=0.001),
Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This example compares all currently available Power Spectral Density functions, so distributions of frequencies in the random numbers.</p>
</html>"));
end ComparePSD;
