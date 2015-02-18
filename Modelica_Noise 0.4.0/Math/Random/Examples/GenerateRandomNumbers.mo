within Modelica_Noise.Math.Random.Examples;
model GenerateRandomNumbers
  "Generate random numbers with the various random number generators"
   extends Modelica.Icons.Example;

  parameter Modelica.SIunits.Time samplePeriod = 0.05
    "Sample period for the generation of random numbers";
  parameter Integer localSeed = 614657
    "First seed to initialize random number generator";
  parameter Integer globalSeed = 30020
    "Second seed to initialize random number generator";
  discrete Real r64 "Random number generated with Xorshift64star";
  discrete Real r128 "Random number generated with Xorshift128plus";
  discrete Real r1024 "Random number generated with Xorshift1024star";

protected
  discrete Integer state64[2];
  discrete Integer state128[4];
  discrete Integer state1024[33];
algorithm
  when initial() then
     // Generate initial state from localSeed and globalSeed
     state64   := Generators.Xorshift64star.initialState(localSeed, globalSeed);
     state128  := Generators.Xorshift128plus.initialState(localSeed, globalSeed);
     state1024 := Generators.Xorshift1024star.initialState(localSeed, globalSeed);
     r64  := 0;
     r128  := 0;
     r1024 := 0;
  elsewhen sample(0,samplePeriod) then
     (r64,  state64)   := Generators.Xorshift64star.random(pre(state64));
     (r128, state128)  := Generators.Xorshift128plus.random(pre(state128));
     (r1024,state1024) := Generators.Xorshift1024star.random(pre(state1024));
  end when;

  annotation (experiment(StopTime=2), Documentation(info="<html>
<p>
This example demonstrates how to utilize the random number generators
of package <a href=\"Modelica_Noise.Math.Random.Generators\">Math.Random.Generators</a> in a Modelica model.
The example calculates random numbers in the range 0 .. 1 of the available random number generators periodically
with a sample period of 0.05 s. Simulations results are shown in the figure below:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Random/GenerateRandomNumbers.png\">
</blockquote></p>
</html>"));
end GenerateRandomNumbers;
