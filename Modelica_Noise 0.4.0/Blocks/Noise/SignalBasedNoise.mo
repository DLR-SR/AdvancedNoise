within Modelica_Noise.Blocks.Noise;
block SignalBasedNoise
  "Noise generator for Real numbers associated with the input signal (this block computes always the same (random) output y at the same value of the input signal)"
  import Modelica_Noise.Math.Random;
  import Modelica.Utilities.Streams.print;

  extends Modelica.Blocks.Interfaces.SO;

  // Main dialog menu
  parameter Boolean useTime = true
    "= true: u = time otherwise use input connector"
    annotation(choices(checkBox=true));

  parameter Real samplePeriod(start=0.01)
    "Period in signal for pseudo-sampling the raw random numbers"
    annotation(Dialog(enable=enableNoise));
  parameter Real y_min(start=0.0) "Minimum value of noise"
    annotation(Dialog(enable=enableNoise));
  parameter Real y_max(start=1.0) "Maximum value of noise"
    annotation(Dialog(enable=enableNoise));

  // Advanced dialog menu: Noise generation
  parameter Boolean enableNoise = true "=true: y = noise, otherwise y = y_off"
    annotation(choices(checkBox=true),Dialog(tab="Advanced",group="Noise generation"));
  parameter Real y_off = 0.0 "Output if time<startTime or enableNoise=false"
    annotation(Dialog(tab="Advanced",group="Noise generation"));
  //parameter Integer sampleFactor(min=1)=100
  //  "Events only at samplePeriod*sampleFactor if continuous"
  //  annotation(Evaluate=true,Dialog(tab="Advanced",group="Noise generation", enable=enableNoise));
  final parameter Integer shift = -interpolation.nPast
    "Shift noise samples to account for interpolation buffer"
    annotation(Dialog(tab="Advanced",group="Noise generation"));

  // Advanced dialog menu: Random number properties
  replaceable function distribution =
       Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile constrainedby
    Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialQuantile(
      final y_min=y_min, final y_max=y_max)
    "Random number distribution (truncated to y_min..y_max)"
    annotation(choicesAllMatching=true, Dialog(tab="Advanced",group="Random number properties",enable=enableNoise));
  replaceable package interpolation =
      Modelica_Noise.Math.Random.Utilities.Interpolators.Linear constrainedby
    Modelica_Noise.Math.Random.Utilities.Interfaces.PartialInterpolator
    "Interpolation method in grid of raw random numbers"
    annotation(choicesAllMatching=true, Dialog(tab="Advanced",group="Random number properties",enable=enableNoise));
  replaceable package generator =
      Modelica_Noise.Math.Random.Generators.Xorshift128plus constrainedby
    Modelica_Noise.Math.Random.Utilities.Interfaces.PartialGenerator
    "Random number generator"
    annotation(choicesAllMatching=true, Dialog(tab="Advanced",group="Random number properties",enable=enableNoise));

  // Advanced dialog menu: Initialization
  parameter Boolean useGlobalSeed = true
    "= true: use global seed, otherwise ignore it"
    annotation(choices(checkBox=true),Dialog(tab="Advanced",group = "Initialization",enable=enableNoise));
  parameter Boolean useAutomaticLocalSeed = true
    "= true: use instance name hash else fixedLocalSeed"
    annotation(choices(checkBox=true),Dialog(tab="Advanced",group = "Initialization",enable=enableNoise));
  parameter Integer fixedLocalSeed = 10
    "Local seed if useAutomaticLocalSeed = false"
      annotation(Dialog(tab="Advanced",group = "Initialization",enable=enableNoise and not useAutomaticLocalSeed));
  final parameter Integer localSeed = if useAutomaticLocalSeed then Modelica_Noise.Math.Random.Utilities.automaticLocalSeed(getInstanceName()) else
                                                                    fixedLocalSeed;
  parameter Real signalOffset = 0.0
    "Offset in signal for sampling the raw random numbers"
    annotation(Dialog(tab="Advanced", group="Initialization",enable=enableNoise));

  Modelica.Blocks.Interfaces.RealInput u if not useTime
    "Input signal (the noise depends on the value of u at the actual time instant"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}}, rotation=0)));

  // Retrieve values from outer global seed
protected
  outer Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    "Definition of global seed via inner/outer";
  parameter Integer actualGlobalSeed = if useGlobalSeed then globalSeed.seed else 0
    "The global seed, which is atually used";
  parameter Boolean generateNoise = enableNoise and globalSeed.enableNoise
    "= true if noise shall be generated, otherwise no noise";

  // Construct sizes
  parameter Boolean continuous = interpolation.continuous
    "= true, if continuous interpolation";
  //parameter Real actualSamplePeriod = if continuous then sampleFactor*samplePeriod else samplePeriod
  //  "Sample period of when-clause";
  parameter Integer nFuture = interpolation.nFuture
    "Number of buffer elements to be predicted in the future (+1 for rounding errors)";
  parameter Integer nPast = interpolation.nPast
    "Number of buffer elements to be retained from the past";
  //parameter Integer nCopy = nPast + nFuture
  //  "Number of buffer entries to retain when re-filling buffer";
  parameter Integer nBuffer = nPast+1+nFuture "Size of buffer";
  //parameter Integer nBuffer = if continuous then nPast+sampleFactor+nFuture
  //                                          else nPast+      1     +nFuture
  //  "Size of buffer";

  // Declare buffers
  //discrete Integer state[generator.nState]
  //  "Internal state of random number generator";
  Real buffer[nBuffer] "Buffer to hold raw random numbers";
  //discrete Real bufferStartTime "The last time we have filled the buffer";
  Real r[nBuffer] "Uniform random number in the range (0,1]";

  Modelica.Blocks.Interfaces.RealInput signal
    "The input signal to the random number generator";
  Real offset = (signal-signalOffset) / samplePeriod;
equation
   if useTime then
     signal = time;
   else
     connect(signal,u);
   end if;

  // Continuously fill the buffer with random numbers
  for i in 1:nBuffer loop
    r[i]      = zeroDer(generator.random(
                        initialState(localSeed=localSeed,
                                     globalSeed=actualGlobalSeed,
                                     signal=(noEvent(integer(offset)) + i + shift) * samplePeriod + signalOffset)));
    buffer[i] = zeroDer(distribution(r[i]));
  end for;

  // Generate noise, if requested
  if generateNoise then

    // Make sure, noise is smooth, if so declared
    if interpolation.continuous then
      y = smooth(interpolation.smoothness,
                 interpolation.interpolate(buffer=buffer,
                                           offset=offset - zeroDer(noEvent(integer(offset))) + nPast));
    else
      y =        interpolation.interpolate(buffer=buffer,
                                           offset=offset - zeroDer(       (integer(offset))) + nPast);
    end if;

  // Output y_off, if noise is not to be generated
  else
    y = y_off;
  end if;

  // We require a few smooth functions for derivatives
protected
  function convertRealToIntegers "Casts a double value to two integers"
  input Real real "The Real value";
  output Integer[2] int "The Integer values";

  external "C" ModelicaRandom_convertRealToIntegers(real,int);

  annotation (Include = "#include \"ModelicaRandom.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<h4>Syntax</h4>
<blockquote><pre>
int = <b>convertRealToInteger</b>(real);
</pre></blockquote>
<h4>Description</h4>
<p>
The Real input argument real is mapped to two Integer values int[1] and int[2].
The function assumes that two Integer values have exactly the same length
as one Real value (e.g. one Integer has a lenght of 32 bits and one Real
value has a lenght of 64 bits).
</p>
</html>"));
  end convertRealToIntegers;

  function initialState "Combine Real signal with Integer seeds"
    input Integer localSeed "The local seed";
    input Integer globalSeed "the global seed";
    input Real signal "The Real signal";
    output Integer state[generator.nState]
      "The initial state of random number generator";
  protected
    Integer ints[2] "Real signal casted to integers";
  algorithm
    ints  := convertRealToIntegers(signal);
    state := generator.initialState(localSeed+ints[1], globalSeed+ints[2]);
  end initialState;

  function zeroDer "Declare an expression to have zero derivative"
    input Real u "Original expression";
    input Real dummy = 0 "Dummy variable to have somthing to derive (=0)";
    output Real y "=u";
  algorithm
    y := u;
    annotation(Inline=false,derivative(noDerivative = u) = der_zeroDer);
  end zeroDer;

  function der_zeroDer "Zero derivative for zeroDer(expression)"
    input Real u "Original expression";
    input Real dummy = 0 "Dummy variable to have somthing to derive (=0)";
    input Real der_dummy = 0 "der(dummy)";
    output Real der_y "der(y) = der(u) = 0";
  algorithm
    der_y := 0;
    annotation(Inline=true);
  end der_zeroDer;

//   function smoothmod1 "A modulo 1 operator with defined derivative"
//     input Real dividend "The dividend";
//     output Real remainder "The remainder = mod(divident,1)";
//   algorithm
//     remainder := dividend - integer( dividend);
//     annotation(Inline=false, derivative = der_smoothmod1);
//   end smoothmod1;
//
//   function der_smoothmod1 "Derivative of modulo 1 operator"
//     input Real dividend "The dividend";
//     input Real der_dividend "der(dividend)";
//     output Real der_remainder "der(remainder)";
//   algorithm
//     der_remainder := der_dividend;
//     annotation(Inline=true);
//   end der_smoothmod1;
//
//   function smoothRandom
//     "A random number generator with defined derivative (=0)"
//     input Integer state[generator.nState] "The previous state of the generator";
//     input Real dummy = 0 "Dummy variable to have somthing to derive (=0)";
//     output Real r "A uniform random number";
//   algorithm
//     r := generator.random(state);
//     annotation(Inline=false, derivative(noDerivative = state) = der_smoothRandom);
//   end smoothRandom;
//
//   function der_smoothRandom "Derivative of random number (=0)"
//     input Integer state[generator.nState] "The previous state of the generator";
//     input Real dummy = 0 "Dummy variable to have somthing to derive (=0)";
//     input Real der_dummy = 0 "der(dummy)=0";
//     output Real der_r "der(r)";
//   algorithm
//     der_r := 0;
//     annotation(Inline=true);
//   end der_smoothRandom;
//
//   function smoothDistribution
//     "A random number generator with defined derivative (=0)"
//     input Real r "The uniform random number";
//     input Real dummy = 0 "Dummy variable to have somthing to derive (=0)";
//     output Real y "The transformed random number";
//   algorithm
//     y := distribution(r);
//     annotation(Inline=false, derivative(noDerivative = r) = der_smoothDistribution);
//   end smoothDistribution;
//
//   function der_smoothDistribution "Derivative of random number (=0)"
//     input Real r "The uniform random number";
//     input Real dummy = 0 "Dummy variable to have somthing to derive (=0)";
//     input Real der_dummy = 0 "der(dummy)=0";
//     output Real der_y "der(y)";
//   algorithm
//     der_y := 0;
//     annotation(Inline=true);
//   end der_smoothDistribution;

    annotation(Dialog(tab="Advanced",group = "Initialization",enable=enableNoise),
              Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Polygon(
          points={{-76,90},{-84,68},{-68,68},{-76,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-76,68},{-76,-80}}, color={192,192,192}),
        Line(points={{-86,0},{72,0}}, color={192,192,192}),
        Polygon(
          points={{94,0},{72,8},{72,-8},{94,0}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(visible=  enableNoise,
           points={{-75,-13},{-61,-13},{-61,3},{-53,3},{-53,-45},{-45,-45},{-45,
              -23},{-37,-23},{-37,61},{-29,61},{-29,29},{-29,29},{-29,-31},{-19,
              -31},{-19,-13},{-9,-13},{-9,-41},{1,-41},{1,41},{7,41},{7,55},{13,
              55},{13,-1},{23,-1},{23,11},{29,11},{29,-19},{39,-19},{39,53},{49,
              53},{49,19},{57,19},{57,-47},{67,-47}},
            color={0,0,0}),
        Text(visible=enableNoise,
          extent={{-150,-110},{150,-150}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          textString=if useTime then "%samplePeriod s" else "%samplePeriod"),
        Line(visible=not enableNoise,
          points={{-76,56},{72,56}},
          color={0,0,0},
          smooth=Smooth.None),
        Text(visible=not enableNoise,
          extent={{-75,50},{95,10}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          textString="%y_off")}),
    Documentation(info="<html>
<p>Remarks to be included in the documentation:</p>
<ul>
<li>If you use a sampleFactor together with time-varying distribution parameters, these parameters will only take effect at the sampled time instances!</li>
<li>Issue: Variance/standard deviation and/or limits of output signal may change with interpolation method.</li>
<li>Solution: In every Interpolation package a constant is introduced that describes the relationship between the variances of non-interpolated and interpolated signal (the constant is not used in the Noise package).</li>
<li>Additionally, in the documentation this is shortly explained:</li>
<li>LinearInterpolation: Variance becomes smaller; Limits are kept</li>
<li>SincInterpolation: Variance becomes a bit smaller; Limits are not kept.</li>
<li>This holds only if an event is generated at every sample instant, or for very small tolrel. Otherwise, the variance depends on the step-size and interpolation method of the integrator.</li>
</ul>
</html>"));
end SignalBasedNoise;
