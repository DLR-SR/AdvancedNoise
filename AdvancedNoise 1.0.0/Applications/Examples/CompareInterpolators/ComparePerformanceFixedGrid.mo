within AdvancedNoise.Applications.Examples.CompareInterpolators;
model ComparePerformanceFixedGrid
  "Compare noise signal quality and simulation performance - signal by fixed grid interpolation"
  extends VehicleControls2.Utilities.Icons.ExecutableModel;

  Sources.ColoredSignalBasedNoise noise(
    useTime=false,
    redeclare package interpolation =
      AdvancedNoise.Applications.Roads.ISO8608classD,
    redeclare replaceable function distribution =
        Modelica.Math.Distributions.TruncatedNormal.quantile (
        mu=0,
        sigma=sqrt(0.5)/sqrt(noise.samplePeriod),
        y_min=-0.5,
        y_max=0.5))
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Sources.Constant signalVelocityConst(k=80/3.6)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Continuous.Integrator position(y_start=0)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
equation
  connect(position.y, noise.u)
    annotation (Line(points={{1,0},{18,0}}, color={0,0,127}));
  connect(signalVelocityConst.y, position.u)
    annotation (Line(points={{-39,0},{-30.5,0},{-22,0}}, color={0,0,127}));
  annotation (
    experiment(
      StopTime=20,
      Interval=0.001,
      Algorithm="Dassl"),
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Compare noise signal quality and performance of the simulation.</p>
</html>"));
end ComparePerformanceFixedGrid;
