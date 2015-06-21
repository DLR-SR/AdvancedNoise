within Modelica_Noise.Blocks.Noise;
block BandLimitedWhiteNoise
  "Noise generator to produce band-limited white noise with normal distribution"
  extends GenericNoise(
    redeclare function distribution =
      Modelica_Noise.Math.Distributions.Normal.quantile(mu =    0,
                                                        sigma = sqrt(noisePower/samplePeriod)));
  parameter Real noisePower = 1 "Power of white noise signal";
  annotation (Documentation(info="<html>
<p>
This block configures the <a href=\"GenericNoise\">GenericNoise</a> block to produce 
band-limited white noise. This is performed by using a normal distribution with mu=0 and
sigma = sqrt(noisePower/samplePeriod).
</p>

<p>
In order for this block to produce meaningful results, you should set the following
parameters:
</p>

<ul>
<li> The <b>samplePeriod</b> of the block should be much faster (say by a factor of 100) 
     than the fastest dynamics of the system fed by the block&apos;s outputs. </li>
<li> The <b>noisePower</b> of the signal should be set to the expected power per frequency
     of the white noise. Since many system models assume a noise power of 1,
     this preset may be a reasonable first choice (= defautl).</li>
</ul>

<h4>About sampling frequencies</h4>

<p>
Ideal white noise contains all frequencies, including infinitely high ones.
However, these usually cannot be observed in physical systems, since all physical system in
one way or the other contain low-pass filters. It is thus sufficient to generate a
limited range of frequency content in the noise signal, as long as it exceeds the frequencies of
the subsequent dynamics by a suffiently high factor (of e.g. 100).
</p>

<h4>About noise power</h4>

<p>
Ideal white noise has a flat, i.e. constant, power spectral density for all frequencies.
It has thus infinitely high power, because the total power of a signal be obtained by
integrating the power spectral density over all frequencies. The following three ways to
think of the power of a signal may be helpful:
</p>

<ul>
<li> The energy of a signal is the integral of its squared absolute value over time.
     The signal&apos;s power is this integral divided by the time span of the integral.</li>
<li> The total power of a signal can also be obtained by integrating its (twosided)
     power spectral density over all frequencies.</li>
<li> The total power of a signal is finally also equal to its variance.</li>
</ul>

<p>
In order to set the correct level of the band-limited white noise power spectral density,
the variance of its normal distribtution can thus be influenced directly.
Recalling that the samplePeriod of the noise signal generates frequency content in the
range &plusmn;0.5/samplePeriod, the variance must be increased to generate sufficient
total signal power. The total power must match the product of the noisePower and its
frequency bandwidth 1/samplePeriod: <code>signal power = signal variance = noisePower / samplePeriod</code>.
</p>

<p>
Example <a href=\"Modelica_Noise.Blocks.Examples.NoiseExamples.DrydenContinuousTurbulence\">NoiseExamples.DrydenContinuousTurbulence</a>
demonstrates how to utilize this block to model wind gust.
</p>
</html>"));
end BandLimitedWhiteNoise;
