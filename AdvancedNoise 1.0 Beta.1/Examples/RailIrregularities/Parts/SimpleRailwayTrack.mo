within AdvancedNoise.Examples.RailIrregularities.Parts;
model SimpleRailwayTrack "A simple railway track model"
  extends Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges;
  Modelica.Mechanics.Translational.Components.Mass track(
  L=0,
  m=165,
  v(start=0),
  s(start=0)) annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=0,
      origin={40,0})));
  Modelica.Mechanics.Translational.Components.SpringDamper
                                                      track_bed(
  d=9.4e7,
  v_rel(start=0),
  s_rel(start=-2.2548285e-4),
  c=7.5e7) annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=0,
      origin={-40,0})));
equation
  connect(track.flange_a, track_bed.flange_b) annotation (Line(
      points={{30,0},{-30,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(track_bed.flange_a, flange_a) annotation (Line(
      points={{-50,0},{-100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(track.flange_b, flange_b) annotation (Line(
      points={{50,0},{100,0},{100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
          extent={{-100,60},{-60,-60}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid), Polygon(
          points={{-60,50},{-40,50},{-30,20},{60,10},{66,20},{80,20},{90,10},{90,
              -10},{80,-20},{66,-20},{60,-10},{-30,-20},{-40,-50},{-60,-50},{-60,
              50}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,120},{150,80}},
          textString="%name",
          lineColor={0,0,255})}));
end SimpleRailwayTrack;
