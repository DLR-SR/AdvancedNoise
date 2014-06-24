within Noise.Utilities.Icons;
partial function PDF "Icon for PDF"

annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),
                graphics={
        Line(points={{-10,-92},{-10,90}},   color={0,0,0}),
        Polygon(
          points={{-10,90},{-20,70},{0,70},{-10,90}},
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
        Rectangle(
          lineColor={255,128,0},
          extent={{-100,-100},{100,100}},
          radius=25)}),                     Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PDF;
