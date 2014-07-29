within Noise.Utilities.Interfaces;
partial function Generator
  "The basic interface for the random number generator"
  extends Interfaces.InputOutput;
  annotation (Icon(graphics={
        Line(points={{-80,-90},{-80,90}},   color={0,0,0}),
        Polygon(
          points={{-80,90},{-90,70},{-70,70},{-80,90}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-80},{90,-80}},
                                        color={0,0,0}),
        Polygon(
          points={{90,-80},{70,-70},{70,-90},{90,-80}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,60},{90,60}}, color={0,0,0}),
        Rectangle(
          lineColor={255,128,0},
          extent={{-100,-100},{100,100}},
          radius=25)}),                                   Documentation(
        revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Generator;
