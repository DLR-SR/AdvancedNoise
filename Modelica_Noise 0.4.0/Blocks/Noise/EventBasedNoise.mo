within Modelica_Noise.Blocks.Noise;
block EventBasedNoise
  import Modelica_Noise.Math.Random;
  import Modelica.Utilities.Streams.print;

  extends Modelica.Blocks.Interfaces.SO;

  // Main dialog menu
  parameter Modelica.SIunits.Time samplePeriod(start=0.01)
    "Period for sampling the raw random numbers"
    annotation(Dialog(enable=enableNoise));
  parameter Real y_min(start=0.0) "Minimum value of noise"
    annotation(Dialog(enable=enableNoise));
  parameter Real y_max(start=1.0) "Maximum value of noise"
    annotation(Dialog(enable=enableNoise));

  // Advanced dialog menu
  parameter Boolean enableNoise = true "=true: y = noise, otherwise y = y_off"
    annotation(choices(checkBox=true),Dialog(tab="Advanced"));
  parameter Real y_off = 0.0 "Output if time<startTime or enableNoise=false"
    annotation(Dialog(tab="Advanced"));
  parameter Integer sampleFactor(min=1)=100
    "Events only at samplePeriod*sampleFactor if continuous"
    annotation(Evaluate=true,Dialog(tab="Advanced", enable=enableNoise));

  replaceable function distribution =
       Modelica_Noise.Math.Random.TruncatedQuantiles.uniform constrainedby
    Modelica_Noise.Math.Random.Utilities.Interfaces.partialTruncatedQuantile(
      final y_min=y_min, final y_max=y_max)
    "Random number distribution (truncated to y_min..y_max)"
    annotation(choicesAllMatching=true, Dialog(tab="Advanced",enable=enableNoise));

  replaceable package interpolation =
      Modelica_Noise.Math.Random.Utilities.Interpolators.Linear constrainedby
    Modelica_Noise.Math.Random.Utilities.Interfaces.PartialInterpolator
    "Interpolation method in grid of raw random numbers"
    annotation(choicesAllMatching=true, Dialog(tab="Advanced",enable=enableNoise));

  replaceable package generator =
      Modelica_Noise.Math.Random.Generators.Xorshift128plus constrainedby
    Modelica_Noise.Math.Random.Utilities.Interfaces.PartialGenerator
    "Random number generator"
    annotation(choicesAllMatching=true, Dialog(tab="Advanced",enable=enableNoise));

  parameter Boolean useGlobalSeed = true
    "= true: use global seed, otherwise ignore it"
    annotation(choices(checkBox=true),Dialog(tab="Advanced",group = "Initialization",enable=enableNoise));
  parameter Boolean useAutomaticLocalSeed = true
    "= true: use instance name hash else fixedLocalSeed"
    annotation(choices(checkBox=true),Dialog(tab="Advanced",group = "Initialization",enable=enableNoise));
  parameter Integer fixedLocalSeed = 10
    "Local seed if useAutomaticLocalSeed = false"
      annotation(Dialog(tab="Advanced",group = "Initialization",enable=enableNoise and not useAutomaticLocalSeed));
  final parameter Integer localSeed = if useAutomaticLocalSeed then
                                    Modelica_Noise.Math.Random.Utilities.automaticLocalSeed(getInstanceName())
                                 else fixedLocalSeed;
  parameter Modelica.SIunits.Time startTime = 0.0
    "Start time for sampling the raw random numbers"
    annotation(Dialog(tab="Advanced", group="Initialization",enable=enableNoise));

protected
  outer Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    "Definition of global seed via inner/outer";
  parameter Integer actualGlobalSeed = if useGlobalSeed then globalSeed.seed else 0
    "The global seed, which is atually used";
  parameter Boolean generateNoise = enableNoise and globalSeed.enableNoise
    "= true if noise shall be generated, otherwise no noise";
  parameter Real actualSamplePeriod = if interpolation.continuous then
                                         sampleFactor*samplePeriod else samplePeriod
    "Sample period of when-clause";
  parameter Boolean continuous = interpolation.continuous
    "= true, if continuous interpolation";
  parameter Integer nFuture = if continuous then interpolation.nFuture+1 else 0
    "Number of buffer elements to be predicted in the future";
  parameter Integer nPast = interpolation.nPast
    "Number of buffer elements to be retained from the past";
  parameter Integer nCopy = nPast + nFuture
    "Number of buffer entries to retain when re-filling buffer";
  parameter Integer nBuffer = if continuous then nPast+sampleFactor+nFuture
                                            else 1 "Size of buffer";
  discrete Integer state[generator.nState]
    "Internal state of random number generator";
  discrete Real buffer[nBuffer] "Buffer to hold raw random numbers";
  discrete Real bufferStartTime "The last time we have filled the buffer";
  discrete Real r "Uniform random number in the range (0,1]";

algorithm
  when initial() then
    // During initialization the buffer is filled with random values
    state := generator.initialState(localSeed, actualGlobalSeed);
    bufferStartTime := time;

    for i in 1:nBuffer loop
      (r, state) := generator.random(state);
      buffer[i] := distribution(r);
    end for;

  elsewhen generateNoise and time >= startTime then
    // At the first sample, we simply use the initial buffer
    bufferStartTime := time;

  elsewhen generateNoise and sample(startTime+actualSamplePeriod, actualSamplePeriod) then
    // At the following samples, we shift the buffer and fill the end up with new random numbers
    bufferStartTime := time;
    if continuous then
       buffer[1:nCopy] := buffer[nBuffer-nCopy+1:nBuffer];
    end if;
    for i in nCopy+1:nBuffer loop
      (r, state) := generator.random(state);
      buffer[i] := distribution(r);
    end for;
  end when;

equation
  y = if generateNoise and time >= startTime then
         interpolation.interpolate(buffer=buffer,
            offset=(time-bufferStartTime) / samplePeriod + nPast)
      else y_off;

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
        Line(visible = enableNoise,
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
          textString="%samplePeriod s"),
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
end EventBasedNoise;
