within Noise.Examples;
model Derivatives "Tests derivatives of the random numbers"
  extends Modelica.Icons.Example;
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise uniformLinear(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Linear)
    annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise uniformSmooth(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass)
    annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise normalLinear(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Linear)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise normalSmooth(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise weibullLinear(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Linear)
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  Modelica_Noise.Blocks.Noise.TimeBasedNoise weibullSmooth(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass)
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise uniformLinear1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Linear,
    useTime=false)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise uniformSmooth1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass,
    useTime=false)
    annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise normalLinear1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Linear,
    useTime=false)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise normalSmooth1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass,
    useTime=false)
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise weibullLinear1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.Linear,
    useTime=false)
    annotation (Placement(transformation(extent={{20,-90},{40,-70}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise weibullSmooth1(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Uniform.quantile,
    redeclare package interpolation =
        Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass,
    useTime=false)
    annotation (Placement(transformation(extent={{60,-90},{80,-70}})));
  Modelica.Blocks.Sources.Sine sine(freqHz=0.3)
    annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
  Modelica.Blocks.Continuous.Der der1
    annotation (Placement(transformation(extent={{-52,16},{-44,24}})));
  Modelica.Blocks.Continuous.Der der2
    annotation (Placement(transformation(extent={{-52,46},{-44,54}})));
  Modelica.Blocks.Continuous.Der der3
    annotation (Placement(transformation(extent={{-52,76},{-44,84}})));
  Modelica.Blocks.Continuous.Der der4
    annotation (Placement(transformation(extent={{-12,76},{-4,84}})));
  Modelica.Blocks.Continuous.Der der5
    annotation (Placement(transformation(extent={{-12,46},{-4,54}})));
  Modelica.Blocks.Continuous.Der der6
    annotation (Placement(transformation(extent={{-12,16},{-4,24}})));
  Modelica.Blocks.Continuous.Der der7
    annotation (Placement(transformation(extent={{46,-24},{54,-16}})));
  Modelica.Blocks.Continuous.Der der8
    annotation (Placement(transformation(extent={{46,-54},{54,-46}})));
  Modelica.Blocks.Continuous.Der der9
    annotation (Placement(transformation(extent={{46,-84},{54,-76}})));
  Modelica.Blocks.Continuous.Der der10
    annotation (Placement(transformation(extent={{86,-24},{94,-16}})));
  Modelica.Blocks.Continuous.Der der11
    annotation (Placement(transformation(extent={{86,-54},{94,-46}})));
  Modelica.Blocks.Continuous.Der der12
    annotation (Placement(transformation(extent={{86,-84},{94,-76}})));
equation
  connect(sine.y, uniformLinear1.u) annotation (Line(
      points={{5,0},{10,0},{10,-20},{18,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, normalLinear1.u) annotation (Line(
      points={{5,0},{10,0},{10,-50},{18,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, weibullLinear1.u) annotation (Line(
      points={{5,0},{10,0},{10,-80},{18,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, uniformSmooth1.u) annotation (Line(
      points={{5,0},{50,0},{50,-20},{58,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, normalSmooth1.u) annotation (Line(
      points={{5,0},{50,0},{50,-50},{58,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, weibullSmooth1.u) annotation (Line(
      points={{5,0},{50,0},{50,-80},{58,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weibullLinear.y, der1.u) annotation (Line(
      points={{-59,20},{-52.8,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalLinear.y, der2.u) annotation (Line(
      points={{-59,50},{-52.8,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uniformLinear.y, der3.u) annotation (Line(
      points={{-59,80},{-52.8,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uniformSmooth.y, der4.u) annotation (Line(
      points={{-19,80},{-12.8,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalSmooth.y, der5.u) annotation (Line(
      points={{-19,50},{-12.8,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weibullSmooth.y, der6.u) annotation (Line(
      points={{-19,20},{-12.8,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uniformLinear1.y, der7.u) annotation (Line(
      points={{41,-20},{45.2,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalLinear1.y, der8.u) annotation (Line(
      points={{41,-50},{45.2,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weibullLinear1.y, der9.u) annotation (Line(
      points={{41,-80},{45.2,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uniformSmooth1.y, der10.u) annotation (Line(
      points={{81,-20},{85.2,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(normalSmooth1.y, der11.u) annotation (Line(
      points={{81,-50},{85.2,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weibullSmooth1.y, der12.u) annotation (Line(
      points={{81,-80},{85.2,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Derivatives;
