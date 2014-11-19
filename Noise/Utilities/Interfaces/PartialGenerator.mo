within Noise.Utilities.Interfaces;
partial model PartialGenerator
  //extends Modelica.Icons.Package;

  parameter Integer stateSize=0;
  parameter Integer abcd=0;

  replaceable function seed = Noise.Seed.xorshift64star(stateSize=stateSize)
  constrainedby Interfaces.Seed;

  replaceable partial function generator
    extends Interfaces.Generator;
  end generator;
  annotation (Icon(graphics={
        Line(points={{-80,-90},{-80,90}},   color={0,0,0}),
        Polygon(
          points={{-80,90},{-90,70},{-70,70},{-80,90}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,60},{90,60}}, color={0,0,0}),
        Line(points={{-90,-80},{90,-80}},
                                        color={0,0,0}),
        Polygon(
          points={{90,-80},{70,-70},{70,-90},{90,-80}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end PartialGenerator;
