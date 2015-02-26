within Modelica_Noise.Blocks.Examples.NoiseExamples;
model ActuatorWithNoise "An actuator model with noise in the input signal"
extends Modelica.Icons.Example;
  Blocks.Examples.NoiseExamples.Utilities.Parts.MotorWithCurrentControl Motor
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}})));
  Blocks.Examples.NoiseExamples.Utilities.Parts.Controller controller
    annotation (Placement(transformation(extent={{0,60},{20,80}})));
  Modelica.Blocks.Sources.Step     Speed(startTime=0.5, height=50)
    annotation (Placement(transformation(extent={{-72,66},{-52,86}})));
  Modelica.Mechanics.Rotational.Components.Gearbox gearbox(
    lossTable=[0,0.85,0.8,0.1,0.1],
    c=1e6,
    d=1e4,
    ratio=10,
    w_rel(fixed=true),
    b=0.0017453292519943,
    phi_rel(fixed=true))
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Mechanics.Translational.Components.IdealGearR2T idealGearR2T(ratio=
        300) annotation (Placement(transformation(extent={{-32,-10},{-12,10}})));
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
    annotation (Placement(transformation(extent={{-4,-10},{16,10}})));
  Modelica.Mechanics.Translational.Components.SpringDamper elastoGap(c=1e8, d=
        1e5,
    v_rel(fixed=true),
    s_rel(fixed=true))
             annotation (Placement(transformation(extent={{22,-10},{42,10}})));
  inner Noise.GlobalSeed globalSeed(enableNoise=true)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
equation
  connect(controller.y1, Motor.iq_rms1) annotation (Line(
      points={{21,70},{30,70},{30,20},{-96,20},{-96,6},{-88,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Motor.phi, controller.positionMeasured) annotation (Line(
      points={{-71,8},{-66,8},{-66,52},{-12,52},{-12,64},{-2,64},{-2,64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Motor.flange, gearbox.flange_a) annotation (Line(
      points={{-66,0},{-60,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(gearbox.flange_b, idealGearR2T.flangeR) annotation (Line(
      points={{-40,0},{-32,0}},
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
      points={{-19,76},{-2,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rodMass.flange_a, idealGearR2T.flangeT) annotation (Line(
      points={{-4,0},{-12,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rodMass.flange_b, elastoGap.flange_a) annotation (Line(
      points={{16,0},{22,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(elastoGap.flange_b, mass.flange_a) annotation (Line(
      points={{42,0},{50,0}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    experiment(StopTime=8, Interval = 0.01, Tolerance=1e-005),
    Documentation(info="<html>
<p>This example models an actuator with a noisy sensor (which is in the Motor):</p>
<p><img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/ActuatorNoiseDiagram.png\"/></p>
<p>The drive train consists of a motor with a gear box. The gearbox drives a rod through a linear translation model. Softly attached to the rod is another mass representing the actual actuator (= mass). The actuator is loaded with a constant force.</p>
<p>The whole model is steered by a rate limited spped step command through a controller model. 
In the Motor the motor shaft angle is measured and this measurement signal is modelled by adding
time based additive noise to the Motor angle.</p>
<p>In the following plot, the position of the actuator and the motor output torque are plotted with and without noise. The noise is not very strong, such that it has no visible effect on the position of the actuator. </p>
<p>The noise can be seen in the motor torque. Since the gearbox contains a backlash element, the motor works a lot while resting. As soon, as it starts rotating, the backlash is closed and the noise influence decreases.</p>
<p><img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/ActuatorNoise.png\"/></p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end ActuatorWithNoise;
