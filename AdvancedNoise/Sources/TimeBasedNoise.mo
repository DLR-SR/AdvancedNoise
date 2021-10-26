within AdvancedNoise.Sources;
block TimeBasedNoise
  "Noise generator for Real numbers associated with time (this block computes always the same (random) output y at the same time instant)"
  import Modelica.Math.Random;
  import Modelica.Utilities.Streams.print;
  import Modelica.Math.Random.Utilities.impureRandomInteger;

  extends Modelica.Blocks.Interfaces.SO;

  // Main dialog menu
  parameter Modelica.Units.SI.Time samplePeriod(start=0.01)
    "Period for sampling the raw random numbers"
    annotation(Dialog(enable=enableNoise));

  // Advanced dialog menu: Noise generation
  parameter Boolean enableNoise = true "=true: y = noise, otherwise y = y_off"
    annotation(choices(checkBox=true),Dialog(tab="Advanced",group="Noise generation"));
  parameter Real y_off = 0.0 "Output if time<startTime or enableNoise=false"
    annotation(Dialog(tab="Advanced",group="Noise generation"));
  parameter Integer sampleFactor(min=1)=100
    "Events only at samplePeriod*sampleFactor if continuous"
    annotation(Evaluate=true,Dialog(tab="Advanced",group="Noise generation", enable=enableNoise));
  final parameter Integer shift = 200 - interpolation.nPast
    "Shift noise samples to account for interpolation buffer"
    annotation(Dialog(tab="Advanced",group="Noise generation"));

  // Advanced dialog menu: Random number properties
  replaceable function distribution = Modelica.Math.Distributions.Uniform.quantile
    constrainedby Modelica.Math.Distributions.Interfaces.partialQuantile
    "Random number distribution"
    annotation(choicesAllMatching=true, Dialog(tab="Advanced",group="Random number properties",enable=enableNoise),
    Documentation(revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th align=\"left\">Description</th>
  </tr>
  <tr>
    <td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\">
      <table border=\"0\">
        <tr>
          <td valign=\"top\">
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));
  replaceable package interpolation = Interpolators.Constant
    constrainedby Interpolators.Utilities.Interfaces.PartialInterpolator
    "Interpolation method in grid of raw random numbers"
    annotation(choicesAllMatching=true, Dialog(tab="Advanced",group="Random number properties",enable=enableNoise),
    Documentation(revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th align=\"left\">Description</th>
  </tr>
  <tr>
    <td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\">
      <table border=\"0\">
        <tr>
          <td valign=\"top\">
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));
  replaceable package generator = Modelica.Math.Random.Generators.Xorshift128plus
    constrainedby Generators.Utilities.Interfaces.PartialGenerator
    "Random number generator"
    annotation(choicesAllMatching=true, Dialog(tab="Advanced",group="Random number properties",enable=enableNoise),
    Documentation(revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th align=\"left\">Description</th>
  </tr>
  <tr>
    <td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\">
      <table border=\"0\">
        <tr>
          <td valign=\"top\">
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));

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

  // Generate the actually used local seed
  final parameter Integer localSeed(fixed = false) "The actual localSeed";
initial equation
  localSeed = if useAutomaticLocalSeed then impureRandomInteger(globalSeed.id_impure) else fixedLocalSeed;

public
  parameter Modelica.Units.SI.Time startTime = 0.0
    "Start time for sampling the raw random numbers"
    annotation(Dialog(tab="Advanced", group="Initialization",enable=enableNoise));

  // Retrieve values from outer global seed
protected
  outer Modelica.Blocks.Noise.GlobalSeed globalSeed
    "Definition of global seed via inner/outer";
  parameter Integer actualGlobalSeed = if useGlobalSeed then globalSeed.seed else 0
    "The global seed, which is atually used";
  parameter Boolean generateNoise = enableNoise and globalSeed.enableNoise
    "= true if noise shall be generated, otherwise no noise";

  // Construct sizes
  parameter Boolean continuous = interpolation.continuous
    "= true, if continuous interpolation";
  parameter Real actualSamplePeriod = if continuous then sampleFactor*samplePeriod else samplePeriod
    "Sample period of when-clause";
  parameter Integer nFuture = interpolation.nFuture+1
    "Number of buffer elements to be predicted in the future (+1 for crossing sample events)";
  parameter Integer nPast = interpolation.nPast
    "Number of buffer elements to be retained from the past";
  parameter Integer nCopy = nPast + nFuture
    "Number of buffer entries to retain when re-filling buffer";
  parameter Integer nBuffer = if continuous then nPast+sampleFactor+nFuture
                                            else nPast+      1     +nFuture
    "Size of buffer";

  // Declare buffers
  discrete Integer state[generator.nState]
    "Internal state of random number generator";
  discrete Real buffer[nBuffer] "Buffer to hold raw random numbers";
  discrete Real bufferStartTime "The last time we have filled the buffer";
  discrete Real r "Uniform random number in the range (0,1]";

algorithm
  // During initialization the buffer is filled with random values
  when initial() then
    state := generator.initialState(localSeed, actualGlobalSeed);
    bufferStartTime := time;
    for i in 1:shift loop
      (r, state) := generator.random(state);
    end for;
    for i in 1:nBuffer loop
      (r, state) := generator.random(state);
      buffer[i] := distribution(r);
    end for;

  // At the first sample, we simply use the initial buffer
  elsewhen generateNoise and time >= startTime then
    bufferStartTime := time;

  // At the following samples, we shift the buffer and fill the end up with new random numbers
  elsewhen generateNoise and sample(startTime+actualSamplePeriod, actualSamplePeriod) then
    bufferStartTime := time;
    buffer[1:nCopy] := buffer[nBuffer-nCopy+1:nBuffer];
    for i in nCopy+1:nBuffer loop
      (r, state) := generator.random(state);
      buffer[i]  := distribution(r);
    end for;
  end when;

equation

  // Generate noise, if requested, and make it smooth, if it is
  y = if not generateNoise or time < startTime then y_off else
      if interpolation.continuous then
          smooth(interpolation.smoothness,
                 interpolation.interpolate(buffer =      buffer,
                                           offset =      (time-bufferStartTime) / samplePeriod + nPast,
                                           samplePeriod= samplePeriod)) else
                 interpolation.interpolate(buffer =      buffer,
                                           offset =      (time-bufferStartTime) / samplePeriod + nPast,
                                           samplePeriod= samplePeriod);

  annotation (
    Dialog(tab="Advanced",group = "Initialization",enable=enableNoise),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={
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
              53},{49,19},{57,19},{57,-47},{67,-47}}),
        Text(visible=enableNoise,
          extent={{-150,-110},{150,-150}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          textString="%samplePeriod s"),
        Line(visible=not enableNoise,
          points={{-76,56},{72,56}}),
        Text(visible=not enableNoise,
          extent={{-75,50},{95,10}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid,
          textString="%y_off")}),
    Documentation(info="<html>
<p>
A&nbsp;summary of the properties of the noise blocks is provided in the documentation
of package <a href=\"modelica://Modelica.Blocks.Noise\">Modelica.Blocks.Noise</a>.
This TimeBasedNoise block generates reproducible noise at its output.
The block can only be used if on the same or a&nbsp;higher hierarchical level,
model <a href=\"modelica://Modelica.Blocks.Noise.GlobalSeed\">Modelica.Blocks.Noise.GlobalSeed</a>
is dragged to provide global settings for all instances.
</p>

<p>
For every block instance,
the internally used pseudo random number generator has its own state, and therefore
the random values computed in different instances of the TimeBasedNoise block are
uncorrelated. The random values provided at the output of a&nbsp;TimeBasedNoise
instance depend (a)&nbsp;on the <strong>actual time</strong> instant, (b)&nbsp;on
the instance name, and (c)&nbsp;on the settings of the respective instance (as well
as the seetings in globalSeed, see above and below). By default, two or more instances
produce different, uncorrelated noise at the same time instant.
</p>


<h4>Parameters that need to be defined</h4>
<p>
When using this block, at a&nbsp;minimum the following parameters must be defined:
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>
      Parameter
    </th>
    <th>
      Description
    </th>
  </tr>
  <tr>
    <td>
      samplePeriod
    </td>
    <td>
      Random values are drawn periodically at the sample rate in [s]
      defined with this parameter. As a&nbsp;result, the highest frequency
      f<sub>max</sub> contained in the generated noise is
      f<sub>max</sub>&nbsp;= 1/samplePeriod.
      By default, time events are generated only at every 100 sample instant.
      In between, the noise is linearly interpolated at the drawn random
      values.
    </td>
  </tr>
</table>

<p>
As a simple demonstration, see example <a href=\"modelica://AdvancedNoise.Examples.TimeBasedNoise\">Examples.TimeBasedNoise</a>.
In the next diagram, a&nbsp;simulation result is shown for
samplePeriod&nbsp;=&nbsp;0.02&nbsp;s, y_min&nbsp;=&nbsp;-1, y_max&nbsp;=&nbsp;3:
</p>
<blockquote>
<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/TimeBasedNoise.png\" alt=\"Diagram TimeBasedNoise.png\">
</blockquote>

<h4>Advanced tab: General settings</h4>
<p>
In the <strong>Advanced</strong> tab of the parameter menu, further options can be set.
The general settings are shown in the next table:
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>
      Parameter
    </th>
    <th>
      Description
    </th>
  </tr>
  <tr>
    <td>
      enableNoise
    </td>
    <td>
      = true, if noise is generated at the output of the block.<br>
      = false, if noise generation is switched off and the constant value
      y_off is provided as output.
    </td>
  </tr>
  <tr>
    <td>
      y_off
    </td>
    <td>
      If enableNoise&nbsp;=&nbsp;false, the output of the block instance has
      the value y_off. Default is y_off&nbsp;=&nbsp;0.0.
      Furthermore, if time&nbsp;&lt;&nbsp;startTime, the output of the block
      is also y_off.
    </td>
  </tr>
  <tr>
    <td>
      sampleFactor
    </td>
    <td>
      If the drawn random numbers are continuously interpolated
      (so interpolation &ne; Constant), then a time event is only
      generated at every sampleFactor sample instant. At such an event a
      buffer is filled with the next sampleFactor random values and
      interpolation takes place in this buffer. This approach speeds up the
      simulation considerably, in many cases (provided not too small relative
      tolerance is selected for the integrator).
      If interpolation = Constant, then sampleFactor is ignored and a time
      event is generated at every sample instant. If sampleFactor = 1, then
      a time event is also generated at every sample instant, independently of
      the selected interpolation method (which leads usually to a slow
      simulation). 
    </td>
  </tr>
</table>

<h4>Advanced tab: Random number properties</h4>
<p>
In the group \"Random number properties\", the properties of the random number
generation are defined. By default, uniform random numbers with linear
interpolation are used, and the random numbers are drawn with the pseudo
random number generator algorithm \"xorshift128+\". This random number generator
has a period of 2^128, has an internal state of 4 Integer elements, and has
excellent statistical properties. If the default behavior is not desired, the
following parameters can be set:
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>
      Parameter
    </th>
    <th>
      Description
    </th>
  </tr>
  <tr>
    <td>
      distribution
    </td>
    <td>
      Defines the random number distribution to map random numbers from
      the range 0.0&nbsp;...&nbsp;1.0, to the desired range and distribution.
      Basically, <strong>distribution</strong> is a&nbsp;replaceable function that
      provides the truncated quantile (= truncated inverse cumulative distribution
      function) of a&nbsp;random distribution. More details of truncated
      distributions can be found in the documentation of package
      <a href=\"modelica://AdvancedNoise.Distributions\">Distributions</a>.
    </td>
  </tr>
  <tr>
    <td>
      interpolation
    </td>
    <td>
      Defines the type of interpolation between the random values drawn at
      sample instants. This is a&nbsp;replaceable package. The following
      interpolation packages are provided in package
      <a href=\"modelica://AdvancedNoise.Interpolators\">Interpolators</a>:
      <ul>
        <li>
          Constant: The random values are held constant between sample instants.
        </li>
        <li>
          Linear: The random values are linearly interpolated between sample instants.
        </li>
        <li>
          SmoothIdealLowPass: The random values are smoothly interpolated with the
          <a href=\"modelica://Modelica.Math.Special.sinc\">sinc</a> function.
          This is an approximation of an ideal low pass filter
          (that would have an infinite steep drop of the frequency response at
          the cut-off frequency 1/samplePeriod).
        </li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>
      generator
    </td>
    <td>
      Defines the pseudo random number generator to be used. This is
      a&nbsp;replaceable package. The random number generators that are provided in
      package <a href=\"modelica://AdvancedNoise.Generators\">Generators</a>
      can be used here. Properties of the various generators are described
      in the package description of the Generators package.
    </td>
  </tr>
</table>

<p>
The different interpolation methods are demonstrated with example
<a href=\"modelica://AdvancedNoise.Examples.InterpolateRandomNumbers\">Examples.InterpolateRandomNumbers</a>.
A simulation result is shown in the next diagram:
</p>

<blockquote>
<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/InterpolationInterpolators.png\" alt=\"Diagram InterpolationInterpolators.png\">
</blockquote>

<p>
As can be seen, constant (constantNoise.y) and linear (linearNoise.y)
interpolation respects the defined band -1&nbsp;..&nbsp;3. Instead, smooth
interpolation with the sinc function (smoothNoise.y) may violate the band
slightly in order to be able to smoothly interpolate the random values at
the sample instants.
In practical applications, this is not an issue because the exact band of
the noise is usually not exactly known.
</p>

<p>
The selected interpolation method does not change the mean value of the noise
signal, but it changes its variance with the following factors:
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>
      Interpolation
    </th>
    <th>
      Variance factor
    </th>
  </tr>
  <tr>
    <td>
      Constant
    </td>
    <td>
      1.0
    </td>
  </tr>
  <tr>
    <td>
      Linear
    </td>
    <td>
      2/3 (actual variance = 2/3*&lt;variance of constantly interpolated noise&gt;)
    </td>
  </tr>
  <tr>
    <td>
      SmoothIdealLowPass
    </td>
    <td>
      0.979776342307764 (actual variance = 0.97..*&lt;variance of constantly interpolated noise&gt;)
    </td>
  </tr>
</table>

<p>
The above table holds only if an event is generated at every sample instant
(sampleFactor=1), or for very small relative tolerances. Otherwise, the variance
depends also slightly on the step-size and the interpolation method of the
integrator. Therefore, if the variance of the noise is important for your application,
either change the distribution definition to take the factors above into account,
or use only constant interpolation.
</p>

<h4>Advanced tab: Initialization</h4>

<p>
The random number generators must be properly initialized, especially that
different instances of the noise block generate uncorrelated noise.
For this purpose the following parameters can be defined.
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>
      Parameter
    </th>
    <th>
      Description
    </th>
  </tr>
  <tr>
    <td>
      useGlobalSeed
    </td>
    <td>
      = true, if the seed (= Integer number) defined in the &quot;inner
      GlobalSeed globalSeed&quot; component is used for the initialization
      of the random number generators. Therefore, whenever the globalSeed
      defines a&nbsp;different number, the noise at every instance is changing.
      <br>= false, if the seed defined by globalSeed is ignored.
      For example, if aerodynamic turbulence is modelled with a&nbsp;noise
      block and this turbulence model shall be used for all simulation runs of
      a&nbsp;Monte Carlo simulation, then useGlobalSeed has to be set to false.
    </td>
  </tr>
  <tr>
    <td>
      useAutomaticLocalSeed
    </td>
    <td>
      An Integer number, called local seed, is needed to initalize the random
      number generator for a&nbsp;specific block instance. Instances using the
      same local seed produce exactly the same random number values (so the same
      noise, if the other settings of the instances are the same).
      If useAut5omaticLocalSeed&nbsp;= true, the local seed is determined
      automatically as hash value of the instance name of the noise block.
      If useAutomaticLocalSeed&nbsp;= false, the local seed is defined
      explicitly by parameter fixedLocalSeed.
    </td>
  </tr>
  <tr>
    <td>
      fixedLocalSeed
    </td>
    <td>
      If useAutomaticLocalSeed&nbsp;= false, the local seed to be used.
      fixedLocalSeed can be any Integer number (including zero or a negative
      number). The initialization algorithm produces a meaningful initial state
      of the random number generator, so the subsequently drawing of random
      numbers produce statistically meaningful numbers.
    </td>
  </tr>
  <tr>
    <td>
      startTime
    </td>
    <td>
      The time instant at which noise shall be generated at the output&nbsp;y.
      For time&nbsp;&lt;&nbsp;startTime, y&nbsp;=&nbsp;y_off. In some cases it
      is meaningful to simulate a&nbsp;certain duration until an approximate
      steady-state is reached. In such a&nbsp;case startTime should be set to
      a&nbsp;time instant after this duration.
    </td>
  </tr>
</table>
</html>", revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th align=\"left\">Description</th>
  </tr>
  <tr>
    <td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\">
      <table border=\"0\">
        <tr>
          <td valign=\"top\">
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));
end TimeBasedNoise;
