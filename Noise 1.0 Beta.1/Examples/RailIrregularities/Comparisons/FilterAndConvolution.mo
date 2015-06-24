within Noise.Examples.RailIrregularities.Comparisons;
model FilterAndConvolution
  "Compares implementation with filter and convolution"
  extends Modelica.Icons.Example;

  constant Real convolutionResolution=MinimumPhaseInterpolator.T[2] -
      MinimumPhaseInterpolator.T[1];

  parameter Boolean doMinimum = true "Calculate minimum phase filter?";
  parameter Boolean doZero =    false "Calculate zero phase filter?";
  parameter Boolean doFilter =  true "Calculate state space phase filter?";
  parameter Boolean doTime =    false "Calculate time-based noise?";

  parameter Modelica.SIunits.Duration samplePeriod = 0.1 "Common sample period";

  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
               annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Sources.SignalBasedNoise spaceDomainNoiseMinimum(
    useTime=false,
    redeclare package interpolation =
        Noise.Examples.RailIrregularities.MinimumPhaseInterpolator,
    samplePeriod=0.4,
    y_min=-1e10,
    y_max=+1e10,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Normal.quantile (mu=0, sigma=
           sqrt(0.5)/sqrt(samplePeriod)),
    useAutomaticLocalSeed=false) if doMinimum
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));

  Modelica.Blocks.Continuous.Integrator position(y_start=123)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Sources.Constant velocity(k=100)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Continuous.TransferFunction spaceDomainFilter(b={2.7542724e-04,
        4.5134777e-03} ./ {velocity.k,1}, a={1.0000000e+00,3.0670519e+00,2.2183340e-01}
         ./ {velocity.k^2,velocity.k,1}) if doFilter
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Sources.SignalBasedNoise spaceDomainNoiseWhite(
    useTime=false,
    y_min=-1e10,
    y_max=+1e10,
    useAutomaticLocalSeed=false,
    samplePeriod=samplePeriod,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Normal.quantile (mu=0, sigma=
           sqrt(0.5)/sqrt(samplePeriod))) if doFilter
    annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  Sources.SignalBasedNoise spaceDomainNoiseZero(
    useTime=false,
    y_min=-1e10,
    y_max=+1e10,
    useAutomaticLocalSeed=false,
    samplePeriod=samplePeriod,
    redeclare package interpolation =
        Noise.Examples.RailIrregularities.ZeroPhaseInterpolator,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Normal.quantile (mu=0, sigma=
           sqrt(0.5)/sqrt(samplePeriod))) if doZero
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  Modelica.Blocks.Continuous.TransferFunction timeDomainFilter(b={2.7542724e-04,
        4.5134777e-03} ./ {velocity.k,1}, a={1.0000000e+00,3.0670519e+00,
        2.2183340e-01} ./ {velocity.k^2,velocity.k,1}) if
                                                       doTime
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Modelica_Noise.Blocks.Noise.BandLimitedWhiteNoise bandLimitedWhiteNoise(
      samplePeriod=samplePeriod/velocity.k, noisePower=
        1/(velocity.k)) if                                                     doTime
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
equation
  connect(velocity.y, position.u) annotation (Line(
      points={{-79,30},{-62,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(position.y, spaceDomainNoiseMinimum.u) annotation (Line(
      points={{-39,30},{-22,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(spaceDomainNoiseWhite.u, position.y) annotation (Line(
      points={{-22,-10},{-30,-10},{-30,30},{-39,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(spaceDomainFilter.u, spaceDomainNoiseWhite.y) annotation (Line(
      points={{18,-10},{1,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(spaceDomainNoiseZero.u, position.y) annotation (Line(
      points={{-22,70},{-30,70},{-30,30},{-39,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bandLimitedWhiteNoise.y, timeDomainFilter.u) annotation (Line(
      points={{1,-50},{18,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), experiment(
      StopTime=20,
      Interval=0.01,
      Tolerance=0.001),
    __Dymola_experimentSetupOutput);
end FilterAndConvolution;
