within AdvancedNoise.Applications.Examples;
model NoisesTwoDelayed "Two delayed noise signals - aimed as front and rear wheel excitation"
  extends Modelica.Icons.Example;

  Modelica.Blocks.Interfaces.RealOutput yNoiseWheelFront
    "Connector of Real output signal"
    annotation (Placement(transformation(extent={{90,-10},{110,10}}),
        iconTransformation(extent={{100,0},{100,0}})));
  Modelica.Blocks.Interfaces.RealOutput yNoiseWheelRear
    "Connector of Real output signal"
    annotation (Placement(transformation(extent={{90,-60},{110,-40}}),
        iconTransformation(extent={{100,-50},{100,-50}})));
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
    annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  Modelica.Blocks.Sources.Constant signalVelocityConst(k=data.v_veh)
    annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  Modelica.Blocks.Continuous.Integrator position(y_start=0)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Modelica.Blocks.Sources.Ramp rampMultiplicator(
    duration=1,
    startTime=1,
    height=1 - 0.01,
    offset=0.01)
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Nonlinear.FixedDelay    delayRear(delayTime=data.wheelbase/
        data.v_veh)
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
public
  record Data "Data for this simulation model"
    extends Modelica.Icons.Record;
    parameter Modelica.SIunits.Velocity v_veh = 80/3.6 "Vehicle velocity";
    parameter Modelica.SIunits.Length wheelbase = 2.4 "Vehicle wheelbase";
  end Data;
  Data data(v_veh=80/3.6, wheelbase=2.4)
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
equation
  connect(position.y, noise.u)
    annotation (Line(points={{-39,-10},{-22,-10}},
                                            color={0,0,127}));
  connect(signalVelocityConst.y, position.u)
    annotation (Line(points={{-79,-10},{-70.5,-10},{-62,-10}},
                                                         color={0,0,127}));
  connect(product.y, delayRear.u) annotation (Line(points={{41,0},{50,0},{50,-50},
          {58,-50}}, color={0,0,127}));
  connect(product.y, yNoiseWheelFront)
    annotation (Line(points={{41,0},{100,0}}, color={0,0,127}));
  connect(delayRear.y, yNoiseWheelRear)
    annotation (Line(points={{81,-50},{100,-50}}, color={0,0,127}));
  connect(rampMultiplicator.y, product.u1)
    annotation (Line(points={{1,30},{10,30},{10,6},{18,6}}, color={0,0,127}));
  connect(noise.y, product.u2) annotation (Line(points={{1,-10},{10,-10},{10,-6},
          {18,-6}}, color={0,0,127}));
  annotation (
    experiment(
      StopTime=5,
      Interval=0.001,
      __Dymola_Algorithm="Dassl"),
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Road excitation signals suitable for a planar automotive model. The signal for the front wheel is generated using the noise block. The rear wheel signal is delayed only. The time delay is constant and depends on the vehicle wheelbase and the vehicle velocity (both given within the record <code>data</code>). In the next graph, both signals over current vehicle position are shown.</p>
<p><img src=\"modelica://AdvancedNoise/Resources/Images/Examples/NoisesTwoDelayed.png\"/></p>
</html>"));
end NoisesTwoDelayed;
