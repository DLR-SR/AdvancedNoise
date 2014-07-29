within Noise;
block EventBasedNoise "A noise generator based on discrete time events"
  extends Modelica.Blocks.Interfaces.SO;
  import Noise.Utilities.Auxiliary;

//
//
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// We require an inner globalSeed
  outer GlobalSeed globalSeed;

//
//
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Define a seeding function (this is hidden from the user)
public
  parameter Boolean useGlobalSeed = true
    "= true, if the global seed shall be combined with the local seed. = false, if the globalSeed shall be ignored"
    annotation(choices(checkBox=true),Dialog(tab="Advanced",group = "Initialization"));
  parameter Integer localSeed = Auxiliary.hashString(Auxiliary.removePackageName(getInstanceName()))
    "The local seed for initializing the random number generator"
    annotation(Dialog(tab="Advanced",group = "Initialization"));
  final parameter Integer globalSeed0 = if useGlobalSeed then globalSeed.seed else 0
    "The global seed, which is atually used";
protected
  parameter Integer stateSize = 33
    "The number of states used in the random number generator";
  Integer state[stateSize] "The internal states of the random number generator";
protected
  replaceable function Seed = Noise.Seed.xorshift64star
    constrainedby Noise.Utilities.Interfaces.Seed
    "The seeding function to be used";
initial equation
  pre(state) = Seed(localSeed=localSeed, globalSeed=globalSeed0, stateSize=stateSize);

//
//
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Define distribution (implicitly contains the default random number generator)

//
//
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Call the distribution function to fill the buffer
equation
  state=pre(state);

//
//
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Define interpolation

//
//
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Call the interpolation with the buffer as input
y=0;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
                   graphics={
        Rectangle(
          extent={{-80,-10},{-100,10}},
          lineThickness=0.5,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-60,-10},{-80,58}},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-20,-78},{-40,10}},
          lineThickness=0.5,
          fillColor={50,50,50},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-40,-60},{-60,10}},
          lineThickness=0.5,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{60,-62},{40,8}},
          lineThickness=0.5,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{40,-10},{20,88}},
          lineThickness=0.5,
          fillColor={238,238,238},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{0,-10},{-20,76}},
          lineThickness=0.5,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{20,-10},{0,58}},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{80,-10},{60,76}},
          lineThickness=0.5,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{100,-10},{80,56}},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Line(
          points={{-94,-2},{-74,18},{-56,-42},{-30,-68},{-14,38},{6,12},{26,58},
              {46,-42},{68,38},{96,-2}},
          color={255,0,0},
          thickness=0.5,
          smooth=Smooth.Bezier)}),
             defaultComponentName = "prng",
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",
        info="<html>
<p>This block is used to generate stochastic signals based on pseudo-random numbers.</p>
<p>By default the block generates a discrete signal changing at the frequency of 100Hz with uniformly distributed random numbers between 0 and 1.</p>
<p>To change the default behavior, you can choose a different random number generator, a different probability distribution or a different power spectral density.</p>
<h4><span style=\"color:#008000\">Choosing the random number generator (RNG)</span></h4>
<p>Determine the function used to generate the pseudo-random numbers. All of these functions are designed in such a way that they return a pseudo-random number between 0 and 1 with an approximate uniform distribution.</p>
<p>There are two types of random number generators: Sample-Based RNGs and Sample Free RNGs.</p>
<ol>
<li>Sample-Based RNGs are based on a discrete state value that is changed at certain sample times. Hence these generators cause many time events.</li>
<li>Sample-Free RNGs are based on the continuous time signal and transform it into a pseudo-random signal. These generators do not cause events.</li>
</ol>
<p>Whether to better use sample-free or sample-based generators is dependent on the total system at hand and cannot be generically answered. If, however, the resulting signal shall be continuous (due to applying a PSD) then we propose to use sample-free RNGs.</p>
<h4><span style=\"color:#008000\">Choosing the probability distribution function (PDF)</span></h4>
<p>The pseudo-random numbers are per se uniformly distributed between 0 and 1. To change the distribution of the pseudo-random number generators you can choose an appropriate function.</p>
<p>Each function may have its individual parameters for defining the characteristics of the corresponding PDF. </p>
<h4><span style=\"color:#008000\">Choosing the power spectral density (PSD)</span></h4>
<p>The power spectral density function defines the spectral characteristics of the output signal. In many cases it is used to generate a continuous pseudo-random signal by interpolation or filtering with certain charactistics w.r.t frequency and variance.</p>
<p>Many Ready-to-use PSD are offered. The advantage to use a PDF to a classic PT1-element is that no continuous time states are added to the system. The PSD implementation is based on discrete convolution and the use of a PSD may change the characteristics of the PDF. For more information see the reference included below.</p>
<h4><span style=\"color:#008000\">Determine the sample frequency</span></h4>
<p>The sample frequency determines the frequency of changes of the pseudo-random numbers. </p>
<p>For sample-free generators it is possible to apply an infinite frequency. Here the change is only limited by the numerical precision and determined by the step-size control of the applied ODE-solver. When using infinite frequency, PSDs cannot be meaningfully applied anymore.</p>
<p>The sample start time is only relevant if a sample-based generator is used.</p>
<h4><span style=\"color:#008000\">Enable/Disable the block</span></h4>
<p>The block can be disabled by the Boolean flag enable. A constant output value is then used instead.</p>
<h4><span style=\"color:#008000\">Determine the seed values</span></h4>
<p>All RNGs need to be seeded. With the same seed value an RNG will generate the same signal every simulation run. If you want to do multiple simulation runs for stochastic analysis, you have to determine a different seed for each run.</p>
<p>The seed value is determined by a local seed value. This value may be combined with a global seed value from the outer model &QUOT;globalSeed&QUOT;. </p>
<p>The use of the local seed value is to make different instances of the PRNG block to generate different (uncorrelated) random signals. The use of the global seed value is to determine a new seeding for the complete system.</p>
<h4><span style=\"color:#008000\">Background Information</span></h4>
<p>To get better understanding, you may look at the examples or refer to the paper:</p>
<p>Kl&ouml;ckner, A., van der Linden, F., &AMP; Zimmer, D. (2014), <a href=\"http://www.ep.liu.se/ecp/096/087/ecp14096087.pdf\">Noise Generation for Continuous System Simulation</a>.<br/>In <i>Proceedings of the 10th International Modelica Conference</i>, Lund, Sweden. </p>
<p>This publication can also be cited when you want to refer to this library.</p>
</html>"));
end EventBasedNoise;
