within AdvancedNoise.Examples;
model SignalBasedInterpolation
  "Demonstrates signal-based noise with different interpolations"
  import Modelica;
  extends Modelica.Icons.Example;
  parameter Real startTime = 0.5;
  parameter Real y_off = -1.0;
  constant Real pi = Modelica.Constants.pi "Constant pi";

  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false, enableNoise=true)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  AdvancedNoise.Sources.SignalBasedNoise constantNoise(
    redeclare package interpolation = Interpolators.Constant,
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    useTime=false,
    redeclare function distribution =
        Modelica.Math.Distributions.Uniform.quantile (y_min=-1, y_max=1))
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Modelica.Blocks.Sources.RealExpression signal(y=sin(pi*time))
    annotation (Placement(transformation(extent={{-100,70},{-80,90}})));
  AdvancedNoise.Sources.SignalBasedNoise linearNoise(
    useTime=false,
    redeclare package interpolation = Interpolators.Linear,
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    redeclare function distribution =
        Modelica.Math.Distributions.Uniform.quantile (y_min=-1, y_max=1))
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  AdvancedNoise.Sources.SignalBasedNoise smoothNoise(
    useTime=false,
    useAutomaticLocalSeed=false,
    redeclare package interpolation = Interpolators.SmoothIdealLowPass,
    samplePeriod=0.1,
    redeclare function distribution =
        Modelica.Math.Distributions.Uniform.quantile (y_min=-1, y_max=1))
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
equation
  connect(signal.y, constantNoise.u) annotation (Line(
      points={{-79,80},{-62,80}},
      color={0,0,127}));
  connect(linearNoise.u, signal.y) annotation (Line(
      points={{-62,30},{-72,30},{-72,80},{-79,80}},
      color={0,0,127}));
  connect(smoothNoise.u, signal.y) annotation (Line(
      points={{-62,-20},{-72,-20},{-72,80},{-79,80}},
      color={0,0,127}));
 annotation (experiment(StopTime=2),    Documentation(info="<html>
<p>
This example demonstrates the
<a href=\"modelica://Modelica.Blocks.Noise.SignalBasedNoise\">Blocks.Noise.SignalBasedNoise</a>
block by using various interpolation methods. The input to the blocks is a sine and
the argument of the sine, as well as the sample periods of the blocks are selected in such a way
that a sample instant hits the sine for every full period.
Therefore, the noise is repeated after every full period of the sine.
The result of a simulation is show in the next diagram, plotting the (noise) output of the
blocks over the sine output:
</p>

<blockquote>
<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/SignalInterpolation.png\">
</blockquote>
</html>", revisions="<html>
<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
</td><td valign=\"bottom\">
         <b>Copyright</b> <b>&copy; DLR Institute of System Dynamics and Control</b><br>
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</html>"));
end SignalBasedInterpolation;
