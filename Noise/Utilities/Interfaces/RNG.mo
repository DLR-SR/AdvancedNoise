within Noise.Utilities.Interfaces;
partial function RNG "The basic interface for the random number generator"
  extends Interfaces.InputOutput;
  annotation (Icon(graphics={
        Line(points={{-80,-100},{-80,100}}, color={0,0,0}),
        Polygon(
          points={{-80,100},{-90,80},{-70,80},{-80,100}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-100,-80},{100,-80}},
                                        color={0,0,0}),
        Polygon(
          points={{100,-80},{80,-70},{80,-90},{100,-80}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,60},{100,60}},color={0,0,0})}), Documentation(
        revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end RNG;
