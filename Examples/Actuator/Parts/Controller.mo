within Noise.Examples.Actuator.Parts;
model Controller
  import Noise;
  Modelica.Blocks.Continuous.PI speed_PI(k=10, T=5e-2)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Math.Feedback speedFeedback
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Continuous.Derivative positionToSpeed(T=0.005)
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
  Modelica.Blocks.Interfaces.RealInput positionMeasured
    "Position signal of motor"
    annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
  Modelica.Blocks.Interfaces.RealInput positionReference "Reference position"
    annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
  Modelica.Blocks.Interfaces.RealOutput y1 "Connector of Real output signal"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Continuous.PI position_PI(T=5e-1, k=3)
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Blocks.Math.Feedback positionFeedback
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Modelica.Blocks.Math.Add addNoise
    annotation (Placement(transformation(extent={{-60,-64},{-40,-44}})));
  replaceable Noise.Examples.Actuator.Parts.NoNoise noiseModel
    constrainedby Noise.Examples.Actuator.Parts.NoiseModel
    annotation (choicesAllMatching = true, Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Continuous.FirstOrder busdelay(T=1e-3)
    annotation (Placement(transformation(extent={{68,-10},{88,10}})));
equation
  connect(positionToSpeed.y, speedFeedback.u2) annotation (Line(
      points={{1,-60},{20,-60},{20,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(speedFeedback.y, speed_PI.u) annotation (Line(
      points={{29,0},{38,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(positionFeedback.u2, positionToSpeed.u) annotation (Line(
      points={{-30,52},{-30,-60},{-22,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(positionReference, positionFeedback.u1) annotation (Line(
      points={{-100,60},{-38,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(positionFeedback.y, position_PI.u) annotation (Line(
      points={{-21,60},{-12,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(position_PI.y, speedFeedback.u1) annotation (Line(
      points={{11,60},{20,60},{20,32},{0,32},{0,0},{12,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(positionMeasured, addNoise.u2) annotation (Line(
      points={{-100,-60},{-62,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(addNoise.y, positionToSpeed.u) annotation (Line(
      points={{-39,-54},{-30,-54},{-30,-60},{-22,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noiseModel.y, addNoise.u1) annotation (Line(
      points={{-79,0},{-68,0},{-68,-48},{-62,-48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(speed_PI.y, busdelay.u) annotation (Line(
      points={{61,0},{66,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(y1, busdelay.y) annotation (Line(
      points={{100,0},{89,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),
        Text(
          extent={{-80,80},{0,0}},
          lineColor={0,0,255},
          textString="PI"),
        Text(
          extent={{0,0},{80,-80}},
          lineColor={0,0,255},
          textString="PI"),             Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})}),
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>A motor controller</p>
</html>"));
end Controller;
