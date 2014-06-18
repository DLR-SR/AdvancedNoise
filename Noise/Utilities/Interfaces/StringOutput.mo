within Noise.Utilities.Interfaces;
connector StringOutput = output String "'output String' as connector"
  annotation (defaultComponentName="y",
  Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
          points={{-100,100},{100,0},{-100,-100},{-100,100}},
          lineColor={127,127,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
  Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Polygon(
          points={{-100,50},{0,0},{-100,-50},{-100,50}},
          lineColor={127,127,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{30,110},{30,60}},
          lineColor={127,127,0},
        textString="%name")}),
    Documentation(info="<html>
<p>
Connector with one output signal of type String.
</p>
</html>", revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
