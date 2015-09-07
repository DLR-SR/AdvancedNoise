within AdvancedNoise.Examples;
model Derivatives "Tests derivatives of the random numbers"
  extends Modelica.Icons.Example;
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Sources.TimeBasedNoise uniformLinear(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation = Interpolators.Linear)
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Sources.TimeBasedNoise uniformSmooth(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation = Interpolators.SmoothIdealLowPass)
    annotation (Placement(transformation(extent={{-20,70},{0,90}})));
  Sources.TimeBasedNoise normalLinear(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation = Interpolators.Linear)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Sources.TimeBasedNoise normalSmooth(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation = Interpolators.SmoothIdealLowPass)
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Sources.TimeBasedNoise weibullLinear(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation = Interpolators.Linear)
    annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
  Sources.TimeBasedNoise weibullSmooth(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation = Interpolators.SmoothIdealLowPass)
    annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  Sources.SignalBasedNoise uniformLinear1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation =
        Interpolators.Linear,
    useTime=false)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Sources.SignalBasedNoise uniformSmooth1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation =
        Interpolators.SmoothIdealLowPass,
    useTime=false)
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Sources.SignalBasedNoise normalLinear1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation =
        Interpolators.Linear,
    useTime=false)
    annotation (Placement(transformation(extent={{-60,-70},{-40,-50}})));
  Sources.SignalBasedNoise normalSmooth1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation =
        Interpolators.SmoothIdealLowPass,
    useTime=false)
    annotation (Placement(transformation(extent={{0,-70},{20,-50}})));
  Sources.SignalBasedNoise weibullLinear1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation =
        Interpolators.Linear,
    useTime=false)
    annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
  Sources.SignalBasedNoise weibullSmooth1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.Distributions.Uniform.quantile,
    redeclare package interpolation =
        Interpolators.SmoothIdealLowPass,
    useTime=false)
    annotation (Placement(transformation(extent={{0,-100},{20,-80}})));
  Modelica.Blocks.Sources.Sine sine(freqHz=0.3)
    annotation (Placement(transformation(extent={{-96,-20},{-76,0}})));
  Modelica.Blocks.Continuous.Der der1
    annotation (Placement(transformation(extent={{-32,16},{-24,24}})));
  Modelica.Blocks.Continuous.Der der2
    annotation (Placement(transformation(extent={{-32,46},{-24,54}})));
  Modelica.Blocks.Continuous.Der der3
    annotation (Placement(transformation(extent={{-32,76},{-24,84}})));
  Modelica.Blocks.Continuous.Der der4
    annotation (Placement(transformation(extent={{8,76},{16,84}})));
  Modelica.Blocks.Continuous.Der der5
    annotation (Placement(transformation(extent={{8,46},{16,54}})));
  Modelica.Blocks.Continuous.Der der6
    annotation (Placement(transformation(extent={{8,16},{16,24}})));
  Modelica.Blocks.Continuous.Der der7
    annotation (Placement(transformation(extent={{-34,-34},{-26,-26}})));
  Modelica.Blocks.Continuous.Der der8
    annotation (Placement(transformation(extent={{-34,-64},{-26,-56}})));
  Modelica.Blocks.Continuous.Der der9
    annotation (Placement(transformation(extent={{-34,-94},{-26,-86}})));
  Modelica.Blocks.Continuous.Der der10
    annotation (Placement(transformation(extent={{26,-34},{34,-26}})));
  Modelica.Blocks.Continuous.Der der11
    annotation (Placement(transformation(extent={{26,-64},{34,-56}})));
  Modelica.Blocks.Continuous.Der der12
    annotation (Placement(transformation(extent={{26,-94},{34,-86}})));
equation
  connect(sine.y, uniformLinear1.u) annotation (Line(
      points={{-75,-10},{-70,-10},{-70,-30},{-62,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, normalLinear1.u) annotation (Line(
      points={{-75,-10},{-70,-10},{-70,-60},{-62,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, weibullLinear1.u) annotation (Line(
      points={{-75,-10},{-70,-10},{-70,-90},{-62,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, uniformSmooth1.u) annotation (Line(
      points={{-75,-10},{-20,-10},{-20,-30},{-2,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, normalSmooth1.u) annotation (Line(
      points={{-75,-10},{-20,-10},{-20,-60},{-2,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, weibullSmooth1.u) annotation (Line(
      points={{-75,-10},{-20,-10},{-20,-90},{-2,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weibullLinear.y, der1.u) annotation (Line(
      points={{-39,20},{-32.8,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalLinear.y, der2.u) annotation (Line(
      points={{-39,50},{-32.8,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uniformLinear.y, der3.u) annotation (Line(
      points={{-39,80},{-32.8,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uniformSmooth.y, der4.u) annotation (Line(
      points={{1,80},{7.2,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalSmooth.y, der5.u) annotation (Line(
      points={{1,50},{7.2,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weibullSmooth.y, der6.u) annotation (Line(
      points={{1,20},{7.2,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uniformLinear1.y, der7.u) annotation (Line(
      points={{-39,-30},{-34.8,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalLinear1.y, der8.u) annotation (Line(
      points={{-39,-60},{-34.8,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weibullLinear1.y, der9.u) annotation (Line(
      points={{-39,-90},{-34.8,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uniformSmooth1.y, der10.u) annotation (Line(
      points={{21,-30},{25.2,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalSmooth1.y, der11.u) annotation (Line(
      points={{21,-60},{25.2,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weibullSmooth1.y, der12.u) annotation (Line(
      points={{21,-90},{25.2,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Documentation(revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>", info="<html>
<p>This example demonstrates that when a linear of smooth (sinc) interpolation is used, the noise is differentiable.</p>
</html>"));
end Derivatives;
