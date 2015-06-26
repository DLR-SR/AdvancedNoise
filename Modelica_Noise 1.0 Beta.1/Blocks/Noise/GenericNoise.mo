within Modelica_Noise.Blocks.Noise;
block GenericNoise "Noise generator for arbitrary distributions"
  import Modelica_Noise.Math.Random;
  extends Modelica.Blocks.Interfaces.SO;

  // Main dialog menu
  parameter Modelica.SIunits.Time samplePeriod(start=0.01)
    "Period for sampling the raw random numbers"
    annotation(Dialog(enable=enableNoise));
  replaceable partial function distribution =
    Modelica_Noise.Math.Distributions.Interfaces.partialQuantile
    "Random number distribution"
    annotation(choicesAllMatching=true, Dialog(enable=enableNoise));

  // Advanced dialog menu: Noise generation
  parameter Boolean enableNoise = true "=true: y = noise, otherwise y = y_off"
    annotation(choices(checkBox=true),Dialog(tab="Advanced",group="Noise generation"));
  parameter Real y_off = 0.0
    "y = y_off if enableNoise=false (or time<startTime, see below)"
    annotation(Dialog(tab="Advanced",group="Noise generation"));

  // Advanced dialog menu: Initialization
  parameter Boolean useGlobalSeed = true
    "= true: use global seed, otherwise ignore it"
    annotation(choices(checkBox=true),Dialog(tab="Advanced",group = "Initialization",enable=enableNoise));
  parameter Boolean useAutomaticLocalSeed = true
    "= true: use automatic local seed, otherwise use fixedLocalSeed"
    annotation(choices(checkBox=true),Dialog(tab="Advanced",group = "Initialization",enable=enableNoise));
  parameter Integer fixedLocalSeed = 1 "Local seed (any Integer number)"
    annotation(Dialog(tab="Advanced",group = "Initialization",enable=enableNoise and not useAutomaticLocalSeed));
  parameter Modelica.SIunits.Time startTime = 0.0
    "Start time for sampling the raw random numbers"
    annotation(Dialog(tab="Advanced", group="Initialization",enable=enableNoise));

  // Advanced dialog menu: Random number properties
  replaceable package generator =
      Modelica_Noise.Math.Random.Generators.Xorshift128plus constrainedby
    Modelica_Noise.Math.Random.Interfaces.PartialGenerator
    "Random number generator"
    annotation(choicesAllMatching=true, Dialog(tab="Advanced",group="Random number generator",enable=enableNoise));

  discrete Integer localSeed "The actual localSeed";
equation
  when initial() then
    localSeed = if useAutomaticLocalSeed then globalSeed.randomInteger() else fixedLocalSeed;
  end when;

  // Retrieve values from outer global seed
protected
  outer Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    "Definition of global seed via inner/outer";
  parameter Integer actualGlobalSeed = if useGlobalSeed then globalSeed.seed else 0
    "The global seed, which is atually used";
  parameter Boolean generateNoise = enableNoise and globalSeed.enableNoise
    "= true if noise shall be generated, otherwise no noise";

  // Declare state and random number variables
  Integer state[generator.nState] "Internal state of random number generator";
  discrete Real r "Random number according to the desired distribution";
  discrete Real r_raw "Uniform random number in the range (0,1]";

initial equation
   pre(state) = generator.initialState(localSeed, actualGlobalSeed);
   r_raw = generator.random(pre(state));
   r = distribution(r_raw);

equation
  // Draw random number at sample times
  when generateNoise and sample(startTime, samplePeriod) then
    (r_raw, state) = generator.random(pre(state));
    r  = distribution(r_raw);
  end when;

  // Generate noise if requested
  y = if not generateNoise or time < startTime then y_off else r;

    annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
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
          textString="%y_off"),
        Text(visible=enableNoise and not useAutomaticLocalSeed,
          extent={{-98,-55},{98,-95}},
          lineColor={238,46,47},
          textString="%fixedLocalSeed")}),
    Documentation(info="<html>
<p>
A summary of the properties of the noise blocks is provided
in the documentation of package
<a href=\"modelica://Modelica_Noise.Blocks.Noise\">Blocks.Noise</a>.
This GenericNoise block generates reproducible, random noise at its output.
By default, two or more instances produce different, uncorrelated noise at the same time instant.
The block can only be used if on the same or a higher hierarchical level,
model <a href=\"modelica://Modelica_Noise.Blocks.Noise.GlobalSeed\">Blocks.Noise.GlobalSeed</a>
is dragged to provide global settings for all instances.
</p>


<h4>Parameters that need to be defined</h4>

<p>
When using this block, at a minimum the following parameters must be defined:
</p>

<blockquote>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Parameter</th>
    <th>Description</th></tr>

<tr><td> samplePeriod </td>
    <td> Random values are drawn periodically at the sample rate in [s]
         defined with this parameter (time events are generated at the sample instants). 
         Between sample instants, the output y is kept constant.</td></tr>

<tr><td> distribution </td>
    <td> Defines the random number distribution to map the drawn random numbers
         from the range 0.0 ... 1.0, to the desired range and distribution.
         Basically, <b>distribution</b> is a replaceable function that
         provides the quantile (= inverse cumulative distribution function) 
         of a random distribution. For simulation models 
         <a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions\">truncated distributions</a>
         are of special interest, because the returned random values are guaranteed
         to be in a defined band y_min ... y_max. Often used distributions are:
         <ul>
         <li> <a href=\"Modelica_Noise.Math.Distributions.Uniform\">Uniform distribution</a>: 
              The random values are mapped <b>uniformly</b> to the band
              y_min ... y_max.</li>
         <li> <a href=\"Modelica_Noise.Math.TruncatedDistributions.Normal\">Truncated normal distribution</a>:        
              The random values have a <b>normal</b> distribution that
              is truncated to y_min ... y_max. Measurement noise has often this distribution form.
              By default, the standard parameters of the normal distribution are derived from
              y_min ... y_max: mean value = (y_max + y_min)/2, standard deviation 
              = (y_max - y_min)/6 (= 99.7 % of the non-truncated normal distribution are 
              within y_min ... y_max).</li>
         </ul>
         </td></tr>
</table>
</p></blockquote>

<p>
As a simple demonstration, see example <a href=\"modelica://Modelica_Noise.Blocks.Examples.NoiseExamples.GenericNoise\">Blocks.Examples.NoiseExamples.GenericNoise</a>.
In the next diagram, a simulation result is shown for samplePeriod=0.02 s and uniform distribution with
y_min=-1, y_max=3:
</p>
<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/GenericNoise.png\">
</blockquote>
</p>

<h4>Advanced tab: General settings</h4>
<p>
In the <b>Advanced</b> tab of the parameter menu, further options can be set
as shown in the next table:
</p>

<blockquote>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Parameter</th>
    <th>Description</th></tr>

<tr><td> enableNoise </td>
    <td> = true, if noise is generated at the output of the block (this is the default).<br>
         = false, if noise generation is switched off and the constant value
         y_off is provided as output.</td></tr>
<tr><td> y_off </td>
    <td> If enableNoise = false, the output of the block instance has the
         value y_off. Default is y_off = 0.0.
         Furthermore, if enableNoise = true and time&lt;startTime, the output of the block is also
         y_off (see description of parameter startTime below).</td></tr>
</table>
</p></blockquote>



<h4>Advanced tab: Initialization</h4>

<p>
For every block instance, the internally used pseudo random number generator
has its own state. This state must be properly initialized, depending on 
the desired situation. For this purpose the following parameters can be defined:
</p>

<blockquote>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Parameter</th>
    <th>Description</th></tr>

<tr><td> useGlobalSeed </td>
    <td> = true, if the seed (= Integer number) defined in the \"inner GlobalSeed globalSeed\"
         component is used for the initialization of the random number generator used in this
         instance of block GenericNoise.
         Therefore, whenever the globalSeed defines a different number, the noise at every
         instance is changing. This is the default setting and therefore the globalSeed component
         defines whether every new simulation run shall provide the same noise 
         (e.g. for a parameter optimization of controller parameters), or
         whether every new simulation run shall provide different noise
         (e.g. for a Monte Carlo simulation).<br>
         = false, if the seed defined by globalSeed is ignored. For example, if
         aerodynamic turbulence is modelled with a noise block and this turbulence
         model shall be used for all simulation runs of a Monte Carlo simulation, then 
         useGlobalSeed has to be set to false.</td></tr>

<tr><td> useAutomaticLocalSeed </td>
    <td> An Integer number, called local seed, is needed to initalize the random number
         generator for a specific block instance. Instances using the same local seed
         produce exactly the same random number values (so the same noise, if the other settings
         of the instances are the same).<br>
         If <b>useAutomaticLocalSeed = true</b>, the
         local seed is determined automatically from an impure random number generator that
         produces Integer random values (= calling function globalSeed.randomInteger()).
         This is the default. 
         Note, this means that the noise might change if function randomInteger() is called
         more or less often in the overall model (e.g. because an additional noise block is 
         introduced or removed).<br>
         If <b>useAutomaticLocalSeed = false</b>, the local seed is defined
         explicitly by parameter fixedLocalSeed. It is then guaranteed that the generated noise
         remains always the same (provided the other parameter values are the same).</td></tr>

<tr><td> fixedLocalSeed </td>
    <td> If useAutomaticLocalSeed = false, the local seed to be used.
         fixedLocalSeed can be any Integer number (including zero or a negative number).
         The initialization algorithm produces a meaningful initial state of the random 
         number generator from fixedLocalSeed and (if useAutomaticGlobalSeed=true) from globalSeed even for
         bad seeds such as 0 or 1, so the subsequently drawing of random numbers produce always statistically
         meaningful numbers.</td></tr>

<tr><td> startTime </td>
    <td> The time instant at which noise shall be generated at the output y. The default
         startTime = 0.
         For time&lt;startTime, y = y_off. In some cases it is meaningful to simulate
         a certain duration until an approximate steady-state is reached. In such a case
         startTime should be set to a time instant after this duration.</td></tr>
</table>
</p></blockquote>

<h4>Advanced tab: Random number generator</h4>
<p>
The (pseudo) random number generator to be used is defined here. 
The default is random number generator algorithm \"xorshift128+\".
This random number generator has a period of 2^128, 
has an internal state of 4 Integer elements, and has
excellent statistical properties.
If the default algorithm is not desired, the
following parameter can be set:
</p>

<blockquote>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Parameter</th>
    <th>Description</th></tr>

<tr><td> generator </td>
    <td> Defines the pseudo random number generator to be used. This is
         a replaceable package. Meaningful random number generators are provided in 
         package <a href=\"modelica://Modelica_Noise.Math.Random.Generators\">Math.Random.Generators</a>. 
         Properties of the various generators are described in the package
         description of the Generators package.</td></tr>
</table>
</p></blockquote>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> June 22, 2015 </td>
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
end GenericNoise;
