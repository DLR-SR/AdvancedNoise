within Noise.Examples.RailIrregularities.Parts;
model QuarterRailwayCar "A quarter of a railway car"
  extends Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges;
  Modelica.Mechanics.Translational.Components.SpringDamper contact(c=990e6, d=100e3,
  stateSelect=StateSelect.never)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,0})));
  Modelica.Mechanics.Translational.Components.Mass wheel(
    s(fixed=true),
    v(fixed=true),
    stateSelect=StateSelect.always,
    m=1250)                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-20,0})));
  Modelica.Mechanics.Translational.Components.SpringDamper suspension(c=0.175e6,
      d=10.5e3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={20,0})));
  Modelica.Mechanics.Translational.Components.Mass body(
    s(fixed=true),
    v(fixed=true),
    stateSelect=StateSelect.always,
    m=6750)                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={60,0})));
equation
  connect(wheel.flange_a,contact. flange_b) annotation (Line(
      points={{-30,0},{-50,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(suspension.flange_a,wheel. flange_b) annotation (Line(
      points={{10,0},{-10,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(body.flange_a,suspension. flange_b) annotation (Line(
      points={{50,0},{30,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(body.flange_b, flange_b) annotation (Line(
      points={{70,0},{100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(contact.flange_a, flange_a) annotation (Line(
      points={{-70,0},{-100,0}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics
        ={
        Ellipse(
          extent={{-100,40},{-20,-40}},
          fillPattern=FillPattern.Solid,
          fillColor={135,135,135},
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-96,36},{-24,-36}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Sphere),
        Rectangle(
          extent={{-60,-30},{60,30}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={255,255,255},
          origin={70,0},
          rotation=90),
        Line(
          points={{40,40},{28,40},{24,50},{18,28},{12,50},{6,28},{0,50},{-6,28},
              {-10,40},{-20,40},{-20,-40},{40,-40}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{30,-30},{-10,-30},{-10,-50},{30,-50}},
          color={0,0,0},
          smooth=Smooth.None),
        Rectangle(
          extent={{-10,-30},{20,-50}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,120},{150,80}},
          textString="%name",
          lineColor={0,0,255})}));
end QuarterRailwayCar;
