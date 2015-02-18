within Modelica_Noise.Blocks.Examples.NoiseExamples;
model Actuator
extends Modelica.Icons.Example;
  Blocks.Examples.NoiseExamples.Utilities.Parts.MotorWithCurrentControl Motor
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})));
  Blocks.Examples.NoiseExamples.Utilities.Parts.Controller controller
    annotation (Placement(transformation(extent={{0,60},{20,80}})));
  Modelica.Blocks.Sources.Step     Speed(startTime=0.5, height=50)
    annotation (Placement(transformation(extent={{-72,66},{-52,86}})));
  Modelica.Mechanics.Rotational.Components.Gearbox gearbox(
    lossTable=[0,0.85,0.8,0.1,0.1],
    c=1e6,
    d=1e4,
    ratio=10,
    b=0.0017453292519943)
    annotation (Placement(transformation(extent={{-68,-10},{-48,10}})));
  Modelica.Mechanics.Translational.Components.IdealGearR2T idealGearR2T(ratio=
        300) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=100)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Mechanics.Translational.Sources.ConstantForce constantForce(
      f_constant=10000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={86,0})));
  Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter(Rising=50)
    annotation (Placement(transformation(extent={{-40,66},{-20,86}})));
  Modelica.Mechanics.Translational.Components.Mass rodMass(m=3)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Components.SpringDamper elastoGap(c=1e8, d=
        1e5) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
equation
  connect(controller.y1, Motor.iq_rms1) annotation (Line(
      points={{20,70},{34,70},{34,20},{-94,20},{-94,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Motor.phi, controller.positionMeasured) annotation (Line(
      points={{-79,8},{-72,8},{-72,52},{-8,52},{-8,64},{0,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Motor.flange, gearbox.flange_a) annotation (Line(
      points={{-74,0},{-68,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(gearbox.flange_b, idealGearR2T.flangeR) annotation (Line(
      points={{-48,0},{-40,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(constantForce.flange, mass.flange_b) annotation (Line(
      points={{76,0},{70,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(Speed.y, slewRateLimiter.u) annotation (Line(
      points={{-51,76},{-42,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(slewRateLimiter.y, controller.positionReference) annotation (Line(
      points={{-19,76},{0,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rodMass.flange_a, idealGearR2T.flangeT) annotation (Line(
      points={{-10,0},{-20,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rodMass.flange_b, elastoGap.flange_a) annotation (Line(
      points={{10,0},{20,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(elastoGap.flange_b, mass.flange_a) annotation (Line(
      points={{40,0},{50,0}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(
      StopTime=8,
      __Dymola_NumberOfIntervals=800,
      Tolerance=1e-005),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<p>This model simulates a controlled actuator built from Modelica Standard Library models. It moves the actuator at time = 0.5s. This model is only used as a reference for the noisy model. See <a href=\"ActuatorNoise\">ActuatorNoise</a> for the variant with a noisy input signal to the controller and explained results.</p>
</html>", revisions=""));
end Actuator;
