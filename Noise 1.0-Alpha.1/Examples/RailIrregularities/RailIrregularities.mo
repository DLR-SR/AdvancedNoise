within Noise.Examples.RailIrregularities;
model RailIrregularities
  "Demonstrates shaping of rail irregularities in the space domain"
  extends Modelica.Icons.Example;

  constant Real convolutionResolution=Interpolator.T[2] - Interpolator.T[1];

  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=true)
               annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Modelica_Noise.Blocks.Noise.SignalBasedNoise spaceDomainNoise(
    useTime=false,
    redeclare package interpolation =
        Noise.Examples.RailIrregularities.Interpolator,
    samplePeriod=0.4,
    y_min=-1e10,
    y_max=+1e10,
    redeclare function distribution =
        Modelica_Noise.Math.TruncatedDistributions.Normal.quantile (mu=0, sigma=
           sqrt(0.5)/sqrt(spaceDomainNoise.samplePeriod)))
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));

  Modelica.Blocks.Continuous.Integrator position(y_start=123)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Sources.Constant velocity(k=100)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica_Noise.Blocks.Noise.BandLimitedWhiteNoise timeDomainWhiteNoise(
      samplePeriod=spaceDomainNoise.samplePeriod/velocity.k, noisePower=20*(
        velocity.k)^3,
    enableNoise=true)
    annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  Modelica.Blocks.Continuous.TransferFunction timeDomainFilter(b={3.6089313e-06,
        5.9094438e-05} .* {velocity.k,1}, a={1.0000000e+00,3.0638356e+00,2.2231451e-01}
         .* {velocity.k^2,velocity.k,1})
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Modelica_Noise.Blocks.Statistics.Variance variance
    annotation (Placement(transformation(extent={{16,-66},{36,-46}})));
equation
  connect(velocity.y, position.u) annotation (Line(
      points={{-79,30},{-62,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(position.y,spaceDomainNoise. u) annotation (Line(
      points={{-39,30},{-22,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(timeDomainWhiteNoise.y, timeDomainFilter.u) annotation (Line(
      points={{1,-10},{18,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(variance.u, timeDomainWhiteNoise.y) annotation (Line(
      points={{14,-56},{8,-56},{8,-10},{1,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), experiment(
      StopTime=20,
      outputInterval=0.5e-3,
      Tolerance=0.1),
    __Dymola_experimentSetupOutput);
end RailIrregularities;
