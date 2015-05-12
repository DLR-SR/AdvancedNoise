within Noise.Examples.RailIrregularities;
model TrainOnTrack
  "This examples simulates a simple train on a track with irregularities"
  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Components.SpringDamper contact(c=990e6, d=100e3,
  stateSelect=StateSelect.never)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,90})));
  Modelica.Mechanics.Translational.Components.Mass wheel(
    s(fixed=true),
    v(fixed=true),
    stateSelect=StateSelect.always,
    m=1250)                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,90})));
  Modelica.Mechanics.Translational.Components.SpringDamper suspension(c=0.175e6,
      d=10.5e3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={60,90})));
  Modelica.Mechanics.Translational.Components.Mass body(
    s(fixed=true),
    v(fixed=true),
    stateSelect=StateSelect.always,
    m=6750)                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,90})));
  Modelica.Mechanics.Translational.Components.Mass track(
  L=0,
  m=165,
  v(start=0),
  s(start=0)) annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=0,
      origin={30,-90})));
  Modelica.Mechanics.Translational.Components.SpringDamper
                                                      track_bed(
  d=9.4e7,
  v_rel(fixed=true, start=0),
  s_rel(start=-2.2548285e-4, fixed=true),
  c=7.5e7) annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=0,
      origin={60,-90})));
  Modelica.Mechanics.Translational.Components.Fixed
                                                  earth
  annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Modelica.Mechanics.Translational.Sources.Position position
    annotation (Placement(transformation(extent={{-42,2},{-22,22}})));
equation
  connect(wheel.flange_a,contact. flange_b) annotation (Line(
      points={{20,90},{10,90}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(suspension.flange_a,wheel. flange_b) annotation (Line(
      points={{50,90},{40,90}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(body.flange_a,suspension. flange_b) annotation (Line(
      points={{80,90},{70,90}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(track.flange_b,track_bed. flange_a) annotation (Line(
      points={{40,-90},{50,-90}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(track_bed.flange_b,earth. flange) annotation (Line(
      points={{70,-90},{90,-90}},
      color={0,127,0},
      smooth=Smooth.None));
end TrainOnTrack;
