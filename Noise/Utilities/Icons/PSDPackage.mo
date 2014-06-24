within Noise.Utilities.Icons;
partial package PSDPackage "Icon for PSD"
  extends Modelica.Icons.Package;
annotation(Icon(graphics={
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
                          Text(
          extent={{-20,100},{90,-80}},
          lineColor={255,0,0},
        textString="?")}),                  Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PSDPackage;
