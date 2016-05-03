within AdvancedNoise.Examples.RailIrregularities.Parts;
model Displacement "Inserts a fixed displacement"
  extends Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges;
  Modelica.Mechanics.Translational.Sources.Position position(useSupport=true)
    annotation (Placement(transformation(extent={{10,10},{30,30}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,24})));
equation
  connect(position.support, flange_a) annotation (Line(
      points={{20,10},{20,0},{-100,0}},
      color={0,127,0}));
  connect(position.flange, flange_b) annotation (Line(
      points={{30,20},{40,20},{40,0},{100,0}},
      color={0,127,0}));
  connect(u, position.s_ref) annotation (Line(
      points={{0,120},{0,20},{8,20}},
      color={0,0,127}));
  annotation ( Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Line(
          points={{-70,10},{-90,0},{-70,-10},{-90,0},{90,0},{70,10},{90,0},{70,-10}}),
        Text(
          extent={{-150,120},{150,80}},
          textString="%name",
          lineColor={0,0,255})}));

end Displacement;
