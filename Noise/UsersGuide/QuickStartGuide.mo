within Noise.UsersGuide;
model QuickStartGuide "Quick Start Guide"
extends Modelica.Icons.Information;
equation

  annotation (Documentation(info="<html>
<p>To model a noise source in using this library, the u the block <a href=\"Noise.PRNG\">Noise.PRNG</a> has to be selected. properly parametrizing this block is done on two levels: easy and advanced:</p>
<h4><span style=\"color:#008000\">Easy Noise</span></h4>
<p>Select a (Pseudo-) Sampling time for the block. This limits the bandwith of the block to 1/sampling time. A constant spectral density will be used. This type of noise will be good for standard sensor noise.</p>
<h4><span style=\"color:#008000\">Advanced Noise</span></h4>
<p>To select more advanced noise methods with a defined Probability Density Function to define the distribution of the generated random values, the &QUOT;Advanced&QUOT; Tab has to be selected. The user can select a wide range of distributions:</p>
<ul>
<li>Uniform</li>
<li>Normal distribution</li>
<li>Couchy-Lorenz distribution</li>
<li>Weibull distribution</li>
<li>Irwin-Hall distributiuon</li>
<li>Bates distribution - Suitable for mean-filtered noise signals</li>
<li>Discrete distribution - Suitable for Spike noise</li>
</ul>
<p><br>Furthermore the Power Spectral Density can be set to specify the frequency characteristics of the signal. Following methods are supplied:</p>
<ul>
<li>Unmodified white noise with constant power spectral density</li>
<li>low pass filtered noise</li>
<li>linear interpolation between noise samples</li>
<li>interpolation using convulution with a Kernel</li>
<li>filter by convulution with a impulse response</li>
</ul>
<p>Using the modular approach of the fuctions, it is possible for the user to develop and select their own kernals for specialized frequency responses.</p>
<p><br>For more information, please also see <a href=\"Noise.PRNG.SampleBasedRNG\">Noise.PRNG.SampleBasedRNG</a>: </p>
</html>",
        revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end QuickStartGuide;
