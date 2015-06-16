within Modelica_Noise.Math.Random.Examples;
model GenerateRandomNumbers
  "Generate random numbers with the various random number generators"
   extends Modelica.Icons.Example;

// Global parameters
  parameter Modelica.SIunits.Time samplePeriod = 0.05
    "Sample period for the generation of random numbers";
  parameter Integer globalSeed = 30020
    "Global seed to initialize random number generator";

// Random number generators with exposed state
  parameter Integer localSeed = 614657
    "Local seed to initialize random number generator";
  discrete Real r64 "Random number generated with Xorshift64star";
  discrete Real r128 "Random number generated with Xorshift128plus";
  discrete Real r1024 "Random number generated with Xorshift1024star";
protected
  discrete Integer state64[2](   each start=0, fixed = true);
  discrete Integer state128[4](  each start=0, fixed = true);
  discrete Integer state1024[33](each start=0, fixed = true);
algorithm
  when initial() then
    // Generate initial state from localSeed and globalSeed
    state64   := Generators.Xorshift64star.initialState(  localSeed, globalSeed);
    state128  := Generators.Xorshift128plus.initialState( localSeed, globalSeed);
    state1024 := Generators.Xorshift1024star.initialState(localSeed, globalSeed);
    r64       := 0;
    r128      := 0;
    r1024     := 0;
  elsewhen sample(0,samplePeriod) then
    (r64,  state64)   := Generators.Xorshift64star.random(  pre(state64));
    (r128, state128)  := Generators.Xorshift128plus.random( pre(state128));
    (r1024,state1024) := Generators.Xorshift1024star.random(pre(state1024));
  end when;

// Impure random number generators with hidden state
public
  Integer id "A unique number used to sort equations correctly";
  discrete Real rImpure "Impure Real random number";
  Integer iImpure "Impure Integer rndom number";
algorithm
  when initial() then
    id      := Random.Utilities.initializeImpureRandom(globalSeed);
    rImpure := 0;
    iImpure := 0;
  elsewhen sample(0,samplePeriod) then
    rImpure := Random.Utilities.impureRandom(       id=id);
    iImpure := Random.Utilities.impureRandomInteger(id=id, imin=-1234, imax=2345);
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
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end GenerateRandomNumbers;
