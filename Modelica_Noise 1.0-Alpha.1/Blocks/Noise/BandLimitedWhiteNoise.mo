within Modelica_Noise.Blocks.Noise;
block BandLimitedWhiteNoise
  "A block to produce band-limited white noise with normal distribution"
  extends TimeBasedNoise(
    final sampleFactor = 1,
    final y_min = -Modelica.Constants.inf,
    final y_max = +Modelica.Constants.inf,
    redeclare package generator =
      Modelica_Noise.Math.Random.Generators.Xorshift128plus,
    redeclare function distribution =
      Modelica_Noise.Math.TruncatedDistributions.Normal.quantile(mu =    0,
                                                                 sigma = sqrt(noisePower)/sqrt(samplePeriod)),
    redeclare package interpolation =
      Modelica_Noise.Math.Random.Utilities.Interpolators.Constant);

  parameter Real noisePower = 1 "Power of white noise signal";
  annotation (Documentation(info="<html>
<p>This block configures the <a href=\"TimeBasedNoise\">TimeBasedNoise</a> block to produce band-limited white noise. The advanced noise properties are therfore fixed to the follwing:</p>
<ul>
<li>The <b>random number generator</b> is fixed to xorshift128+.</li>
<li>The <b>probability distribution</b> is fixed to a normal distribution.</li>
<li>The <b>interpolation method</b> is fixed to piece-wise constant. This also enforces sampling of the signal.</li>
</ul>
<p>In order for this block to produce meaningful results, you should set the following parameters:</p>
<ul>
<li>The <b>samplePeriod</b> of the block should be much faster (say by a factor of 100) than the fastest dynamics of the system fed by the block&apos;s outputs. </li>
<li>The <b>noisePower</b> of the signal should be set to the expected power of the white noise. Ideal white noise has infinitely high power. It thus usually does not occur in physical systems. Since many system models assume a noise power of 1, this preset may be a reasonable first choice.</li>
</ul>
</html>"));
end BandLimitedWhiteNoise;
