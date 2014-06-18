within Noise.Utilities.Interfaces;
connector StringInput = input String "'input String' as connector"
  annotation (defaultComponentName="u",
  Icon(graphics={Polygon(
          points={{-100,100},{100,0},{-100,-100},{-100,100}},
          lineColor={127,127,0},
          fillColor={127,127,0},
          fillPattern=FillPattern.Solid)},
       coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
  Diagram(coordinateSystem(
        preserveAspectRatio=true, initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
          points={{0,50},{100,0},{0,-50},{0,50}},
          lineColor={127,127,0},
          fillColor={127,127,0},
          fillPattern=FillPattern.Solid), Text(
          extent={{-10,85},{-10,60}},
          lineColor={127,127,0},
        textString="%name")}),
    Documentation(info="<html>
<p>
Connector with one input signal of type String.
</p>
</html>", revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
