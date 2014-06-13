within Noise.Examples.Actuator.Parts;
model LinearSystemsNoise
  extends NoiseModel;
  Modelica_LinearSystems2.Controller.Noise noise(
    y_max=0.01,
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Discrete,
    y_min=-0.01)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));

  inner Modelica_LinearSystems2.Controller.SampleClock sampleClock(blockType=
        Modelica_LinearSystems2.Controller.Types.BlockType.Discrete, sampleTime=
       1/2000)
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  Modelica_LinearSystems2.Controller.FilterFIR filter1(blockType=
        Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Discrete,
      L=10) annotation (Placement(transformation(extent={{0,-10},{20,10}})));
equation
  connect(noise.y, filter1.u) annotation (Line(
      points={{-19,0},{-2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(filter1.y, y) annotation (Line(
      points={{21,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(graphics={
        Line(points={{-100,0},{-45,0}}, color={0,0,127}),
        Ellipse(
          extent={{-25,-10},{-45,10}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-35,0},{30,35}}, color={0,0,127}),
        Ellipse(
          extent={{45,-10},{25,10}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{45,0},{100,0}}, color={0,0,127})}),
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>A noise block. With linear systems noise.</p>
</html>"));
end LinearSystemsNoise;
