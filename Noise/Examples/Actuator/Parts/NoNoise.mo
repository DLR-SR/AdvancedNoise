within Noise.Examples.Actuator.Parts;
model NoNoise "No noise"
  extends NoiseModel;
  Modelica.Blocks.Sources.Constant noise(k=0)
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
equation
  connect(noise.y, y) annotation (Line(
      points={{9,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Text(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,170,85},
          fillPattern=FillPattern.Solid,
          textString="0")}),
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>A noise block. Without noise.</p>
</html>"));
end NoNoise;
