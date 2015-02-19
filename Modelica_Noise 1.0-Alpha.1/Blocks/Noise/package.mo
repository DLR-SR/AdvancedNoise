within Modelica_Noise.Blocks;
package Noise "Library of noise blocks"
  extends Modelica.Icons.Package;


  annotation (Icon(graphics={Line(
      points={{-84,0},{-54,0},{-54,40},{-24,40},{-24,-70},{6,-70},{6,80},
          {36,80},{36,-20},{66,-20},{66,60}},
      color={0,0,0},
      smooth=Smooth.None)}), Documentation(info="<html>
<p>This sublibrary contains blocks that generate <b>reproducible noise</b> with pseudo random numbers in an <b>efficient</b> way. Reproducibility is important when designing control systems, either manually or with optimization methods (for example when changing a parameter or a component of a control system and re-simulating, it is important that the noise does not change, because otherwise it is hard to determine whether the changed control system or the differently computed noise has changed the behaviour of the controlled system). Typical noise blocks slow down simulations, say, by a factor of 10 .. 100. This is different with the blocks of this sublibrary: The default setting utilizes a new method that only slightly reduces simulation efficiency, provided the selected relative tolerance is not too strict (say &ge; 10<sup>-6</sup>) and the control system is designed to reduce the effect of noise with a low pass behaviour (which is one of the tasks of most real control systemss). </p>
<p><b>Global Options</b> </p>
<p>When using one of the blocks of this sublibrary, on the same or a higher level, block <a href=\"Modelica_Noise.Blocks.Noise.GlobalSeed\">Noise.GlobalSeed</a> must be dragged resulting in a declaration </p>
<p><code>   <b>inner</b> Noise.GlobalSeed globalSeed;</code> </p>
<p>This block is used to define global options that hold for all Noise block instances (such as a global seed for initializing the random number generators, and a flag to switch off noise). </p>
<p><b>Reproducible Noise</b> </p>
<p>In the following table the different ways are summarized to define reproducible noise with the blocks of this sublibrary: </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Name</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td><p>TimeBasedNoise </p></td>
<td><p>The random values provided at the output of a TimeBasedNoise instance depend (a) on the <b>actual time</b> instant, (b) on the instance name, and (c) on the settings of the respective instance (as well as the seetings in globalSeed, see above). By default, two or more instances produce different, uncorrelated noise at the same time instant.</p></td>
</tr>
<tr>
<td><p>SignalBasedNoise </p></td>
<td><p>The random values provided at the output of a SignalBasedNoise instance depend (a) on the <b>actual value of the input</b> signal, (b) on the instance name, and (c) on the settings of the respective instance (as well as the seetings in globalSeed, see above). By default, two or more instances produce different, uncorrelated noise at the same value of the input signal. The default input signal is &QUOT;time&QUOT;, and then the behavior of a SignalBasedNoise instance is similar to a TimeBasedNoise instance. </p></td>
</tr>
<tr>
<td><p>globalSeed.random() </p></td>
<td><p>Function random() is defined inside the globalSeed component. On a lower hierarchical level, the function can be called via an outer globalSeed declaration. For every call of this function, a new random value is returned. Since this is an impure function, it can only be called in a when-clause, so at an event instant. This is a more traditional random number generator in the seldom cases where it is needed to implement a special block. The drawback of this function is that even small changes of a model may change the sequence of the random() calls and then reproducibility is lost.</p></td>
</tr>
</table>
<p><br><b>Random Number Generators</b> </p>
<p>The core of the noise generation is the computation of uniform random numbers in the range 0.0 .. 1.0 (and these random numbers are transformed afterwards, see below). This sublibrary uses the xorshift random number generation suite developed in 2014 by Sebastiano Vigna. These random number generators have excellent statistical properties, produce quickly statistically relevant random numbers, even if starting from a bad initial seed, and have a reasonable length of the internal state vector of 2, 4, and 33 Integer elements. The short length state vectors are especially useful if every block instance has its own internal state vector, as needed for reproducible noise blocks.The random number generator with a length of 33 Integer elements is suited even for massively parallel simulations where every simulation computes a large number of random values. More details of the random number generators are described in the documentation of package <a href=\"Modelica_Noise.Math.Random.Generators\">Math.Random.Generators</a>. The blocks in this sublibrary allow to select the desired generator, but also user-defined generators. </p>
<p><b>Truncated Distributions</b> </p>
<p>The uniform random numbers in the range 0.0 .. 1.0 are transformed to a desired band and random number distribution by selecting an appropriate <b>truncated distribution</b>. For an example of a truncated distribution, see the following diagram of the probability density function of a normal distribution compared with its truncated version: </p>
<blockquote><img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.density.png\"/> </blockquote>
<p>The corresponding inverse cumulative distribution functions are shown in the next diagram: </p>
<blockquote><img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.quantile.png\"/> </blockquote>
<p>When providing an x-value between 0.0 .. 1.0 from a random number generator, then the truncated cumulative probability density function of a normal distribution transforms this value into the desired band (in the diagram above to the range: -1.5 .. 1.5). Contrary to a standard distribution, truncated distributions have the advantage that the resulting random values are guaranteed to be in the defined band (whereas a standard normal distribution might also result in very large values, say, 1e60, which could be very problematic in a simulation). More details of truncated distributions are given in the documentation of package <a href=\"Modelica_Noise.Math.TruncatedDistributions\">Math.TruncatedDistributions</a>. In the blocks of this sublibrary, the desired truncated disribution can be selected, but also a user-defined distribution. </p>
<p><b>Efficient Simulation by Event-Free Interpolation</b> </p>
<p>Efficient simulation of noise blocks is reached in different ways by the blocks. However, the basic idea is the same: </p>
<ul>
<li>Random numbers are drawn at a regular grid (grid over time or over the input signal).</li>
<li>The drawn random numbers can be interpolated with different methods.</li>
<li>If a constant interpolation method is selected between grid points, events are generated at the grid points and simulation will be slow, but according to the traditional approach. </li>
<li>If a continuous interpolation method is selected (for example linear interpolation of the grid points), then basically no events are generated. Experience shows that simulation can then be much faster. </li>
</ul>
<p>An example is shown in the next figure, where random numbers are drawn periodically every 0.1 s. When using a constant interpolation, an event is generated at every grid point. When using linear or smooth interpolation, no events are generated. </p>
<blockquote><img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/Interpolation1.png\"/> </blockquote>
<p>Other properties of the interpolation are demonstrated in example <a href=\"Modelica_Noise.Blocks.Examples.NoiseExamples.Interpolation\">NoiseExamples.Interpolation </a>and in the article </p>
<blockquote>v.d.Linden F.L.J, A. Kl&ouml;ckner, D. Zimmer (2015): <b>Effects of Event-Free Noise Signals on Continuous-Time Simulation Perfomance</b>. MathMod&apos;2015 Conference. </blockquote>
<p>The effect of interpolated, event-free noise signals is analyzed at hand of several examples, different integration methods and relative tolerances. A typical result is shown in the next diagram (a Noise block is used as input to a low pass filter of order 50) using the DASSL integrator: </p>
<blockquote><img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/EventEffect.png\"/> </blockquote>
<p>The selected relative tolerance is used as x-axis, whereas the number of evaluations of the model is shown at the y-axis (and is an indicator of the simulation efficiency). The dashed lines are the result of constant, linear, and sinc interpolation where an event is generated at every grid point. Solid lines represent simulations where no event is generated at grid points. As can be seen, the number of function evaluations can be considerably smaller with event-free noise if not too tight relative tolerances are selected. Practical experience with real-world models show that event-free noise can considerably reduce simulation time. </p>
<p>One approach to implement event-free noise is described in the article </p>
<blockquote>Kl&ouml;ckner A., v.d. Linden F.L.J., and Zimmer D. (2014). <b>Noise Generation for Continuous System Simulation</b>. In Proceedings of the 10th International Modelica Conference, Lund, Sweden. </blockquote>
<p>This approach is used by the SignalBasedNoise block: The value of the input signal is used as seed, and whenever a random number shall be drawn, the random number generator is newly initialized with this seed (this is possible because the xorshift generators generate statistically relevant random numbers already after drawing only a few random numbers. Whenever a random number is required, random numbers are newly drawn at the defined grid and then interpolated for the desired input signal value. </p>
<p>A slightly different approach is used by the TimeBasedNoise block: Time events are generated at a few underlying grid points and an internal buffer of a desired size (say 100 elements) is filled with random numbers between such grid points. For the duration represented by the buffer, no time events are generated and the output of the block is computed by interpolation in the buffer. </p>
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
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end Noise;
