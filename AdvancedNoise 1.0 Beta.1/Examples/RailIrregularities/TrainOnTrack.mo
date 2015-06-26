within AdvancedNoise.Examples.RailIrregularities;
model TrainOnTrack
  "This examples simulates a simple train on a track with irregularities"
  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Components.Fixed
                                                  earth
  annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
  Parts.SimpleRailwayTrack simpleRailwayTrack                  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-40})));
  Parts.QuarterRailwayCar quarterRailwayCar annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,40})));
  Parts.Displacement displacement(position(v(fixed=true), a(fixed=true)))
                                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,0})));
  Parts.Irregularity irregularity
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Mechanics.Translational.Sensors.AccSensor accSensor
    annotation (Placement(transformation(extent={{40,80},{60,100}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
equation
  connect(quarterRailwayCar.flange_a, displacement.flange_b) annotation (Line(
      points={{0,30},{0,10}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(displacement.flange_a, simpleRailwayTrack.flange_b) annotation (Line(
      points={{0,-10},{0,-30}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(simpleRailwayTrack.flange_a, earth.flange) annotation (Line(
      points={{0,-50},{0,-80}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(irregularity.y, displacement.u) annotation (Line(
      points={{-39,0},{-2.4,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(positionSensor.flange, quarterRailwayCar.flange_b) annotation (Line(
      points={{40,70},{0,70},{0,50}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(accSensor.flange, quarterRailwayCar.flange_b) annotation (Line(
      points={{40,90},{0,90},{0,50}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));

initial equation
  simpleRailwayTrack.track.a = 0;
  //simpleRailwayTrack.track.v = 0;
  quarterRailwayCar.wheel.a  = 0;
  //quarterRailwayCar.wheel.v  = 0;
  quarterRailwayCar.body.a   = 0;
  //quarterRailwayCar.body.v   = 0;
end TrainOnTrack;
