within Noise.Examples;
model FunctionCall "Shows how to use the internal random functions"
  extends Modelica.Icons.Example;
  import Noise.RNG.*;
  import Noise.PDF.*;

//
//
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// General parameters
  parameter Real dt = 0.1 "The time step for discrete random numbers";

//
//
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Using the state-less random number generators
  function my_continuous_random = PDF_BoxMuller (
    redeclare function RNG = SampleFree.RNG_DIRCS,
    mu = 20, sigma = 10,
    states_in = zeros(0)) "The state-less random number generator" annotation (
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This is an example implementation of a sample-free RNG.</p>
</html>"));

  // The actual continuous random numbers
  Real r_continuous = my_continuous_random(time)
    "The time-continuous noise signal";
  Real r_discrete =   my_continuous_random(integer(time/dt) * dt)
    "The time-discrete noise signal";

//
//
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Using the random number generators with states
  function my_sampled_random = PDF_BoxMuller (
    redeclare function RNG = SampleBased.RNG_LCG,
    mu = -20, sigma = 10,
    instance = 0) "The state-less random number generator" annotation (
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This is an example implementation of a sample-based RNG.</p>
</html>"));

  // The sampled random numbers and the state
  Real r_sampled "The sampled noise signal";
  Integer state[1] "The state of the random number generator";
initial equation
  pre(state) = {12345};
equation
  when sample(0,dt) then
    (r_sampled, state) = my_sampled_random(states_in=  pre(state));
  end when;

  annotation (experiment(StopTime=10, Interval=0.01),
                          __Dymola_experimentSetupOutput,
    Diagram(graphics),
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This example demonstrates, how the internal functions of the PRNG block can also be used in your own models: You need to instatiate the respective function with the neccessary redeclarations and then you can call the functions. Please not, that the sample-based RNGs also need handling of their states!</p>
</html>"));
end FunctionCall;
