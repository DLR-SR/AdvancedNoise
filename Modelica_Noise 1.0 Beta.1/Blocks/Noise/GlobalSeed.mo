within Modelica_Noise.Blocks.Noise;
model GlobalSeed
  "Defines global settings for the blocks of sublibrary Noise, especially a global seed value is defined"
  parameter Boolean enableNoise = true
    "= true, if noise blocks generate noise as output; = false, if they generate a constant output"
    annotation(choices(checkBox=true));
  parameter Boolean useAutomaticSeed = false
    "= true, choose a seed by system time and process id; = false, use fixedSeed"
    annotation(choices(checkBox=true));
  parameter Integer fixedSeed = 67867967
    "Fixed global seed for random number generators (if useAutomaticSeed = false)"
      annotation(Dialog(enable=not useAutomaticSeed));
  final parameter Integer seed = if useAutomaticSeed then
                                    Modelica_Noise.Math.Random.Utilities.automaticGlobalSeed()
                                  else fixedSeed "Actually used global seed";
  function random = Modelica_Noise.Math.Random.Utilities.impureRandom(final id=id_impure)
    "Impure random number generator function";
  function randomInteger =
      Modelica_Noise.Math.Random.Utilities.impureRandomInteger(final id=id_impure)
    "Impure Integer random number generator function";

protected
  parameter Integer id_impure = Modelica_Noise.Math.Random.Utilities.initializeImpureRandom(seed);

  annotation (
    defaultComponentName="globalSeed",
    defaultComponentPrefixes="inner",
    missingInnerMessage="
Your model is using an outer \"globalSeed\" component but
an inner \"globalSeed\" component is not defined and therefore
a default inner \"globalSeed\" component is introduced by the tool.
To change the default setting, drag Noise.GlobalSeed
into your model and specify the seed.
",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                         graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                                        Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255}),
        Line(visible = enableNoise,
             points={{-73,-15},{-59,-15},{-59,1},{-51,1},{-51,-47},{-43,-47},{-43,
              -25},{-35,-25},{-35,59},{-27,59},{-27,27},{-27,27},{-27,-33},{-17,-33},{-17,-15},{-7,-15},{-7,-43},{3,
              -43},{3,39},{9,39},{9,53},{15,53},{15,-3},{25,-3},{25,9},{31,9},{31,
              -21},{41,-21},{41,51},{51,51},{51,17},{59,17},{59,-49},{69,-49}},
            color={215,215,215}),
        Text(visible=enableNoise and not useAutomaticSeed,
          extent={{-90,-4},{88,-30}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%fixedSeed"),
        Line(visible = not enableNoise,
          points={{-80,-4},{84,-4}},
          color={215,215,215}),
        Text(visible=enableNoise and not useAutomaticSeed,
          extent={{-84,34},{94,8}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="fixedSeed =")}),
    Documentation(revisions="<html>
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
</html>", info="<html>
<p>
When using one of the blocks of sublibrary <a href=\"modelica://Modelica_Noise.Blocks.Noise\">Noise</a>,
on the same or a higher hierarchical level, Noise.GlobalSeed
must be dragged resulting in a declaration
</p>

<pre>
   <b>inner</b> Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed;
</pre>

<p>
The GlobalSeed block provides global options for all Noise blocks of the same or a lower
hierarchical level. The following options can be selected:
</p>

<blockquote>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Icon</th>
    <th>Description</th></tr>

<tr><td> <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/GlobalSeed_FixedSeed.png\"> </td>
    <td> <b>useAutomaticSeed=false</b> (= default):<br>
         A fixed global seed is defined with Integer parameter fixedSeed. The value of fixedSeed
         is displayed in the icon. By default all Noise blocks use fixedSeed for initialization of their
         pseudo random number generators, in combination with a local seed defined for every instance
         separately. Therefore, whenever a simulation is performed with the
         same fixedSeed exactly the same noise is generated in all instances of the Noise
         blocks (provided the settings of these blocks are not changed as well).<br>
         This option can be used (a) to design a control system (e.g. by parameter optimization) and keep the same
         noise for all simulations, or (b) perform Monte Carlo Simulations where
         fixedSeed is changed from the environment for every simulation, in order to
         produce different noise at every simulation run.</td></tr>

<tr><td> <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/GlobalSeed_AutomaticSeed.png\"> </td>
    <td> <b>useAutomaticSeed=true</b>:<br>
         An automatic global seed is computed by using the ID of the process in which the
         simulation takes place and the current local time. As a result, the global seed
         is changed automatically for every new simulation, including parallelized
         simulation runs. This option can be used to perform Monte Carlo Simulations
         with minimal effort (just performing many simulation runs) where
         every simulation run uses a different noise.</td></tr>


<tr><td> <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/GlobalSeed_NoNoise.png\"> </td>
    <td> <b>enableNoise=false</b>:<br>
         The noise in all Noise instances is switched off and the blocks output a constant
         signal all the time (usually zero). This option is useful, if a model shall be
         tested without noise and the noise shall be quickly turned off or on.</td></tr>
</table>
</p></blockquote>

<p>
Additionally, the globalSeed instance provides the following impure functions
</p>

<ul>
<li> <b>random</b>():<br>
     This function uses the <a href=\"modelica://Modelica_Noise.Math.Random.Generators.Xorshift1024star\">xorshift1024*</a>
     pseudo random number generator to produce random numbers in the range 0 &lt; random numbers &le; 1.
     It is initialized with the global seed defined in globalSeed
     (so either with parameter fixedSeed, or automatically computed by process ID and local time).
     Since random() is an impure function, it should only be called in a when-clause (so at an event).</li>
<li> <b>randomInteger</b>(imin=1,imax=Modelica.Constants.Integer_inf):<br>
     This function uses the random() pseudo random number generator and maps the returned random value
     into the Integer range imin ... imax. By default, imin=1 and imax=Modelica.Constants.Integer_inf.
     Since randomInteger() is an impure function, it should only be called in a when-clause
     (so at an event).</li>
</ul>

<p>
Note, the usage of this block is demonstrated with examples
<a href=\"modelica://Modelica_Noise.Blocks.Examples.NoiseExamples.AutomaticSeed\">AutomaticSeed</a> and
<a href=\"modelica://Modelica_Noise.Blocks.Examples.NoiseExamples.ImpureGenerator\">ImpureGenerator</a>.
</p>

<p>
Remark: The \"xorshift1024\" pseudo-random number generator has an internal state of 33 Integers.
This state is initialized in the following way: The pseudo-random number generator
<a href=\"modelica://Modelica_Noise.Math.Random.Generators.Xorshift64star\">Xorshift64star</a>
is used to compute these 33 Integers. This random number generator has a state of 2 Integers which
is initialized with the global and local seed integers. Afterwards, random values are produced
with this random number generator and utilized as values for the internal state of
the Xorshift1024star random number generator.
</p>
</html>"));
end GlobalSeed;
