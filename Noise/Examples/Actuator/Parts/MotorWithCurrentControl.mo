within Noise.Examples.Actuator.Parts;
model MotorWithCurrentControl
  "Test example: PermanentMagnetSynchronousInductionMachine fed by current source. Based on Modelica.Electrical.Machines.Examples.SynchronousInductionMachines.SMPM_CurrentSource"
  extends Modelica.Electrical.Machines.Icons.TransientMachine;
  constant Integer m=3 "Number of phases";
  parameter Modelica.SIunits.Voltage VNominal=100
    "Nominal RMS voltage per phase";
  parameter Modelica.SIunits.Frequency fNominal=50 "Nominal frequency";
  parameter Modelica.SIunits.Frequency f=50 "Actual frequency";
  parameter Modelica.SIunits.Time tRamp=1 "Frequency ramp";
  parameter Modelica.SIunits.Torque TLoad=181.4 "Nominal load torque";
  parameter Modelica.SIunits.Time tStep=1.2 "Time of load torque step";
  parameter Modelica.SIunits.Inertia JLoad=0.29 "Load's moment of inertia";

  Modelica.SIunits.Angle phi_motor "Rotational Position";
  Modelica.SIunits.AngularVelocity w "Rotational Speed";
  Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet
    smpm(
    p=smpmData.p,
    fsNominal=smpmData.fsNominal,
    TsOperational=293.15,
    Rs=smpmData.Rs,
    TsRef=smpmData.TsRef,
    alpha20s=smpmData.alpha20s,
    Lszero=smpmData.Lszero,
    Lssigma=smpmData.Lssigma,
    Jr=smpmData.Jr,
    Js=smpmData.Js,
    frictionParameters=smpmData.frictionParameters,
    phiMechanical(fixed=true),
    wMechanical(fixed=true),
    statorCoreParameters=smpmData.statorCoreParameters,
    strayLoadParameters=smpmData.strayLoadParameters,
    TrOperational=293.15,
    VsOpenCircuit=smpmData.VsOpenCircuit,
    Lmd=smpmData.Lmd,
    Lmq=smpmData.Lmq,
    useDamperCage=smpmData.useDamperCage,
    Lrsigmad=smpmData.Lrsigmad,
    Lrsigmaq=smpmData.Lrsigmaq,
    Rrd=smpmData.Rrd,
    Rrq=smpmData.Rrq,
    TrRef=smpmData.TrRef,
    alpha20r=smpmData.alpha20r,
    permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters)
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}}, rotation=0)));
  Modelica.Electrical.MultiPhase.Sources.SignalCurrent signalCurrent(final m=m)
    annotation (Placement(transformation(
        origin={-10,50},
        extent={{-10,10},{10,-10}},
        rotation=270)));
  Modelica.Electrical.MultiPhase.Basic.Star star(final m=m)
    annotation (Placement(transformation(extent={{-50,80},{-70,100}},
          rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(
        origin={-90,90},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Electrical.Machines.Utilities.CurrentController currentController(p=smpm.p)
    annotation (Placement(transformation(extent={{-50,40},{-30,60}})));
  Modelica.Electrical.Machines.Sensors.VoltageQuasiRMSSensor voltageQuasiRMSSensor
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-30,-10})));
  Modelica.Electrical.MultiPhase.Basic.Star starM(final m=m) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-60,-10})));
  Modelica.Electrical.Analog.Basic.Ground groundM
    annotation (Placement(transformation(
        origin={-80,-28},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(
      terminalConnection="Y") annotation (Placement(transformation(extent={{-20,
            -30},{0,-10}}, rotation=0)));
  Modelica.Electrical.Machines.Sensors.RotorDisplacementAngle rotorDisplacementAngle(p=smpm.p)
    annotation (Placement(transformation(
        origin={20,-40},
        extent={{-10,10},{10,-10}},
        rotation=270)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,0})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation (
      Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={40,-60})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,0})));
  Modelica.Mechanics.Rotational.Components.Inertia inertiaLoad(J=0.29)
    annotation (Placement(transformation(extent={{50,-50},{70,-30}})));
  parameter
    Modelica.Electrical.Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
    smpmData(useDamperCage=false)
    annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
  Modelica.Electrical.Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor
    annotation (Placement(transformation(
        origin={-10,0},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Sources.Constant id(k=0)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Interfaces.RealInput iq_rms1 annotation (Placement(
        transformation(extent={{-120,40},{-80,80}}), iconTransformation(extent=
            {{-120,40},{-80,80}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange
    "Right flange of shaft"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput phi
    "Absolute angle of flange as output signal" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,80})));
equation
  w = speedSensor.w;
  phi_motor = angleSensor.phi;
  connect(star.pin_n, ground.p)
    annotation (Line(points={{-70,90},{-80,90}}, color={0,0,255}));
  connect(rotorDisplacementAngle.plug_n, smpm.plug_sn)    annotation (Line(
        points={{26,-30},{26,-20},{-16,-20},{-16,-30}}, color={0,0,255}));
  connect(rotorDisplacementAngle.plug_p, smpm.plug_sp)    annotation (Line(
        points={{14,-30},{-4,-30}}, color={0,0,255}));
  connect(terminalBox.plug_sn, smpm.plug_sn)   annotation (Line(
      points={{-16,-30},{-16,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(terminalBox.plug_sp, smpm.plug_sp)   annotation (Line(
      points={{-4,-30},{-4,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(smpm.flange, rotorDisplacementAngle.flange) annotation (Line(
      points={{0,-40},{10,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(signalCurrent.plug_p, star.plug_p) annotation (Line(
      points={{-10,60},{-10,90},{-50,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(angleSensor.flange, rotorDisplacementAngle.flange) annotation (Line(
      points={{10,-10},{10,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(angleSensor.phi, currentController.phi) annotation (Line(
      points={{10,11},{10,30},{-40,30},{-40,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(groundM.p, terminalBox.starpoint) annotation (Line(
      points={{-70,-28},{-19,-28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(smpm.flange, torqueSensor.flange_a) annotation (Line(
      points={{0,-40},{30,-40},{30,-60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(voltageQuasiRMSSensor.plug_p, terminalBox.plugSupply) annotation (
      Line(
      points={{-20,-10},{-10,-10},{-10,-28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(starM.plug_p, voltageQuasiRMSSensor.plug_n) annotation (Line(
      points={{-50,-10},{-40,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(starM.pin_n, groundM.p) annotation (Line(
      points={{-70,-10},{-70,-28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(currentController.y, signalCurrent.i) annotation (Line(
      points={{-29,50},{-17,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(speedSensor.flange, smpm.flange) annotation (Line(
      points={{30,-10},{30,-40},{0,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torqueSensor.flange_b, inertiaLoad.flange_a) annotation (Line(
      points={{50,-60},{50,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(signalCurrent.plug_n, currentQuasiRMSSensor.plug_p) annotation (
     Line(
      points={{-10,40},{-10,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(currentQuasiRMSSensor.plug_n, voltageQuasiRMSSensor.plug_p)
    annotation (Line(
      points={{-10,-10},{-20,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(id.y, currentController.id_rms) annotation (Line(
      points={{-79,30},{-70,30},{-70,56},{-52,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(currentController.iq_rms, iq_rms1) annotation (Line(
      points={{-52,44},{-76,44},{-76,60},{-100,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inertiaLoad.flange_b, flange) annotation (Line(
      points={{70,-40},{86,-40},{86,0},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(angleSensor.phi, phi) annotation (Line(
      points={{10,11},{10,80},{50,80}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    experiment(StopTime=2.0, Interval=0.001),
    Documentation(info="<html>
<p>A synchronous induction machine with permanent magnets accelerates a quadratic speed dependent load from standstill.
The rms values of d- and q-current in rotor fixed coordinate system are converted to three-phase currents,
and fed to the machine. The result shows that the torque is influenced by the q-current,
whereas the stator voltage is influenced by the d-current.</p>
<p>
Default machine parameters of model <a href=\"modelica://Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet\">SM_PermanentMagnet</a> are used.
</p>
</html>", revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{40,50},{-90,100}},
          fillColor={255,170,85},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),           Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})}));
end MotorWithCurrentControl;
