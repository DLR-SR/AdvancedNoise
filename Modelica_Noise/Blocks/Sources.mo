within Modelica_Noise.Blocks;
package Sources
    extends Modelica.Icons.Package;
  model GlobalSeed "Model to define global seed value"

    parameter Integer userSeed =  1 "user defined seed value";

    final parameter Integer seed = userSeed;

    annotation (
     defaultComponentName="globalSeed",
      defaultComponentPrefixes="inner",
      missingInnerMessage="
Your model is using an outer \"globalSeed\" component but
an inner \"globalSeed\" component is not defined and therefore
a default inner \"globalSeed\" component is introduced by the tool.
To change the default setting, drag Modelica_Noise.GlobalSeed
into your model and specify the seed.
",  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={
          Ellipse(
            extent={{-78,20},{84,-92}},
            fillColor={147,108,31},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={89,64,19},
            lineThickness=0.5),
          Ellipse(
            extent={{-64,6},{64,-58}},
            fillColor={89,64,19},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Polygon(
            points={{-20,-14},{-40,0},{-58,16},{-68,50},{-16,90},{20,82},{2,42},{-50,
                50},{-46,12},{-20,-14}},
            pattern=LinePattern.None,
            smooth=Smooth.Bezier,
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,0}),
          Polygon(
            points={{-28,-14},{-58,4},{-90,12},{-96,-2},{-88,-12},{-62,-2},{-28,-14}},
            smooth=Smooth.Bezier,
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None),    Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}),
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>Inner/Outer Model for Global Seeding.</p>
<p>This model enables the modeler to define a global seed value for random generators.</p>
<p>The seed value can then be used (i.e. combined with a local seed value) at local pseudo-random signal generators. If so, then a switch of the global seed changes all pseudo-random signals.</p>
<p>Remark: Some pseudo-random number generators demand for larger seed values (array of integers). In this case the large seed is automatically generated out of this single integer seed value.</p>
</html>"));

  end GlobalSeed;

  block RandomNoise
    "Generic signal generator block for various pseudo-random signals"
    extends Modelica.Blocks.Interfaces.SO;

    outer GlobalSeed globalSeed;

  //
  //
  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
  // The random number generator
  // There is the general distinction between sampled and sample-free methods
  // This switches two RNG selectors for convenience
  // It also (de)activates sampling later on...
  // The internal functions are used later in redeclarations
  public
    parameter Boolean useSampleBasedMethods =  false
      "Use a random number generator with sampling"
      annotation(Dialog(tab = "Advanced", group = "RNG: Random Number Generator. (This has influences on simulation speed and the quality of the random numbers.)"));
    replaceable function SampleBasedRNG =
        Modelica_Noise.Math.Random.SampleBased.RNG_LCG
      constrainedby Modelica_Noise.Math.Random.Interfaces.SampleBasedRNG
      "Choice of sample based methods for RNG"
      annotation(choicesAllMatching=true, Dialog(tab = "Advanced", group = "RNG: Random Number Generator. (This has influences on simulation speed and the quality of the random numbers.)", enable=useSampleBasedMethods),
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This replaceable model is used, if the useSampleBased switch is set to true. You can redeclare any SampleBased RNG from here: <a href=\"Modelica_Noise.RNG.SampleBased\">Modelica_Noise.RNG.SampleBased</a>.</p>
</html>"));
    replaceable function SampleFreeRNG =
        Modelica_Noise.Math.Random.SampleFree.RNG_DIRCS
      constrainedby Modelica_Noise.Math.Random.Interfaces.SampleFreeRNG
      "Choice of sample free methods for RNG"
      annotation(choicesAllMatching=true, Dialog(tab = "Advanced", group = "RNG: Random Number Generator. (This has influences on simulation speed and the quality of the random numbers.)",enable=not useSampleBasedMethods),
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This replaceable model is used, if the useSampleBased switch is set to false. You can redeclare any SampleFree RNG from here: <a href=\"Modelica_Noise.RNG.SampleFree\">Modelica_Noise.RNG.SampleFree</a>.</p>
</html>"));
  protected
    function SampleBasedRNG0 = SampleBasedRNG;
    function SampleFreeRNG0 =  SampleFreeRNG;

  //
  //
  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
  // The probability density function
  // We have to keep going with two lines (sample based / sample free) because there
  // is no such thing as "conditional redeclaration".
  // The internal functions are used later in redeclarations
  public
    replaceable function PDF = Modelica_Noise.Math.RandomDistributions.uniform
      constrainedby
      Modelica_Noise.Math.RandomDistributions.Interfaces.partialRandom
      "Choice of various PDFs"
      annotation(choicesAllMatching=true, Dialog(tab = "Advanced", group = "PDF: Probability Density Function. (This specifies the distribution of the generated random values.)"),
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This replaceable function is used to design the distribution of values generated by the RandomNoise block. You can redeclare any function from here: <a href=\"Modelica_Noise.PDF\">Modelica_Noise.PDF</a>.</p>
</html>"));
  protected
    function SampleBasedPDF0 = PDF(redeclare function RNG = SampleBasedRNG0);
    function SampleFreePDF0 =  PDF(redeclare function RNG = SampleFreeRNG0);

  //
  //
  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
  // The spectral density function
  // There is an additional switch to activate infinite frequency
  // This has to be handled differently in the calls to the function
  // For convenience, we use a third internal function here
  public
    parameter Boolean infiniteFreq =  false
      "Use unfiltered white noise with infinite frequency"
      annotation(Dialog(tab = "Advanced", group = "PSD: Power Spectral Density. (This specifies the frequency characteristics of the random signal.)", enable = not useSampleBasedMethods));
  protected
    parameter Modelica.SIunits.Frequency freq = 0.5*1/samplePeriod
      "Cut-off frequency. Period = 1/(2*freq)"
      annotation(Dialog(tab = "Advanced", group = "PSD: Power Spectral Density. (This specifies the frequency characteristics of the random signal.)", enable = not infiniteFreq or useSampleBasedMethods));
  public
    replaceable function PSD =
        Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.PSD.PSD_WhiteNoise
                                                                 constrainedby
      Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.Interfaces.PSD
      "Choice of various filters for the frequency domain"
      annotation(choicesAllMatching=true, Dialog(tab = "Advanced", group = "PSD: Power Spectral Density. (This specifies the frequency characteristics of the random signal.)", enable = not infiniteFreq or useSampleBasedMethods),
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This replaceable function is used to design the distribution of frequencies generated by the RandomNoise block. You can redeclare any function from here: <a href=\"Modelica_Noise.PSD\">Modelica_Noise.PSD</a>.</p>
</html>"));
  protected
    function SampleBasedPSD0 =
      PSD (                    redeclare function PDF=SampleBasedPDF0);
    function SampleFreePSD0 =
      PSD (                    redeclare function PDF=SampleFreePDF0);
    function InfiniteFreqPSD0 =
      Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.PSD.PSD_WhiteNoise (
                                        redeclare function PDF=SampleFreePDF0);

  //
  //
  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
  // Set up the sampling rate of the block
  public
    parameter Modelica.SIunits.Time startTime = 0 "Start time of the sampling"
      annotation(Dialog(group = "(Pseudo-) Sampling"));
    parameter Modelica.SIunits.Time samplePeriod = 0.01
      "Period for (pseudo-)sampling the raw random numbers"
      annotation(Dialog(group = "(Pseudo-) Sampling"));

  //
  //
  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
  // Set up the enable/disable flags
  public
    parameter Boolean enable = true "Whether or not to enable this block"
      annotation(Dialog(group = "Enable/Disable"),choices(checkBox=true));
    parameter Real y_off = 0 "Value to output, when disabled"
      annotation(Dialog(group = "Enable/Disable"));

  //
  //
  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
  // The seeding function
    replaceable function Seed = Modelica_Noise.Math.Random.Seed.Seed_MRG (
                                                             real_seed=0.0) constrainedby
      Modelica_Noise.Math.Random.Interfaces.Seed
      "Choice of the seeding function"
      annotation(choicesAllMatching=true, Dialog(tab = "Advanced", group = "Seed (This specifies how local and global seed should be combined and the intial state vector should be filled.)"),
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This replaceable function is used to seed the RNG used in the RandomNoise block. You can redeclare any function from here: <a href=\"Modelica_Noise.Seed\">Modelica_Noise.Seed</a>.</p>
</html>"));

  //
  //
  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
  // Initialize the RNG state
  // The state can be more than one-sized, because there are RNG
  // methods other than the LCG out there, which use more states.
  // The parameter state_size should be set, so that it is big enough to hold the maximum.
  // This should not influence the speed too much, because the variables are just passed around.
  protected
    parameter Integer state_size = 33
      "The number of internal (sample-based) RNG states";
    Integer state[state_size] "The internal state of the (sample-based) RNG";
    Real t_last "The last time a random number was generated";
  public
    parameter Integer localSeed = 123456789
      "The local seed to the RNG initialization" annotation(Dialog(group = "Initialization"),choices(checkBox=true));
    parameter Boolean useGlobalSeed = true
      "Combine local seed value with global seed" annotation(choices(checkBox=true),Dialog(group = "Initialization"));
    final parameter Integer seed=if useGlobalSeed then
        Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.Auxiliary.combineSeedLCG(
        localSeed, globalSeed.seed) else localSeed;
  initial equation
    if useSampleBasedMethods then
      pre(state)  = Seed(local_seed=localSeed, global_seed=if useGlobalSeed then globalSeed.seed else 0, n=state_size, real_seed=0.0);
      pre(t_last) = floor(time/DT)*DT;
    end if;

  //
  //
  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
  // Generate random numbers
  public
    final parameter Real DT = 1/(2*freq)
      "The period of of the random signal (1/(2*DT) = cut-off frequency)";
  public
    output Real y_hold
      "The random number held for the period DT. Use this for checking the PSD methods.";
  protected
    discrete Real dummy1;
    discrete Real dummy2;
  equation

    // Disable the block, if requested
    if not enable then
      y=y_off;
      y_hold=y_off;
      t_last=0;
      dummy1=0;
      dummy2=0;
      state = zeros(state_size);

    // Go for the actual random numbers
    else

      // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
      // Sample-based methods will sample the time and advance the internal state each time
      // The PSD method will be evaluated continuously
      if useSampleBasedMethods then
        when sample(0,DT) then
          t_last = time;
          (dummy1,dummy2,state) = SampleBasedPSD0( t=time, dt=DT, t_last=pre(t_last), states_in=pre(state));
          //Modelica.Utilities.Streams.print("muh" + String(time));
        end when;
        (y_hold,y)              = SampleBasedPSD0( t=time, dt=DT, t_last=    t_last,  states_in=    state);

      // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
      // Sample-free methods will continuously produce random numbers
      // The internal state is only used for seeding
      else

        // Dummy variables from the sampled implementation are meaningless
        when initial() then
          dummy1 = 0;
          dummy2=0;
        end when;

        // Fill the state with a seed and make sure, the t_last is never smaller than time
        state  = Seed(local_seed=localSeed, global_seed=if useGlobalSeed then globalSeed.seed else 0, n=state_size, real_seed=0.0);
        t_last = noEvent(2*abs(time)+1);

        // Generate a held output value. This might actually have larger steps than DT!
        // y_hold           = SampleFreePSD0(  t=noEvent(floor(time/DT)*DT), dt=DT, t_last=    t_last,  states_in=    state);

        // Use direct continuous PSD for infiniteFrequency
        if infiniteFreq then
          (y_hold,y)              = InfiniteFreqPSD0(t=time,                       dt=0,  t_last=    t_last,  states_in=    state);
        else
          (y_hold,y)              = SampleFreePSD0(  t=time,                       dt=DT, t_last=    t_last,  states_in=    state);
        end if;
      end if;

    end if;

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
</html>", info="<html>
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
<p>The use of the local seed value is to make different instances of the RandomNoise block to generate different (uncorrelated) random signals. The use of the global seed value is to determine a new seeding for the complete system.</p>
<h4><span style=\"color:#008000\">Background Information</span></h4>
<p>To get better understanding, you may look at the examples or refer to the paper:</p>
<p>Kl&ouml;ckner, A., van der Linden, F., &AMP; Zimmer, D. (2014), <a href=\"http://www.ep.liu.se/ecp/096/087/ecp14096087.pdf\">Noise Generation for Continuous System Simulation</a>.<br/>In <i>Proceedings of the 10th International Modelica Conference</i>, Lund, Sweden. </p>
<p>This publication can also be cited when you want to refer to this library.</p>
</html>"));
  end RandomNoise;

  package NoiseAuxiliaries
    extends Modelica.Icons.InternalPackage;

    package PSD "Power spectral density functions"

    extends Modelica.Icons.Package;

      function PSD_WhiteNoise
        "Unmodified white noise with constant power spectral density"
        extends Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.Interfaces.PSD;
      algorithm

        // Make sure, we can pass highest-frequency noise!
        if dt > 0 then
          (rand, states_out) := PDF(instance=floor(t/dt)*dt, states_in=states_in);
        else
          (rand, states_out) := PDF(instance=t,              states_in=states_in);
        end if;
        rand_hold:=rand;

        annotation (Icon(graphics={Line(
                points={{-80,60},{-80,-76},{60,-76}},
                color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
      end PSD_WhiteNoise;

      function PSD_IdealLowPass
        "An ideal low-pass filter based on the convolution with the sinc function"
        extends PSD_Interpolation(redeclare function Kernel =
              Kernels.IdealLowPass);
        annotation (Icon(graphics={Line(
                points={{-80,60},{60,60},{60,-80}},
                color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
      end PSD_IdealLowPass;

      function PSD_LinearInterpolation
        "Linear interpolation between the noise samples"
        extends PSD_Interpolation(redeclare function Kernel = Kernels.Linear, n=1);
        annotation (Icon(graphics={Line(
                points={{-60,-60},{60,60}},
                color={255,0,0}),
              Ellipse(
                extent={{-64,-56},{-56,-64}},
                lineColor={255,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{56,64},{64,56}},
                lineColor={255,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
      end PSD_LinearInterpolation;

      function PSD_Interpolation
        "Apply an arbitrary interpolation by convolution with a Kernel"
        extends Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.Interfaces.PSD;
        replaceable function Kernel =
            Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.PSD.Kernels.IdealLowPass
          constrainedby Interfaces.Kernel
          annotation(choicesAllMatching=true, Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));

        input Integer n = 5 "Number of support points for convolution" annotation(Dialog);
        input Integer max_n = n
          "Maximum nummber of support points for comparability" annotation(Dialog);

      protected
        Real raw "The raw random numbers from the PDF function";
        Real coefficient "The convolution coefficients";
        Real scaling
          "The scaling to make sure, a constant signal remains constant";
        Integer states_temp[size(states_in,1)]
          "Intermediate states for recurrent RNGs";
      algorithm

      // Initialize the convolution algorithm
        rand        := 0;
        scaling     := 0;
        states_temp := states_in;

      // Make sure, the recurrent generators are centered
        for i in (-max_n):(-n) loop
          (raw,states_temp) := PDF(instance=(floor(t/dt) + i)*dt, states_in=states_temp);
        end for;

      // What is convolution?!
      //                               -2dt      t      +2dt
      //                         + - + - + - + - + - + - + - + - + -> simulation time
      //                           -3dt    -1dt     +1dt    +3dt
      //                                         |
      //
      //                      1 -|               ^    Kernel(delta_t)
      //                         |              / \
      //                         |     _       /   \       _
      //                         |  -3/ \-2 -1/  0  \1   2/ \3
      //                      0 -+ - + - + - + - + - + - + - + - + -> phase
      //                         |  |   | \ /   |   | \ /   |
      //             delta_t/dt <>         V           V
      //                        |   |   |   |   |   |   |   |   dt
      //                        |                              /
      //                        +   +   +   +   +   +   +   +<->+     sample
      //                           -3  -2  -1   0   1   2   3         0 at floor(time/dt) = instance
      //
      // states_in _________________^___^___^___^___^___^___^
      //              iterations
      //               until -n       +1  +1  +1  +1  +1  +1
      //
      // Convolution: filter = sum( signal(time) * Kernel(phase*pi) )
      //              time   = sample + instance
      //              phase  = sample - delta_t/dt
      //              sample = -2 .. 3
      //
      // Loop over 2n support points for the convolution = sum( random(t_i)*kernel(t-t_i) )
      // The random number is for time =     (floor(t/dt) * dt + i * dt)
      // The kernel result is for time = t - (floor(t/dt) * dt + i * dt)
      // or, if sampled:          time = t - (    t_last       + i * dt)
        for i in (-n+1):(n) loop
          (raw, states_temp) := PDF(states_in=states_temp, instance=(floor(t/dt+i)*dt));
          coefficient        := if t_last <= t then Kernel(t=   t - (    t_last+i *dt), dt=dt) else
                                                    Kernel(t=   t - (floor(t/dt+i)*dt), dt=dt);

        //  Modelica.Utilities.Streams.print("i=" + String(i) + ", raw=" + String(raw));
          rand               := rand + raw*coefficient;
          scaling            := scaling + coefficient;

          if i == 0 then
            rand_hold := raw;
          end if;
        end for;

      // Scale the result in order to smooth higher harmonics
        rand := rand / scaling;

      // Make sure, the output states_out for recurrent generators are senseful
        (raw, states_out)    := PDF(states_in=states_in,   instance=floor(t/dt)*dt);

        annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
      end PSD_Interpolation;

      function PSD_Convolution
        "Apply an arbitrary filter by convolution with its impulse response"
        extends Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.Interfaces.PSD;
        replaceable function Kernel =
            Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.PSD.Kernels.IdealLowPass
          constrainedby Interfaces.Kernel
          annotation(choicesAllMatching=true, Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));

        input Integer n = 5 "Number of support points for convolution" annotation(Dialog);
        input Integer max_n = n
          "Maximum nummber of support points for comparability" annotation(Dialog);

      protected
        Real raw "The raw random numbers from the PDF function";
        Real coefficient "The convolution coefficients";
        Real coefficient_l "The convolution coefficients";
        Real coefficient_r "The convolution coefficients";
        Real scaling1
          "The scaling to make sure, a constant signal remains constant";
        Real scaling2 "The scaling to make sure, the variance remains";
        Integer states_temp[size(states_in,1)]
          "Intermediate states for recurrent RNGs";
          Integer j;
      algorithm

      // Initialize the convolution algorithm
        rand        := 0;
        scaling1    := 0;
        scaling2    := 0;
        states_temp := states_in;

      // Make sure, the recurrent generators are centered
        for i in (-max_n):(-n) loop
          (raw,states_temp) := PDF(instance=(floor(t/dt) + i)*dt, states_in=states_temp);
        end for;

      // What is convolution?!
      //                               -2dt      t      +2dt
      //                         + - + - + - + - + - + - + - + - + -> simulation time
      //                           -3dt    -1dt     +1dt    +3dt
      //                                         |
      //
      //                      1 -|               ^    Kernel(delta_t)
      //                         |              / \
      //                         |     _       /   \       _
      //                         |  -3/ \-2 -1/  0  \1   2/ \3
      //                      0 -+ - + - + - + - + - + - + - + - + -> phase
      //                         |  |   | \ /   |   | \ /   |
      //             delta_t/dt <>         V           V
      //                        |   |   |   |   |   |   |   |   dt
      //                        |                              /
      //                        +   +   +   +   +   +   +   +<->+     sample
      //                           -3  -2  -1   0   1   2   3         0 at floor(time/dt) = instance
      //
      // states_in _________________^___^___^___^___^___^___^
      //              iterations
      //               until -n       +1  +1  +1  +1  +1  +1
      //
      // Convolution: filter = sum( signal(time) * Kernel(phase*pi) )
      //              time   = sample + instance
      //              phase  = sample - delta_t/dt
      //              sample = -2 .. 3
      //
      // Loop over 2n support points for the convolution = sum( random(t_i)*kernel(t-t_i) )
      // The random number is for time =     (floor(t/dt) * dt + i * dt)
      // The kernel result is for time = t - (floor(t/dt) * dt + i * dt)
      // or, if sampled:          time = t - (    t_last       + i * dt)

          coefficient_l      := if t_last <= t then Kernel(t=     -              n*dt, dt=dt) else
                                                    Kernel(t=     -              n*dt, dt=dt);
          coefficient_r      := if t_last <= t then Kernel(t=   t - (    t_last-n *dt)+dt, dt=dt) else
                                                    Kernel(t=   t - (floor(t/dt-n)*dt)+dt, dt=dt);
      //    rand := rand + raw*(coefficient_r - coefficient_l);

          coefficient_l      := if t_last <= t then Kernel(t=   t - (    t_last+j *dt)-dt, dt=dt) else
                                                    Kernel(t=   t - (floor(t/dt+j)*dt)-dt, dt=dt);
          coefficient_r      := if t_last <= t then Kernel(t=   t - (    t_last+j *dt), dt=dt) else
                                                    Kernel(t=   t - (floor(t/dt+j)*dt), dt=dt);

        for i in (-n+1):(n) loop
          (raw, states_temp) := PDF(states_in=states_temp, instance=(floor(t/dt+i)*dt));
          coefficient        := if t_last <= t then Kernel(t=   t - (    t_last+i *dt), dt=dt) else
                                                    Kernel(t=   t - (floor(t/dt+i)*dt), dt=dt);
          coefficient_l      := if t_last <= t then Kernel(t=   t - (    t_last+i *dt), dt=dt) else
                                                    Kernel(t=   t - (floor(t/dt+i)*dt), dt=dt);
          coefficient_r      := if t_last <= t then Kernel(t=   t - (    t_last+i *dt)+dt, dt=dt) else
                                                    Kernel(t=   t - (floor(t/dt+i)*dt)+dt, dt=dt);

        //  Modelica.Utilities.Streams.print("i=" + String(i) + ", raw=" + String(raw));
      //    rand               := rand + raw*coefficient;
          rand               := rand + raw*(coefficient_r-coefficient_l);
          scaling1           := scaling1 + coefficient^1;
          scaling2           := scaling2 + coefficient^2;
        end for;

      // Scale according to dt and n
        //rand := rand / 1;//dt;//sqrt((2*n+1) *dt^2);

      // Scale the result in order to smooth higher harmonics
        //rand := rand / scaling1;

      // Scale the result in order to match the variance
        //rand := rand * sqrt(abs(scaling1)) / sqrt(scaling2);

      // Make sure, the output states_out for recurrent generators are senseful
        (rand_hold, states_out)    := PDF(states_in=states_in,   instance=floor(t/dt)*dt+dt);

        annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
      end PSD_Convolution;

      package Kernels
        "A collection of useful kernels for the convolution filter"
        extends Modelica.Icons.Package;

        function IdealLowPass "The kernel for an ideal low-pass filter"
          extends
            Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.Interfaces.Kernel;
          import Modelica_Noise.Math.sinc;
          import Modelica.Constants.pi;
          input Modelica.SIunits.Frequency B=1/2/dt
            "The cut-off frequency of the filter" annotation(Dialog);
        algorithm
          h := 2*B*sinc(2*pi*B*t);

          annotation (Icon(graphics={Line(
                  points={{-70,-10},{-64,-2},{-60,0},{-56,-2},{-50,-10},{-44,-20},{-40,-24},
                      {-36,-20},{-30,-10},{-20,50},{-10,60},{0,50},{10,-10},{16,-20},{20,
                      -24},{24,-20},{30,-10},{36,-2},{40,0},{44,-2},{50,-10}},
                  color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
        end IdealLowPass;

        function Linear "The kernel for linear interpolation"
          extends
            Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.Interfaces.Kernel;
          import Modelica.Constants.pi;
        algorithm
          h := if t < -dt then 0        else
               if t <   0 then (1+t/dt) else
               if t <  dt then (1-t/dt) else 0;

          annotation (Icon(graphics={Line(
                  points={{-80,-10},{-60,-10},{-10,60},{40,-10},{60,-10}},
                  color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
        end Linear;

        function Gaussian "The kernel for a Gaussian filter"
          extends
            Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.Interfaces.Kernel;
          import Modelica.Constants.pi;
          import Modelica.Math.log;

          input Real f_cutoff = 1/2/dt "Cut-off frequency" annotation(Dialog);
          input Real c =        2
            "Cut-off value: Cut-off frequency is defined at a filter response of 1/c"
                                                                                                            annotation(Dialog);
        protected
          Real sigma_f "Standard deviation in the frequency domain";
          Real sigma "Standard deviation in the time domain";
        algorithm

          // Impulse response:
          sigma_f := f_cutoff / sqrt(2*log(c));
          sigma   := 1/2/pi/sigma_f;
          h       := 1/sqrt(2*pi)/sigma * exp(-t^2/2/sigma^2);

          annotation (Icon(graphics={Line(
                  points={{-10,74},{-22,60},{-34,28},{-42,2},{-56,-4},{-88,-10}},
                  color={255,0,0}), Line(
                  points={{-10,74},{2,60},{14,28},{22,2},{36,-4},{68,-10}},
                  color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
        end Gaussian;

        function FirstOrder "The kernel for a first order filter"
          extends
            Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.Interfaces.Kernel;
          input Real k=1 "Gain" annotation(Dialog);
          input Modelica.SIunits.Period T=0.05 "Time Constant" annotation(Dialog);
        protected
          Real a;
          Real b;
        algorithm

          // Transfer function:
          // G = k / (Ts + 1)
          //   = b / ( s + a) => b = k/T, a = 1/T
          // Impulse response:
          // h = b*e^(-at) for t >= 0
          b := k/T;
          a := 1/T;
        //  h := if t >= 0 then b * exp(-abs(a*t))*exp(t-dt) else 0;
          h := if t >= 0 then b * exp(-a*t) else 0;
        //  h := b * exp(-abs(a*t));
        //  h := if t >=0 then b/a*(1 - exp(-abs(a*t))) else 0;
        //  h := if t >=0 then b/a*(1 - exp(-abs(a*t))) else 0;
        // //  h := if t >= 0 then b/a * exp(-a*t) * (1-exp(a*dt)) else 0;
        //    h := if t <  0 then 0 else
        //         if t < dt then 1 else 0;
        //  h :=h/b*a/50;

         h:= if t >= -0.0001 then -b/a*exp(-a*t) else -b/a;

          annotation (Icon(graphics={Line(
                  points={{-74,-10},{-10,-10},{-10,68},{-4,44},{6,14},{24,-2},{44,-8},{
                      70,-8}},
                  color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
        end FirstOrder;
      annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
      end Kernels;
    annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",     info="<html>
<p>This package contains the implemented power spectral densities, i.e. the distributions of generated frequencies in the random signal.</p>
<p>There are currently two different ways of shaping these frequencies:</p>
<ul>
<li>An interpolation method (which is readily usabale) and</li>
<li>a convolution filter (which needs some review).</li>
</ul>
</html>"),     Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics));
    end PSD;

    package Interfaces "Interfaces for the functions used in this library"
    extends Modelica.Icons.InterfacesPackage;

      partial function PSD
        "The basic interface for a power spectral density function"
        import Modelica_Noise;
        output Real rand_hold "The raw random number";
        extends
          Modelica_Noise.Math.RandomDistributions.Interfaces.partialInputOutput(
            instance=t);
        input Modelica.SIunits.Time t
          "The current value of the internal simulation time";
        input Modelica.SIunits.Period dt
          "The intended period of the raw random number";
        input Modelica.SIunits.Time t_last
          "The last time a random number was generated";
        replaceable function PDF =
            Modelica_Noise.Math.RandomDistributions.uniform constrainedby
          Modelica_Noise.Math.RandomDistributions.Interfaces.partialRandom
          "The probability density function to be used"
          annotation(choicesAllMatching=true,
                     Dialog(enable=false,
                            tab = "Do not use"),
          Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));

        annotation (Icon(graphics={
              Line(points={{-80,-92},{-80,90}},   color={0,0,0}),
              Polygon(
                points={{-80,90},{-90,70},{-70,70},{-80,90}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Line(points={{-92,-80},{92,-80}},
                                              color={0,0,0}),
              Polygon(
                points={{92,-80},{72,-70},{72,-90},{92,-80}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(
                lineColor={255,128,0},
                extent={{-100,-100},{100,100}},
                radius=25)}),     Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
      end PSD;

      partial function Kernel
        "Interface for convolution kernels (impulse responses) of convolution filters"
        input Real t "The time";
        input Real dt "The sampling period of the signal";
        output Real h "The impulse response of convolution filter";
        annotation (Icon(graphics={
              Polygon(
                points={{-10,100},{-20,80},{0,80},{-10,100}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Line(points={{-10,-100},{-10,100}}, color={0,0,0}),
              Line(points={{-100,-10},{100,-10}},
                                              color={0,0,0}),
              Polygon(
                points={{100,-10},{80,0},{80,-20},{100,-10}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(
                lineColor={255,128,0},
                extent={{-100,-100},{100,100}},
                radius=25)}),                     Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
      end Kernel;

      partial function combineSeed "a function combining integer seeds"
        input Integer seed1;
        input Integer seed2;
        output Integer newSeed;
        annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
      end combineSeed;
    annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end Interfaces;

    package Auxiliary "Auxiliary functions"
      extends Modelica.Icons.Package;

      function shuffleDouble
         input Real x;
         input Integer seed;
         output Real y;

        external "C" y = NOISE_shuffleDouble(x,seed);

       annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));

      end shuffleDouble;

      function SeedReal
        "Uses a real value for initializing an RNG's state vector"

        input Integer local_seed "The local seed";
        input Integer global_seed "The global seed";
        input Real real_seed "The real seed";
        input Integer n "The number of initial state values to be generated";
        output Integer states[n] "The generated initial states";

        external "C" NOISE_SeedReal(local_seed, global_seed, real_seed, n, states);

       annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",       info="<html>
<p>This function converts the Real value to Integer values and fills the state vector with them.</p>
</html>"));
      end SeedReal;

      function combineSeedLCG "combines two seed values in an LCG fashion"
        extends Blocks.Sources.NoiseAuxiliaries.Interfaces.combineSeed;

      //algorithm
      //    newSeed := seed1 + seed2 + 1;
      //  newSeed := seed1*134775813 + seed2*134775813 + 1;

        external "C" newSeed = NOISE_combineSeedLCG(seed1,seed2);

       annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));

      end combineSeedLCG;
    annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end Auxiliary;
  end NoiseAuxiliaries;
end Sources;
