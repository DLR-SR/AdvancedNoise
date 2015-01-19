within Modelica_Noise.Blocks.Examples.NoiseExamples.Utilities;
block ImpureRandom
  "Block generating random numbers with the impure random number generator"
  extends Modelica.Blocks.Interfaces.SO;

  parameter Modelica.SIunits.Time samplePeriod
    "Sample period for random number generation";

protected
   outer Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed;

equation
   when {initial(), sample(samplePeriod,samplePeriod)} then
      y = globalSeed.random();
   end when;
end ImpureRandom;
