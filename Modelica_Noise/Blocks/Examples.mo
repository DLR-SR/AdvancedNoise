within Modelica_Noise.Blocks;
package Examples "Some example models"
  extends Modelica.Icons.ExamplesPackage;

  model RandomNoise "Shows the use of the basic RandomNoise block"
     extends Modelica.Icons.Example;

    inner Modelica_Noise.Blocks.Sources.GlobalSeed globalSeed
      annotation (Placement(transformation(extent={{70,70},{90,90}})));
    Modelica_Noise.Blocks.Sources.RandomNoise prng
      annotation (Placement(transformation(extent={{-10,-12},{10,8}})));
  equation

    annotation (experiment(
        StopTime=5,
        Interval=0.0005,
        __Dymola_fixedstepsize=0.001,
        __Dymola_Algorithm="Euler"),
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This example demonstrates, how the RandomNoise block can be instantiated. You can use this example to test different settings in the RandomNoise block.</p>
</html>"));
  end RandomNoise;

  model FunctionCall "Shows how to use the internal random functions"
    import Modelica_Noise;
    extends Modelica.Icons.Example;
    import Modelica_Noise.Math.Random.*;
    import Modelica_Noise.Math.RandomDistributions.*;

  //
  //
  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
  // General parameters
    parameter Real dt = 0.1 "The time step for discrete random numbers";

  //
  //
  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
  // Using the state-less random number generators
    function my_continuous_random =
        Modelica_Noise.Math.RandomDistributions.normal (
      redeclare function RNG = SampleFree.RNG_DIRCS,
      mu = 20, sigma = 10,
      states_in = zeros(0)) "The state-less random number generator" annotation (
        Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This is an example implementation of a sample-free RNG.</p>
</html>"));

    // The actual continuous random numbers
    Real r_continuous = my_continuous_random(time)
      "The time-continuous noise signal";
    Real r_discrete =   my_continuous_random(integer(time/dt) * dt)
      "The time-discrete noise signal";

  //
  //
  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
  // Using the random number generators with states
    function my_sampled_random = Modelica_Noise.Math.RandomDistributions.normal
        (
      redeclare function RNG = SampleBased.RNG_LCG,
      mu = -20, sigma = 10,
      instance = 0) "The state-less random number generator" annotation (
        Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This is an example implementation of a sample-based RNG.</p>
</html>"));

    // The sampled random numbers and the state
    Real r_sampled "The sampled noise signal";
    Integer state[1] "The state of the random number generator";
  initial equation
    pre(state) = {12345};
  equation
    when sample(0,dt) then
      (r_sampled, state) = my_sampled_random(states_in=  pre(state));
    end when;

    annotation (experiment(StopTime=10, Interval=0.01),
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This example demonstrates, how the internal functions of the RandomNoise block can also be used in your own models: You need to instatiate the respective function with the neccessary redeclarations and then you can call the functions. Please not, that the sample-based RNGs also need handling of their states!</p>
</html>"));
  end FunctionCall;

  model CompareRNG
    "An example to compare the generated random numbers of different RNGs"
    extends Modelica.Icons.Example;

    Modelica_Noise.Blocks.Sources.RandomNoise Weyl(useSampleBasedMethods=false,
        redeclare function SampleFreeRNG =
          Modelica_Noise.Math.Random.SampleFree.RNG_Weyl)
      annotation (Placement(transformation(extent={{-32,2},{-12,22}})));
    Modelica_Noise.Blocks.Sources.RandomNoise DIRCS(useSampleBasedMethods=false,
        redeclare function SampleFreeRNG =
          Modelica_Noise.Math.Random.SampleFree.RNG_DIRCS)
      annotation (Placement(transformation(extent={{-72,2},{-52,22}})));
    Modelica_Noise.Blocks.Sources.RandomNoise NumericalRecipes(
        useSampleBasedMethods=true, redeclare function SampleBasedRNG =
          Modelica_Noise.Math.Random.SampleBased.RNG_LCG_NumericalRecipes)
      annotation (Placement(transformation(extent={{-72,-78},{-52,-58}})));
    Modelica_Noise.Blocks.Sources.RandomNoise VAX(useSampleBasedMethods=true,
        redeclare function SampleBasedRNG =
          Modelica_Noise.Math.Random.SampleBased.RNG_LCG_VAX)
      annotation (Placement(transformation(extent={{-34,-78},{-14,-58}})));
    Parts.Modelica_LinearSystems2.Controller.Noise LinearSystems2(y_min=0, y_max=
          1) annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
    inner Parts.Modelica_LinearSystems2.Controller.SampleClock sampleClock(
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockType.Discrete,
        sampleTime=0.01)
      annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
    inner Blocks.Sources.GlobalSeed globalSeed
      annotation (Placement(transformation(extent={{70,70},{90,90}})));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                        graphics={Rectangle(
            extent={{-98,-22},{92,-98}},
            lineColor={0,0,255},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid), Rectangle(
            extent={{-98,58},{92,-18}},
            lineColor={0,0,255},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-100,50},{100,40}},
            lineColor={0,0,255},
            textString="State free random number generators"),
          Text(
            extent={{-100,-30},{100,-40}},
            lineColor={0,0,255},
            textString="Random number generators with state")}),
                                              Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This example compares all currently available RNG algorithms and also compares them to the current state-of-the-art in Modelica.</p>
</html>"));
  end CompareRNG;

  model ComparePDF "Compares different PSDs"
    extends Modelica.Icons.Example;

    Modelica_Noise.Blocks.Sources.RandomNoise UniformNoise(
        useSampleBasedMethods=false, redeclare function PDF =
          Modelica_Noise.Math.RandomDistributions.uniform)
      annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
    Modelica_Noise.Blocks.Sources.RandomNoise BoxMueller(useSampleBasedMethods=
          false, redeclare function PDF =
          Modelica_Noise.Math.RandomDistributions.normal)
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    Modelica_Noise.Blocks.Sources.RandomNoise CauchyLorenz(
        useSampleBasedMethods=false, redeclare function PDF =
          Modelica_Noise.Math.RandomDistributions.CauchyLorentz)
      annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
    Modelica_Noise.Blocks.Sources.RandomNoise Weibull(useSampleBasedMethods=
          false, redeclare function PDF =
          Modelica_Noise.Math.RandomDistributions.Weibull)
      annotation (Placement(transformation(extent={{-20,30},{0,50}})));
    Modelica_Noise.Blocks.Sources.RandomNoise IrwinHall(useSampleBasedMethods=
          false, redeclare function PDF =
          Modelica_Noise.Math.RandomDistributions.IrwinHall (n=10))
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
    Modelica_Noise.Blocks.Sources.RandomNoise Bates(useSampleBasedMethods=false,
        redeclare function PDF = Modelica_Noise.Math.RandomDistributions.Bates
          (n=10))
      annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
    Modelica_Noise.Blocks.Sources.RandomNoise DiscreteDistribution(
        useSampleBasedMethods=false, redeclare function PDF =
          Modelica_Noise.Math.RandomDistributions.discreteValues)
      annotation (Placement(transformation(extent={{20,30},{40,50}})));
    inner Modelica_Noise.Blocks.Sources.GlobalSeed globalSeed
      annotation (Placement(transformation(extent={{70,70},{90,90}})));
    annotation (
      experiment(StopTime=100, Interval=0.001),
  Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This example compares all currently available Probability Density Functions, so distributions of values in the random numbers.</p>
</html>"));
  end ComparePDF;

  model ComparePSD "Compares different PSDs"
    extends Modelica.Icons.Example;

    Modelica_Noise.Blocks.Sources.RandomNoise WhiteNoise(
      redeclare function PSD =
          Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.PSD.PSD_WhiteNoise,
      useSampleBasedMethods=false,
      redeclare function PDF = Modelica_Noise.Math.RandomDistributions.uniform
          (interval={-1,1}))
      annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
    Modelica_Noise.Blocks.Sources.RandomNoise IdealLowPass(
      redeclare function PSD =
          Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.PSD.PSD_IdealLowPass (
            n=10),
      useSampleBasedMethods=false,
      redeclare function PDF = Modelica_Noise.Math.RandomDistributions.uniform
          (interval={-1,1}))
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
    Modelica_Noise.Blocks.Sources.RandomNoise Linear(
      redeclare function PSD =
          Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.PSD.PSD_LinearInterpolation
          (n=5),
      useSampleBasedMethods=false,
      redeclare function PDF = Modelica_Noise.Math.RandomDistributions.uniform
          (interval={-1,1}))
      annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
    inner Modelica_Noise.Blocks.Sources.GlobalSeed globalSeed
      annotation (Placement(transformation(extent={{70,70},{90,90}})));
    annotation (
      experiment(StopTime=100, Interval=0.001),
  Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This example compares all currently available Power Spectral Density functions, so distributions of frequencies in the random numbers.</p>
</html>"));
  end ComparePSD;

  model Analysis "Shows how to analyze a noise signal"

    extends Modelica.Icons.Example;

    Modelica_Noise.Blocks.Sources.RandomNoise prng(
      redeclare function PSD =
          Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.PSD.PSD_WhiteNoise,
      redeclare function PDF = Modelica_Noise.Math.RandomDistributions.normal,
      redeclare function SampleBasedRNG =
          Modelica_Noise.Math.Random.SampleBased.RNG_MRG,
      useSampleBasedMethods=false)
      annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
    Modelica_Noise.Blocks.Math.EmpericalMean mu
      annotation (Placement(transformation(extent={{20,40},{40,60}})));
    Modelica_Noise.Blocks.Math.Variance var
      annotation (Placement(transformation(extent={{20,0},{40,20}})));
    Modelica_Noise.Blocks.Math.StandardDeviation std
      annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
    Modelica_Noise.Blocks.Math.Correlation corr
      annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
    inner Modelica_Noise.Blocks.Sources.GlobalSeed globalSeed
      annotation (Placement(transformation(extent={{70,70},{90,90}})));
  equation
    connect(prng.y, mu.u) annotation (Line(
        points={{-59,50},{18,50}},
        color={0,0,127}));
    connect(var.u, prng.y) annotation (Line(
        points={{18,10},{-20,10},{-20,50},{-59,50}},
        color={0,0,127}));
    connect(std.u, prng.y) annotation (Line(
        points={{18,-30},{-20,-30},{-20,50},{-59,50}},
        color={0,0,127}));
    connect(corr.u, prng.y) annotation (Line(
        points={{18,-70},{-20,-70},{-20,50},{-59,50}},
        color={0,0,127}));
    connect(corr.u1, prng.y) annotation (Line(
        points={{18,-76},{10,-76},{10,-70},{-20,-70},{-20,50},{-59,50}},
        color={0,0,127}));
    annotation (
      experiment(StopTime=100, Tolerance=1e-006),
  Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This example uses some simple analysis block to analyse the mean and variance of the generated random numbers. You can used it to check the quality of a parametrization of the RandomNoise block.</p>
<p>The generated values should satisfy some general quality measures:</p>
<ul>
<li>They should match your selected distribution.</li>
<li>They should be uncorrelated for different seeds and time lags, respectively.</li>
<li>...</li>
</ul>
</html>"));
  end Analysis;

  model TestSeeding
      extends Modelica.Icons.Example;

    Modelica_Noise.Blocks.Sources.RandomNoise prng(
      redeclare function SampleBasedRNG =
          Modelica_Noise.Math.Random.SampleBased.RNG_LCG_NumericalRecipes,
      redeclare function PDF = Modelica_Noise.Math.RandomDistributions.uniform,
      redeclare function SampleFreeRNG =
          Modelica_Noise.Math.Random.SampleFree.RNG_DIRCS,
      redeclare function PSD =
          Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.PSD.PSD_WhiteNoise,
      useGlobalSeed=true,
      useSampleBasedMethods=false,
      infiniteFreq=false,
      localSeed=66)
      annotation (Placement(transformation(extent={{-40,40},{-20,60}})));

    Modelica_Noise.Blocks.Sources.RandomNoise prng1(
      useGlobalSeed=true,
      useSampleBasedMethods=false,
      localSeed=25634)
      annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
    inner Modelica_Noise.Blocks.Sources.GlobalSeed globalSeed(userSeed=1446)
      annotation (Placement(transformation(extent={{70,70},{90,90}})));
    annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This example shows the GlobalSeed machanism at work.</p>
</html>"));
  end TestSeeding;

  package Actuator
  extends Modelica.Icons.ExamplesPackage;

    model Actuator
    extends Modelica.Icons.Example;
      Parts.MotorWithCurrentControl Motor
        annotation (Placement(transformation(extent={{-94,-10},{-74,10}})));
      Parts.Controller controller
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
          color={0,0,127}));
      connect(Motor.phi, controller.positionMeasured) annotation (Line(
          points={{-79,8},{-72,8},{-72,52},{-8,52},{-8,64},{0,64}},
          color={0,0,127}));
      connect(Motor.flange, gearbox.flange_a) annotation (Line(
          points={{-74,0},{-68,0}},
          color={0,0,0}));
      connect(gearbox.flange_b, idealGearR2T.flangeR) annotation (Line(
          points={{-48,0},{-40,0}},
          color={0,0,0}));
      connect(constantForce.flange, mass.flange_b) annotation (Line(
          points={{76,0},{70,0}},
          color={0,127,0}));
      connect(Speed.y, slewRateLimiter.u) annotation (Line(
          points={{-51,76},{-42,76}},
          color={0,0,127}));
      connect(slewRateLimiter.y, controller.positionReference) annotation (Line(
          points={{-19,76},{0,76}},
          color={0,0,127}));
      connect(rodMass.flange_a, idealGearR2T.flangeT) annotation (Line(
          points={{-10,0},{-20,0}},
          color={0,127,0}));
      connect(rodMass.flange_b, elastoGap.flange_a) annotation (Line(
          points={{10,0},{20,0}},
          color={0,127,0}));
      connect(elastoGap.flange_b, mass.flange_a) annotation (Line(
          points={{40,0},{50,0}},
          color={0,127,0}));
      annotation (
        experiment(
          StopTime=8,
          Interval=0.01,
          Tolerance=1e-005),
    Documentation(info="<html>
<p>No noise simulation of an Actuator</p>
</html>",     revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end Actuator;

    model ActuatorLinearSystemsNoise
    extends Actuator(controller(redeclare Parts.LinearSystemsNoise    noiseModel));
      annotation (
        experiment(
          StopTime=8,
          Interval=0.01,
          Tolerance=1e-005),
      Documentation(info="<html>
<p>Simulation of the same actuator with a noisy position sensor using the <a href=\"Modelica_LinearSystems2\">LinearSystems2</a> library.</p>
</html>",     revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end ActuatorLinearSystemsNoise;

    model ActuatorRandomNoiseNoise
      extends Actuator(controller(redeclare Parts.RandomNoise
            noiseModel));
      inner Blocks.Sources.GlobalSeed globalSeed
        annotation (Placement(transformation(extent={{70,70},{90,90}})));
      annotation (
        experiment(
          StopTime=8,
          Interval=0.01,
          Tolerance=1e-005),Documentation(info="<html>
<p>Simulation of the same actuator with a noisy position sensor using the <a href=\"Modelica_Noise.RandomNoise\">RandomNoise</a> block.</p>
</html>",     revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end ActuatorRandomNoiseNoise;

    package Parts
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
        parameter Modelica.SIunits.Inertia JLoad=0.29
          "Load's moment of inertia";

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
          annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
        Modelica.Electrical.MultiPhase.Sources.SignalCurrent signalCurrent(final m=m)
          annotation (Placement(transformation(
              origin={-10,50},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Modelica.Electrical.MultiPhase.Basic.Star star(final m=m)
          annotation (Placement(transformation(extent={{-50,80},{-70,100}})));
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
                  -30},{0,-10}})));
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
            color={0,0,255}));
        connect(terminalBox.plug_sp, smpm.plug_sp)   annotation (Line(
            points={{-4,-30},{-4,-30}},
            color={0,0,255}));
        connect(smpm.flange, rotorDisplacementAngle.flange) annotation (Line(
            points={{0,-40},{10,-40}},
            color={0,0,0}));
        connect(signalCurrent.plug_p, star.plug_p) annotation (Line(
            points={{-10,60},{-10,90},{-50,90}},
            color={0,0,255}));
        connect(angleSensor.flange, rotorDisplacementAngle.flange) annotation (Line(
            points={{10,-10},{10,-40}},
            color={0,0,0}));
        connect(angleSensor.phi, currentController.phi) annotation (Line(
            points={{10,11},{10,30},{-40,30},{-40,38}},
            color={0,0,127}));
        connect(groundM.p, terminalBox.starpoint) annotation (Line(
            points={{-70,-28},{-19,-28}},
            color={0,0,255}));
        connect(smpm.flange, torqueSensor.flange_a) annotation (Line(
            points={{0,-40},{30,-40},{30,-60}},
            color={0,0,0}));
        connect(voltageQuasiRMSSensor.plug_p, terminalBox.plugSupply) annotation (
            Line(
            points={{-20,-10},{-10,-10},{-10,-28}},
            color={0,0,255}));
        connect(starM.plug_p, voltageQuasiRMSSensor.plug_n) annotation (Line(
            points={{-50,-10},{-40,-10}},
            color={0,0,255}));
        connect(starM.pin_n, groundM.p) annotation (Line(
            points={{-70,-10},{-70,-28}},
            color={0,0,255}));
        connect(currentController.y, signalCurrent.i) annotation (Line(
            points={{-29,50},{-17,50}},
            color={0,0,127}));
        connect(speedSensor.flange, smpm.flange) annotation (Line(
            points={{30,-10},{30,-40},{0,-40}},
            color={0,0,0}));
        connect(torqueSensor.flange_b, inertiaLoad.flange_a) annotation (Line(
            points={{50,-60},{50,-40}},
            color={0,0,0}));
        connect(signalCurrent.plug_n, currentQuasiRMSSensor.plug_p) annotation (
           Line(
            points={{-10,40},{-10,10}},
            color={0,0,255}));
        connect(currentQuasiRMSSensor.plug_n, voltageQuasiRMSSensor.plug_p)
          annotation (Line(
            points={{-10,-10},{-20,-10}},
            color={0,0,255}));
        connect(id.y, currentController.id_rms) annotation (Line(
            points={{-79,30},{-70,30},{-70,56},{-52,56}},
            color={0,0,127}));
        connect(currentController.iq_rms, iq_rms1) annotation (Line(
            points={{-52,44},{-76,44},{-76,60},{-100,60}},
            color={0,0,127}));
        connect(inertiaLoad.flange_b, flange) annotation (Line(
            points={{70,-40},{86,-40},{86,0},{100,0}},
            color={0,0,0}));
        connect(angleSensor.phi, phi) annotation (Line(
            points={{10,11},{10,80},{50,80}},
            color={0,0,127}));
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
</html>",       revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
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

      model Controller
        Modelica.Blocks.Continuous.PI speed_PI(k=10, T=5e-2)
          annotation (Placement(transformation(extent={{40,-10},{60,10}})));
        Modelica.Blocks.Math.Feedback speedFeedback
          annotation (Placement(transformation(extent={{10,-10},{30,10}})));
        Modelica.Blocks.Continuous.Derivative positionToSpeed(T=0.005)
          annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
        Modelica.Blocks.Interfaces.RealInput positionMeasured
          "Position signal of motor"
          annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
        Modelica.Blocks.Interfaces.RealInput positionReference
          "Reference position"
          annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
        Modelica.Blocks.Interfaces.RealOutput y1
          "Connector of Real output signal"
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        Modelica.Blocks.Continuous.PI position_PI(T=5e-1, k=3)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Blocks.Math.Feedback positionFeedback
          annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
        Modelica.Blocks.Math.Add addNoise
          annotation (Placement(transformation(extent={{-60,-64},{-40,-44}})));
        replaceable Modelica_Noise.Blocks.Examples.Actuator.Parts.NoNoise noiseModel
          constrainedby
          Modelica_Noise.Blocks.Examples.Actuator.Parts.NoiseModel annotation (
            choicesAllMatching=true, Placement(transformation(extent={{-100,-10},
                  {-80,10}})));
        Modelica.Blocks.Continuous.FirstOrder busdelay(T=1e-3)
          annotation (Placement(transformation(extent={{68,-10},{88,10}})));
      equation
        connect(positionToSpeed.y, speedFeedback.u2) annotation (Line(
            points={{1,-60},{20,-60},{20,-8}},
            color={0,0,127}));
        connect(speedFeedback.y, speed_PI.u) annotation (Line(
            points={{29,0},{38,0}},
            color={0,0,127}));
        connect(positionFeedback.u2, positionToSpeed.u) annotation (Line(
            points={{-30,52},{-30,-60},{-22,-60}},
            color={0,0,127}));
        connect(positionReference, positionFeedback.u1) annotation (Line(
            points={{-100,60},{-38,60}},
            color={0,0,127}));
        connect(positionFeedback.y, position_PI.u) annotation (Line(
            points={{-21,60},{-12,60}},
            color={0,0,127}));
        connect(position_PI.y, speedFeedback.u1) annotation (Line(
            points={{11,60},{20,60},{20,32},{0,32},{0,0},{12,0}},
            color={0,0,127}));
        connect(positionMeasured, addNoise.u2) annotation (Line(
            points={{-100,-60},{-62,-60}},
            color={0,0,127}));
        connect(addNoise.y, positionToSpeed.u) annotation (Line(
            points={{-39,-54},{-30,-54},{-30,-60},{-22,-60}},
            color={0,0,127}));
        connect(noiseModel.y, addNoise.u1) annotation (Line(
            points={{-79,0},{-68,0},{-68,-48},{-62,-48}},
            color={0,0,127}));
        connect(speed_PI.y, busdelay.u) annotation (Line(
            points={{61,0},{66,0}},
            color={0,0,127}));
        connect(y1, busdelay.y) annotation (Line(
            points={{100,0},{89,0}},
            color={0,0,127}));
        annotation ( Icon(coordinateSystem(
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
</html>",       info="<html>
<p>A motor controller</p>
</html>"));
      end Controller;

      model NoNoise "No noise"
        extends NoiseModel;
        Modelica.Blocks.Sources.Constant noise(k=0)
          annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
      equation
        connect(noise.y, y) annotation (Line(
            points={{9,0},{110,0}},
            color={0,0,127}));
        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
                Text(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,170,85},
                fillPattern=FillPattern.Solid,
                textString="0")}),
          Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",       info="<html>
<p>A noise block. Without noise.</p>
</html>"));
      end NoNoise;

      model RandomNoise "RandomNoise noise modeling"
        extends NoiseModel;
        Modelica_Noise.Blocks.Sources.RandomNoise prng(
          useGlobalSeed=true,
          samplePeriod=1/200,
          redeclare function PDF =
              Modelica_Noise.Math.RandomDistributions.Bates (interval={-0.01,
                  0.01}, n=10),
          redeclare function PSD =
              Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.PSD.PSD_IdealLowPass)
          annotation (Placement(transformation(extent={{-12,-10},{8,10}})));

      equation
        connect(prng.y, y) annotation (Line(
            points={{9,0},{110,0}},
            color={0,0,127}));
        annotation (Icon(graphics={           Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255}),
              Rectangle(
                extent={{-80,-10},{-100,10}},
                lineThickness=0.5,
                fillColor={135,135,135},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None),
              Rectangle(
                extent={{-60,-10},{-80,58}},
                lineThickness=0.5,
                fillColor={175,175,175},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None,
                lineColor={0,0,0}),
              Rectangle(
                extent={{-20,-78},{-40,10}},
                lineThickness=0.5,
                fillColor={50,50,50},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None,
                lineColor={0,0,0}),
              Rectangle(
                extent={{-40,-60},{-60,10}},
                lineThickness=0.5,
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None,
                lineColor={0,0,0}),
              Rectangle(
                extent={{60,-62},{40,8}},
                lineThickness=0.5,
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None,
                lineColor={0,0,0}),
              Rectangle(
                extent={{40,-10},{20,88}},
                lineThickness=0.5,
                fillColor={238,238,238},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None,
                lineColor={0,0,0}),
              Rectangle(
                extent={{0,-10},{-20,76}},
                lineThickness=0.5,
                fillColor={215,215,215},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None,
                lineColor={0,0,0}),
              Rectangle(
                extent={{20,-10},{0,58}},
                lineThickness=0.5,
                fillColor={175,175,175},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None,
                lineColor={0,0,0}),
              Rectangle(
                extent={{80,-10},{60,76}},
                lineThickness=0.5,
                fillColor={215,215,215},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None,
                lineColor={0,0,0}),
              Rectangle(
                extent={{100,-10},{80,56}},
                lineThickness=0.5,
                fillColor={175,175,175},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None,
                lineColor={0,0,0}),
              Line(
                points={{-94,-2},{-74,18},{-56,-42},{-30,-68},{-14,38},{6,12},{26,58},
                    {46,-42},{68,38},{96,-2}},
                color={255,0,0},
                thickness=0.5,
                smooth=Smooth.Bezier)}),    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",       info="<html>
<p>A noise block. With noise.</p>
</html>"));
      end RandomNoise;

      model LinearSystemsNoise
        extends NoiseModel;
        Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Noise
          noise(
          y_max=0.01,
          blockType=Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Discrete,
          y_min=-0.01)
          annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));

        inner
          Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.SampleClock
          sampleClock(blockType=Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.BlockType.Discrete,
            sampleTime=1/2000)
          annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
        Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.FilterFIR
          filter1(blockType=Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Discrete,
            L=10)
          annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      equation
        connect(noise.y, filter1.u) annotation (Line(
            points={{-19,0},{-2,0}},
            color={0,0,127}));
        connect(filter1.y, y) annotation (Line(
            points={{21,0},{110,0}},
            color={0,0,127}));
        annotation ( Icon(graphics={
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
</html>",       info="<html>
<p>A noise block. With linear systems noise.</p>
</html>"));
      end LinearSystemsNoise;

      partial model NoiseModel "partial Noise models"
        extends Modelica.Blocks.Interfaces.SO;
        annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",       info="<html>
<p>The noise block interface.</p>
</html>"));
      end NoiseModel;
    annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",     info="<html>
<p>Parts used in the example.</p>
</html>"));
    end Parts;
  annotation (Documentation(info="<html>
<p>In this model several noise scenarios have been prepared:</p>
<ol>
<li>no noise</li>
<li>Noise using RandomNoise</li>
<li>Noise using LinearSystems2</li>
</ol>
<p><br>The frequency content of the signals is comparable:</p>
<p><br>The time and frequency domain plot of the linearsystems noise is:</p>
<p><img src=\"modelica://Noise/Resources/Images/FrequencyLinearSystems2.png\"/></p>
<p>and the time and frequency domain plot of the RandomNoise using a Bates distribution noise is:</p>
<p><br><img src=\"modelica://Noise/Resources/Images/FrequencyRandomNoise_Bates.png\"/></p>
<p><br>This leads to comparable noise signatures. In practice, the simulations using the RandomNoise block are faster, since less time events have to be handled.</p>
</html>",   revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  end Actuator;

  package SystemNoiseInteraction "System - Noise Interacting"
    extends Modelica.Icons.ExamplesPackage;

    model LinearSystemsNoise "Shows the modelling of a noisy sensor"
      extends Modelica.Icons.Example;
      parameter Integer downSampling = 20;

      Parts.Modelica_LinearSystems2.Controller.Noise noise(
        y_min=-0.05,
        y_max=0.05,
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
      Parts.Modelica_LinearSystems2.Controller.FilterFIR filter(
        L=downSampling,
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption,
        specType=Parts.Modelica_LinearSystems2.Controller.Types.FIRspec.MeanValue)
        annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

      inner Parts.Modelica_LinearSystems2.Controller.SampleClock sampleClock(
          sampleTime=1/6000, blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockType.Discrete)
        annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
     Modelica.Blocks.Continuous.CriticalDamping criticalDamping(f=10,
        n=50,
        initType=Modelica.Blocks.Types.Init.InitialState)
       annotation (Placement(transformation(extent={{60,-10},{80,10}})));
    equation
     connect(noise.y, filter.u) annotation (Line(
         points={{-29,0},{-22,0}},
         color={0,0,127}));
      connect(filter.y, criticalDamping.u) annotation (Line(
          points={{1,0},{58,0}},
          color={0,0,127}));
     annotation (  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
               graphics={                    Rectangle(
             extent={{46,38},{92,-20}},
             lineColor={0,127,0},
             fillColor={213,255,170},
             fillPattern=FillPattern.Solid),
                         Rectangle(
             extent={{-90,38},{40,-20}},
             lineColor={127,0,0},
             fillColor={255,170,170},
             fillPattern=FillPattern.Solid),
           Text(
             extent={{-100,100},{96,60}},
             lineColor={0,0,255},
             textString="The noise is generated with 6000 Samples/s between [-0.05 0.05].
A FIR filter is used to average the signal with 20 averages",
             fontSize=16),
           Text(
             extent={{-90,40},{40,20}},
             lineColor={0,0,255},
             fontSize=14,
             textString="Sampled noisy signal averaged using
a 20 point average filter"),
           Text(
             extent={{46,40},{92,20}},
             lineColor={0,0,255},
             fontSize=14,
             textString="Model
")}),    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",     info="<html>
<p>This is maximally realistic implementation of noise, with high noise sampling and a discrete filter. However, it is slow...</p>
</html>"));
    end LinearSystemsNoise;

    model LinearSystemsNoiseSmartAveraging
      "Shows the modelling of a uniform noise sensor with sytem influence"
       extends Modelica.Icons.Example;
       parameter Integer downSampling = 20;
       parameter Real y_max= 0.05 "maximal noise value";
       parameter Real y_min=-y_max "minimal noise value";

      Parts.Modelica_LinearSystems2.Controller.Noise noise1(
        y_min=y_min,
        y_max=y_max,
        firstSeed={23,87,10},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-78,38},{-60,44}})));

      inner Parts.Modelica_LinearSystems2.Controller.SampleClock sampleClock(
          sampleTime=1/300, blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockType.Discrete)
        annotation (Placement(transformation(extent={{8,-60},{28,-40}})));
      Modelica.Blocks.Continuous.CriticalDamping criticalDamping(f=10, n=50,
        initType=Modelica.Blocks.Types.Init.InitialState)
        annotation (Placement(transformation(extent={{56,40},{76,60}})));
      Modelica.Blocks.Math.MultiSum NoiseAdd(nu=20)
        annotation (Placement(transformation(extent={{-10,44},{2,56}})));
      Modelica.Blocks.Math.Gain gain(k=1/20)
        annotation (Placement(transformation(extent={{12,40},{32,60}})));
      Parts.Modelica_LinearSystems2.Controller.Noise noise2(
        y_min=y_min,
        y_max=y_max,
        firstSeed={23,87,20},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-78,26},{-60,32}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise3(
        y_min=y_min,
        y_max=y_max,
        firstSeed={23,87,30},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-78,14},{-60,20}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise4(
        y_min=y_min,
        y_max=y_max,
        firstSeed={23,87,40},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-78,2},{-60,8}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise5(
        y_min=y_min,
        y_max=y_max,
        firstSeed={23,87,50},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-78,-10},{-60,-4}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise6(
        y_min=y_min,
        y_max=y_max,
        firstSeed={23,87,60},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-78,-22},{-60,-16}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise7(
        y_min=y_min,
        y_max=y_max,
        firstSeed={23,87,70},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-78,-34},{-60,-28}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise8(
        y_min=y_min,
        y_max=y_max,
        firstSeed={23,87,80},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-78,-46},{-60,-40}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise9(
        y_min=y_min,
        y_max=y_max,
        firstSeed={23,87,90},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-78,-58},{-60,-52}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise10(
        y_min=y_min,
        y_max=y_max,
        firstSeed={23,87,100},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-78,-70},{-60,-64}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise11(
        y_min=y_min,
        y_max=y_max,
        firstSeed={10,87,187},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-44,38},{-26,44}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise12(
        y_min=y_min,
        y_max=y_max,
        firstSeed={20,87,187},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-44,26},{-26,32}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise13(
        y_min=y_min,
        y_max=y_max,
        firstSeed={30,87,187},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-44,14},{-26,20}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise14(
        y_min=y_min,
        y_max=y_max,
        firstSeed={40,87,187},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-44,2},{-26,8}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise15(
        y_min=y_min,
        y_max=y_max,
        firstSeed={50,87,187},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-44,-10},{-26,-4}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise16(
        y_min=y_min,
        y_max=y_max,
        firstSeed={60,87,187},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-44,-22},{-26,-16}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise17(
        y_min=y_min,
        y_max=y_max,
        firstSeed={70,87,187},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-44,-34},{-26,-28}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise18(
        y_min=y_min,
        y_max=y_max,
        firstSeed={80,87,187},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-44,-46},{-26,-40}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise19(
        y_min=y_min,
        y_max=y_max,
        firstSeed={90,87,187},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-44,-58},{-26,-52}})));

      Parts.Modelica_LinearSystems2.Controller.Noise noise20(
        y_min=y_min,
        y_max=y_max,
        firstSeed={100,87,187},
        blockType=Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
        annotation (Placement(transformation(extent={{-44,-70},{-26,-64}})));

    equation
      connect(gain.u, NoiseAdd.y) annotation (Line(
          points={{10,50},{3.02,50}},
          color={0,0,127}));
      connect(gain.y, criticalDamping.u) annotation (Line(
          points={{33,50},{54,50}},
          color={0,0,127}));
      connect(noise1.y, NoiseAdd.u[1]) annotation (Line(
          points={{-59.1,41},{-54,41},{-54,53.99},{-10,53.99}},
          color={0,0,127}));
      connect(noise2.y, NoiseAdd.u[2]) annotation (Line(
          points={{-59.1,29},{-54,29},{-54,53.57},{-10,53.57}},
          color={0,0,127}));
      connect(noise3.y, NoiseAdd.u[3]) annotation (Line(
          points={{-59.1,17},{-54,17},{-54,53.15},{-10,53.15}},
          color={0,0,127}));
      connect(noise4.y, NoiseAdd.u[4]) annotation (Line(
          points={{-59.1,5},{-54,5},{-54,52.73},{-10,52.73}},
          color={0,0,127}));
      connect(noise5.y, NoiseAdd.u[5]) annotation (Line(
          points={{-59.1,-7},{-54,-7},{-54,52.31},{-10,52.31}},
          color={0,0,127}));
      connect(noise6.y, NoiseAdd.u[6]) annotation (Line(
          points={{-59.1,-19},{-54,-19},{-54,51.89},{-10,51.89}},
          color={0,0,127}));
      connect(noise7.y, NoiseAdd.u[8]) annotation (Line(
          points={{-59.1,-31},{-54,-31},{-54,51.05},{-10,51.05}},
          color={0,0,127}));
      connect(noise8.y, NoiseAdd.u[9]) annotation (Line(
          points={{-59.1,-43},{-54,-43},{-54,50.63},{-10,50.63}},
          color={0,0,127}));
      connect(noise9.y, NoiseAdd.u[10]) annotation (Line(
          points={{-59.1,-55},{-54,-55},{-54,50.21},{-10,50.21}},
          color={0,0,127}));
      connect(noise10.y, NoiseAdd.u[11]) annotation (Line(
          points={{-59.1,-67},{-54,-67},{-54,49.79},{-10,49.79}},
          color={0,0,127}));
      connect(noise11.y, NoiseAdd.u[12]) annotation (Line(
          points={{-25.1,41},{-20,41},{-20,49.37},{-10,49.37}},
          color={0,0,127}));
      connect(noise12.y, NoiseAdd.u[13]) annotation (Line(
          points={{-25.1,29},{-20,29},{-20,48.95},{-10,48.95}},
          color={0,0,127}));
      connect(noise13.y, NoiseAdd.u[14]) annotation (Line(
          points={{-25.1,17},{-20,17},{-20,48.53},{-10,48.53}},
          color={0,0,127}));
      connect(noise14.y, NoiseAdd.u[15]) annotation (Line(
          points={{-25.1,5},{-20,5},{-20,48.11},{-10,48.11}},
          color={0,0,127}));
      connect(noise15.y, NoiseAdd.u[16]) annotation (Line(
          points={{-25.1,-7},{-20,-7},{-20,47.69},{-10,47.69}},
          color={0,0,127}));
      connect(noise16.y, NoiseAdd.u[17]) annotation (Line(
          points={{-25.1,-19},{-20,-19},{-20,47.27},{-10,47.27}},
          color={0,0,127}));
      connect(noise17.y, NoiseAdd.u[18]) annotation (Line(
          points={{-25.1,-31},{-20,-31},{-20,46.85},{-10,46.85}},
          color={0,0,127}));
      connect(noise18.y, NoiseAdd.u[19]) annotation (Line(
          points={{-25.1,-43},{-20,-43},{-20,46.43},{-10,46.43}},
          color={0,0,127}));
      connect(noise19.y, NoiseAdd.u[7]) annotation (Line(
          points={{-25.1,-55},{-20,-55},{-20,51.47},{-10,51.47}},
          color={0,0,127}));
      connect(noise20.y, NoiseAdd.u[20]) annotation (Line(
          points={{-25.1,-67},{-20,-67},{-20,46},{-20,46.01},{-16,46.01},{-10,46.01}},
          color={0,0,127}));
      annotation (  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                graphics={                    Rectangle(
              extent={{44,80},{90,22}},
              lineColor={0,127,0},
              fillColor={213,255,170},
              fillPattern=FillPattern.Solid),
                          Rectangle(
              extent={{-92,80},{40,-80}},
              lineColor={127,0,0},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,100},{100,80}},
              lineColor={0,0,255},
              textString="The noise is generated with 6000 Samples/s between [-0.05 0.05].
A FIR filter is used to average the signal with 20 averages",
              fontSize=16),
            Text(
              extent={{-94,82},{36,62}},
              lineColor={0,0,255},
              fontSize=14,
              textString="Sampled noisy signal averaged using
a 20 point average filter"),
            Text(
              extent={{42,80},{88,60}},
              lineColor={0,0,255},
              fontSize=14,
              textString="Model
")}),     Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",     info="<html>
<p>This is the same approach as in <a href=\"LinearSystemsNoise\">LinearSystemsNoise</a>, but uses an array of noise generators to achieve the same effect. It is faster because the sampling time can be chosen higher!</p>
</html>"));
    end LinearSystemsNoiseSmartAveraging;

    model RandomNoiseNoise "Shows the modelling of a noisy sensor"
       extends Modelica.Icons.Example;
       parameter Integer downSampling = 20;

      Modelica_Noise.Blocks.Sources.RandomNoise prng(
        infiniteFreq=false,
        redeclare function SampleFreeRNG =
            Modelica_Noise.Math.Random.SampleFree.RNG_DIRCS,
        redeclare function SampleBasedRNG =
            Modelica_Noise.Math.Random.SampleBased.RNG_LCG_NumericalRecipes,
        useSampleBasedMethods=false,
        redeclare function PDF = Modelica_Noise.Math.RandomDistributions.Bates
            (interval={-0.05,0.05}, n=20),
        samplePeriod=1/6000*downSampling,
        redeclare function PSD =
            Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.PSD.PSD_WhiteNoise)
        annotation (Placement(transformation(extent={{-38,-10},{-18,10}})));

      Modelica.Blocks.Continuous.CriticalDamping criticalDamping(f=10,
        n=50,
        initType=Modelica.Blocks.Types.Init.InitialState)
        annotation (Placement(transformation(extent={{60,-10},{80,10}})));
      inner Blocks.Sources.GlobalSeed globalSeed
        annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
    equation
      connect(prng.y, criticalDamping.u) annotation (Line(
          points={{-17,0},{58,0}},
          color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}),
                graphics={                    Rectangle(
              extent={{46,38},{92,-20}},
              lineColor={0,127,0},
              fillColor={213,255,170},
              fillPattern=FillPattern.Solid),
                          Rectangle(
              extent={{-90,38},{40,-20}},
              lineColor={127,0,0},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-90,38},{40,18}},
              lineColor={0,0,255},
              fontSize=14,
              textString="Equivalent model of a sampled noisy signal
averaged using a 20 point average filter"),
            Text(
              extent={{46,38},{92,18}},
              lineColor={0,0,255},
              fontSize=14,
              textString="Model
"),         Text(
              extent={{-100,96},{96,56}},
              lineColor={0,0,255},
              fontSize=16,
              textString="Sample free noise generator. The resulting signal mimics the noise of a sampled noisy
signal with 6000 Samples/s between [-0.05 0.05]
that is filtered using a FIR filter to average the signal with 20 averages.")}),
          Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",     info="<html>
<p>This is an elegant approach to implementing noise using the <a href=\"Modelica_Noise.RandomNoise\">Modelica_Noise.RandomNoise</a> block. It is as fast as the <a href=\"Modelica_Noise.Examples.SystemNoiseInteraction.LinearSystemsNoiseSmartAveraging\">LinearSystemsNoiseSmartAveraging</a> implementation, but much more modular.</p>
</html>"));
    end RandomNoiseNoise;
  annotation(Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>Examples demonstrating, how noise interacts with a system simulation and how the simulation speed changes according to the noise implementation.</p>
</html>"));
  end SystemNoiseInteraction;

  package Parts "Contains models for use in examples"
  extends Modelica.Icons.Package;
    package Modelica_LinearSystems2
      "Modelica_LinearSystems2 (Version 2.3.1) - Analysis, Synthesis and Modeling of Continuous and Discrete Linear Systems"
      extends Modelica.Icons.Package;

      extends Modelica.Icons.UnderConstruction;

      package Controller
        "Package of continuous and discrete input/output blocks"
        extends Modelica.Icons.Package;

        block SampleClock
          "Global options for blocks of Controller library (in particular sample clock)"
          import Modelica_Noise;

          parameter Types.BlockType blockType=Types.BlockType.Continuous
            "Type of Sampled blocks"
            annotation (
              Evaluate=true,
              choices(__Dymola_radioButtons=true, choice=Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.BlockType.
                   Continuous "Continuous",
                choice=Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.BlockType.Discrete
                "Discrete"));
          parameter
            .Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Types.Method
            methodType=Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Types.Method.Trapezoidal
            "Discretization method for discrete blocks";
          parameter Modelica.SIunits.Time sampleTime = 1
            "Base sample time for discrete blocks";
          parameter Types.Init initType=Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.Init.SteadyState
            "Type of initialization of Sampled blocks" annotation(Evaluate=true);
          output Boolean sampleTrigger
            "Trigger that is true at every sampleTime"                           annotation(HideResult=true);
        equation
          if blockType == Types.BlockType.Continuous then
             sampleTrigger = false;
          else
             sampleTrigger = sample(sampleTime, sampleTime);
          end if;
          annotation (
            defaultComponentName="sampleClock",
            defaultComponentPrefixes="inner",
            missingInnerMessage="A \"sampleClock\" component is not defined. A default
sampleClock with blockType = Continuous will be used. If this is not desired,
drag Modelica_LinearSystems2.Controller.SampleClock into the top level of your model.",
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                    100}}), graphics={
                Ellipse(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={255,255,255}),
                Line(points={{-100,0},{-36,0}}, color={0,0,0}),
                Line(points={{36,0},{100,0}}, color={0,0,0}),
                Line(points={{-35,0},{30,35}}, color={0,0,0}),
                Text(
                  extent={{-150,-110},{150,-140}},
                  lineColor={0,0,0},
                  textString="%sampleTime s"),
                Ellipse(
                  extent={{-25,-10},{-45,10}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-150,-20},{150,-50}},
                  lineColor={0,0,0},
                  textString="Continuous",
                  visible=blockType==Modelica_LinearSystems2.Controller.Types.BlockType.Continuous),
                Text(
                  extent={{-150,-20},{150,-50}},
                  lineColor={0,0,0},
                  textString="Discrete",
                  visible=blockType==Modelica_LinearSystems2.Controller.Types.BlockType.Discrete),
                Text(
                  extent={{-150,140},{150,100}},
                  lineColor={0,0,255},
                  fillColor={169,199,255},
                  fillPattern=FillPattern.Solid,
                  textString="%name"),
                Ellipse(
                  extent={{45,-10},{25,10}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
            Documentation(info="<html>
<p>
Global block that defines options for all components of the
Controller library that are on the same or on a lower level
as the sampleClock component. In particular it is defined whether
the blocks shall be used by default in a continuous or a
discrete representation. In the latter case, the default
discretization method and the base sample time is defined.
The sample time of a block is an integer multiple of the base sample
time defined in the SampleClock component.
</p>
</html>"));
        end SampleClock;

        block Noise
          "Block that generates a uniform distributed noise output signal at sample instants if discrete and y=0 if continuous"
          extends Icons.PartialBlockIcon(cont=continuous);
          parameter Real y_min "Lower limit of noise band (if not continuous)"
          annotation (Dialog(enable=blockType<>Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Continuous));
          parameter Real y_max "Upper limit of noise band (if not continuous)"
          annotation (Dialog(enable=blockType<>Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Continuous));
          parameter Integer firstSeed[3](
            each min=0,
            each max=255) = {23,87,187}
            "Integer[3] defining random sequence; required element range: 0..255 (if not continuous)"
          annotation (Dialog(enable=blockType<>Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Continuous));
          parameter Types.BlockTypeWithGlobalDefault blockType=Types.BlockTypeWithGlobalDefault.UseSampleClockOption
            "Type of block"
            annotation (
              Evaluate=true,
              HideResult=true,
              Dialog(
                __Dymola_compact=true,
                __Dymola_descriptionLabel=true),
              choices(__Dymola_radioButtons=true, choice=Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.
                   Continuous "Continuous",
                choice=Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Discrete
                "Discrete",
                choice=Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption
                "Dependent on sampleClock"));
          final parameter Boolean continuous=blockType == Types.BlockTypeWithGlobalDefault.Continuous
               or blockType == Types.BlockTypeWithGlobalDefault.UseSampleClockOption
               and sampleClock.blockType == Types.BlockType.Continuous
            "True, if continuous block, otherwise discrete block";
          parameter Integer sampleFactor(min=1) = 1
            "Sample factor for sample time (Ts = sampleFactor * sampleClock.sampleTime) if not continuous"
             annotation (Dialog(enable=blockType<>Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Continuous));
          Modelica.Blocks.Interfaces.RealOutput y
            "Discrete output signal of block"
             annotation(Placement(transformation(extent={{100,-10},{120,10}})));

        protected
          outer SampleClock sampleClock "Global options";
          Internal.DiscreteNoise discretePart(
            y_min=y_min,
            y_max=y_max,
            firstSeed=firstSeed,
            sampleFactor=sampleFactor) if not continuous "Discrete noise";
        equation
          if continuous then
            y = 0.0;
          end if;
        connect(y,discretePart.y);

          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=false,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={
                Polygon(
                  points={{-81,90},{-89,68},{-73,68},{-81,90}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{-81,78},{-81,-90}}, color={192,192,192}),
                Line(points={{-90,-23},{82,-23}}, color={192,192,192}),
                Polygon(
                  points={{91,-22},{69,-14},{69,-30},{91,-22}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{-35,25},{-35,-35},{-25,-35},{-25,-17},{-15,-17},{-15,-45},
                      {-5,-45},{-5,37},{1,37},{1,51},{7,51},{7,-5},{17,-5},{17,7},{23,7},
                      {23,-23},{33,-23},{33,49},{43,49},{43,15},{51,15},{51,-51},{61,-51}},
                    color={0,0,127}),
                Line(points={{-81,-17},{-67,-17},{-67,-1},{-59,-1},{-59,-49},{-51,-49},
                      {-51,-27},{-43,-27},{-43,57},{-35,57},{-35,25}}, color={0,0,127}),
                Line(points={{-90,-54},{84,-54}}, color={255,0,0}),
                Line(points={{-89,62},{85,62}}, color={255,0,0}),
                Text(
                  extent={{-195,76},{-78,50}},
                  lineColor={0,0,0},
                  textString="%y_max"),
                Text(
                  extent={{-195,-38},{-78,-64}},
                  lineColor={0,0,0},
                  textString="%y_min"),
                Text(
                  extent={{-88,-62},{88,-94}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid,
                  textString="%sampleFactor")}),
            Documentation(info="<html>
<p>
If <b>discrete</b> block, the output y is sampled according to sample time
sampleClock.sampleTime * sampleFactor, where sampleClock.sampleTime
is defined globally in the outer component sampleClock and
sampleFactor is an Integer parameter of component Modelica_Noise.
At every sample time, a random output signal y in the range y_min .. y_max
is generated, where y_min and y_max are parameters. A typical
noise signal is shown in the next figure:
</p>
<p align=\"center\">
<img src=\"modelica://Noise/Resources/Images/Controllers/Noise_typicalSignal.png\">
</p>
<p>
The Integer[3] parameter vector <b>firstSeed</b> is used to initialize the
basic random number generator. The 3 elements of firstSeed need
to be in the range [0, 255]. The use of the same seed vector
will lead to the same sequence of numbers when these are computed serially.
This is usually not desired. Therefore, for every usage of block
<b>Noise</b> a different firstSeed should be defined.
</p>
<p>
If <b>continuous</b> block, the output y = 0.0, i.e., no noise signal
is generated. The reason is that the noise can only reasonably be
used in a simulation if it is a discrete signal, i.e., changes
its value only at sample instants. Since a continous block is usually
used to speed up the simulation, the noise should also be turned
off because it will otherwise significantly limit the
maximum step size of the integrator.<br>&nbsp;
</p>
<p>
This noise generator is based on a function that generates
a random real number uniformely in the semi-open range [0.0, 1.0).
The function uses the standard Wichmann-Hill generator,
combining three pure multiplicative congruential generators of
modulus 30269, 30307 and 30323. Its period (how many numbers it
generates before repeating the sequence exactly) is 6,953,607,871,644.
While of much higher quality than the rand() function supplied by
most C libraries, the theoretical properties are much the same
as for a single linear congruential generator of large modulus.
</p>
</html>"));
        end Noise;

        package Icons "Package of icons of controllers"
          extends Modelica.Icons.Package;

          partial block PartialBlockIcon "Icon for a discrete/continuous block"

          protected
            Boolean cont=true;

            annotation (
              Icon(
                coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                  graphics={
                  Rectangle(
                    visible=not cont,
                    extent={{-100,100},{100,-100}},
                    fillColor={213,255,190},
                    fillPattern=FillPattern.Solid,
                    borderPattern=BorderPattern.Raised,
                    pattern=LinePattern.None),
                  Rectangle(
                    visible=cont,
                    extent={{-100,100},{100,-100}},
                    fillColor={230,230,255},
                    fillPattern=FillPattern.Solid,
                    borderPattern=BorderPattern.Raised,
                    pattern=LinePattern.None,
                    lineColor={0,0,0}),           Text(
                  extent={{-150,150},{150,110}},
                  textString="%name",
                  lineColor={0,0,255})}),  Documentation(info="<html>
<p>This partial class is intended to design a <i>default icon for a discrete or continuous block</i>. The background color of this icon depends on the boolean parameter <code>cont</code>.</p>
</html>"));

          end PartialBlockIcon;
          annotation (
            Documentation(info="<html>
<p>
This package contains definitions for the graphical layout of controller models.
The icons can be utilized by inheriting them in the desired class using \"extends\"
or by directly copying the \"icon\" layer.
</p>
</html>"));
        end Icons;

        package Types "Package of type definitions"
          extends Modelica.Icons.Package;

          type BlockType = enumeration(
              Continuous "Continuous block",
              Discrete "Discrete block")
            "Enumeration of block types (continuous, discrete)"
              annotation (Evaluate=true, Documentation(info="<html>
</html>"));
          type BlockTypeWithGlobalDefault = enumeration(
              Continuous "Continuous block",
              Discrete "Discrete block",
              UseSampleClockOption
                "Use blockType defined in sampleClock component")
            "Enumeration of block types (continuous, discrete, sampleBlock.blocktype)"
              annotation (Evaluate=true, Documentation(info="<html>
</html>"));
          type Init = enumeration(
              NoInit
                "No initialization (start values are used as guess values with fixed=false)",

              SteadyState
                "Steady state initialization (derivatives of states are zero)",

              InitialState "Initialization with initial states",
              InitialOutput
                "Initialization with initial outputs (and steady state of the states if possibles)")
            "Enumeration defining initialization of a block"
              annotation (Evaluate=true, Documentation(info="<html>
</html>"));

          type FIRspec = enumeration(
              MeanValue "Mean value FIR filter",
              Window "FIR filter defined by window",
              Coefficients "FIR filter defined by coefficient vector")
            "Enumeration of FIR specification"
              annotation (Evaluate=true, Documentation(info="<html>
</html>"));

          type Window = enumeration(
              Rectangle "Rectangle",
              Bartlett "Bartlett",
              Hann "Hann",
              Hamming "Hamming",
              Blackman "Blackman",
              Kaiser "Kaiser") "Enumeration of window type for FIR filter"
              annotation (Evaluate=true, Documentation(info="<html>
</html>"));
          annotation (
            preferredView="info",
            Documentation(info="<html>
<p>
This package contains type definitions. Generally,
the enumeration type is used to assign a unique choice of parameter
within a model.
</p>
</html>"));
        end Types;

        package Internal
          "Package of internal utilities of controllers (for advanced users only)"
          extends Modelica.Icons.Package;

          block DiscreteNoise "Uniform distributed noise for discrete blocks"
            extends Controller.Icons.PartialBlockIcon(cont=false);

            parameter Real y_min "Lower limit of noise band";
            parameter Real y_max "Upper limit of noise band";
            parameter Integer firstSeed[3](each min=0, each max=255) = {23,87,187}
              "Integer[3] defining random sequence; required element range: 0..255";
            parameter Integer sampleFactor(min=1)=1
              "Noise sample time = sampleClock.sampleTime*sampleFactor";
            final parameter Modelica.SIunits.Time Ts = sampleClock.sampleTime*sampleFactor
              "Sample time";
            Modelica.Blocks.Interfaces.RealOutput y
              "Noise output signal in the range [y_min .. y_max]"
             annotation (Placement(transformation(extent={{100,-10},{120,10}})));

          protected
            outer SampleClock sampleClock "Global options";
            Integer ticks
              "Actual number of base samples starting from the last sample time instant"
                                                                                         annotation(HideResult=true);
            Integer seedState[3] "State of seed"
                                 annotation(HideResult=true);
            Boolean sampleTrigger "Triggers next sample time" annotation(HideResult=true);
            discrete Real noise "Noise in the range 0..1"
                                                 annotation(HideResult=true);
            discrete Real y_sampled "Sampled output" annotation(HideResult=true);
          equation
            if sampleClock.blockType == Types.BlockType.Continuous then
               // no sampling in sampleClock
               sampleTrigger = sample(Ts, Ts);
               ticks = 0;
            else
               when sampleClock.sampleTrigger then
                  ticks = if pre(ticks) < sampleFactor then pre(ticks) + 1 else 1;
               end when;
               sampleTrigger = sampleClock.sampleTrigger and ticks >= sampleFactor;
            end if;

            when {initial(), sampleTrigger} then
               (noise,seedState) = random(pre(seedState));
                y_sampled = y_min + (y_max - y_min)*noise;
            end when;
            y = y_sampled;

          initial equation
            pre(ticks) = 0;
            pre(seedState) = firstSeed;
            annotation (
              Documentation(info="<html>
</html>"),           Icon(graphics={
                  Line(
                    points={{-84,76},{-84,-92}},
                    color={175,175,175}),
                             Line(
                    points={{86,-84},{-94,-84}},
                    color={175,175,175}),
                  Polygon(
                    points={{-84,90},{-92,68},{-76,68},{-84,90}},
                    lineColor={175,175,175},
                    fillColor={175,175,175},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{90,-84},{68,-92},{68,-76},{90,-84}},
                    lineColor={175,175,175},
                    fillColor={175,175,175},
                    fillPattern=FillPattern.Solid),
                  Line(
                    points={{-35,13},{-35,-47},{-25,-47},{-25,-29},{-15,-29},{-15,-57},{-5,-57},
                    {-5,25},{1,25},{1,39},{7,39},{7,-17},{17,-17},{17,-5},{23,-5},{23,-35},
                    { 33,-35},{33,37},{43,37},{43,3},{51,3},{51,-63},{61,-63}},
                    color={0,0,127}),
                  Line(
                    points={{-81,-29},{-67,-29},{-67,-13},{-59,-13},{-59,-61},{-51,-61},{-51,-39},
                    {-43,-39},{-43,45},{-35,45},{-35,13}},
                    color={0,0,127}),
                  Line(
                    points={{-90,-70},{84,-70}},
                    color={255,0,0}),
                  Line(
                    points={{-89,50},{85,50}},
                    color={255,0,0}),
                  Text(
                    extent={{-50,90},{50,60}},
                    lineColor={95,95,95},
                    textString="noise"),
                  Text(
                    extent={{-130,-100},{130,-130}},
                    lineColor={0,0,0},
                    textString="[%y_min .. %y_max]")}));
          end DiscreteNoise;

          function random "Pseudo random number generator"

            input Integer seedIn[3]
              "Integer vector defining random number sequence, e.g., {23,87,187}";
            output Real x "Random number between 0 and 1";
            output Integer seedOut[3]
              "Modified seed to be used for next call of random()";
          algorithm
            seedOut[1] := rem((171*seedIn[1]), 30269);
            seedOut[2] := rem((172*seedIn[2]), 30307);
            seedOut[3] := rem((170*seedIn[3]), 30323);

            // zero is a poor seed, therfore substitute 1;
            for i in 1:3 loop
              if seedOut[i] == 0 then
                seedOut[i] := 1;
              end if;
            end for;

            x := rem((seedOut[1]/30269.0 + seedOut[2]/30307.0 + seedOut[3]/30323.0), 1.0);

            annotation (
              Documentation(info="<html>
<p>
<i>Random</i> generates a sequence of uniform distributed
pseudo-random numbers. The algorithm is a variant of the
multiplicative congruential algorithm, known as the
Wichmann-Hill generator:
</p>
<pre>
   x(k) = (a1*x(k-1)) mod m1
   y(k) = (a2*y(k-1)) mod m2
   z(k) = (a3*z(k-1)) mod m3
   U(k) = (x(k)/m1 + y(k)/m2 + z(k)/m3) mod 1
</pre>
<p>
This generates pseudo-random numbers U(k) uniformly distributed
in the interval (0,1). There are many forms of generators depending
on the parameters m (prime numbers) and a. The sequence needs an
initial Integer vector {x,y,z} known as the seed. The use of the same
seed will lead to the same sequence of numbers.
</p>

<h4>Remarks</h4>
<p>Random number generators (RNG) are pseudo-functions which are not true
functions but algorithms which deliver a fixed sequence of (usually Integer) numbers
which should have a very large period before they repeat itself and
appropriate statistic properties such that the sequence appears to be
a random draw. For real-valued random numbers, the integers are scaled to
the real interval 0.0-1.0. They result in a uniformly distributed random variate
between 0-1, which has to be tranformed to give a random variate of a wanted
distribution. There are two types of techniques for transforming random variates:
</p>
<ul>
<li>Acceptance-Rejection techniques</li>
<li>Transformation techniques</li>
</ul>
<p>
Acceptance-Rejection techniques throw away some of the generated variates and
are thus less efficient. They can not be avoided for all distributions.
A good summary about random number generation and most of the transformation
techniques used below is given in:
</p>
 <address>
 Discrete Event Simulation <br>
 Jerry Banks and John S. Carson II<br>
 Prentice Hall Inc.<br>
 Englewood Cliffs, New Jersey<br>
 </address>
<p>Some of the other references are quoted below.</p>
<pre>
   WICHMANN-HILL RANDOM NUMBER GENERATOR
   Wichmann, B. A. &amp; Hill, I. D. (1982)
     Algorithm AS 183:
     An efficient and portable pseudo-random number generator
     Applied Statistics 31 (1982) 188-190
   see also:
     Correction to Algorithm AS 183
     Applied Statistics 33 (1984) 123
   McLeod, A. I. (1985)
     A remark on Algorithm AS 183
     Applied Statistics 34 (1985),198-200
   In order to completely avoid external functions, all seeds are
   set via parameters. For simulation purposes this is almost
   always the desired behaviour.
   Translated by Hubertus Tummescheit from Python source provided by
   Guido van Rossum translated from C source by Adrian Baddeley.
   http://www.python.org/doc/current/lib/module-random.html
   R A N D O M   V A R I A B L E   G E N E R A T O R S
   distributions on the real line:
   ------------------------------
     normal (Gaussian) 2 versions
</pre>

<h4>Reference Literature:</h4>
<ul>
<li>function random: Wichmann, B. A. &amp; Hill, I. D. (1982), Algorithm AS 183:
  <br>
  An efficient and portable pseudo-random number generator, Applied Statistics 31 (1982) 188-190<br>
  see also: Correction to Algorithm AS 183, Applied Statistics 33 (1984) 123 <br>
  McLeod, A. I. (1985), A remark on Algorithm AS 183, Applied Statistics 34 (1985),198-200</li>
<li>function normalvariate: Kinderman, A.J. and Monahan, J.F., 'Computer generation of random
  variables using the ratio of uniform deviates', ACM Trans Math Software, 3, (1977),
  pp257-260.</li>
<li>function gaussianvariate: Discrete Event Simulation, Jerry Banks and John S. Carson II,
<br>
  Prentice Hall Inc. Englewood Cliffs, New Jersey, page 315/316</li>
</ul>
<p>
Copyright &copy; Hubertus Tummescheit and Department of Automatic Control, Lund University, Sweden.
</p>
<p>
<i>This Modelica function is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in
<a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">ModelicaLicense2</a>.</i>
</p>
</html>"));
          end random;

          function bessel0
            "Polynomial approximation of the zeroth order modified Bessel function"

            input Real x;
            output Real y;
          protected
            Real ax;
            Real a;

          algorithm
            ax := abs(x);
            if ax < 3.75 then
              a := (x/3.75)^2;
              y := 1 + a*(3.5156229 + a*(3.0899424 + a*(1.2067492 + a*(0.2659732 + a*
                (0.0360768 + a*0.0045813)))));
            else
              a := 3.75/ax;
              y := exp(ax)/sqrt(ax)*(0.39894228 + a*(0.01328592 + a*(0.00225319 + a*(
                -0.00157565 + a*(0.00916281 + a*(-0.02057706 + a*(0.02635537 + a*(-0.01647633
                 + a*0.00392377))))))));
            end if;
            annotation (
              Documentation(info="<html>
<p>
Polynomial approximation of the zeroth order modified Bessel function.
The algorithm is taken from&nbsp;[1].
The function is used to calculate the Kaiser-window via <em>calcWindow</em>.
</p>

<h4><a name=\"References\">References</a></h4>
<dl>
<dt>[1] H. W. Press, S.A. Teukolsky, W. Vetterling:
<dd><b>Numerical Reciepes in C: The Art of Scientific Computing</b><br>
       Cambridge UP, 1988
</dl>
</html>",           revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th>Author</th>
    <th>Comment</th>
  </tr>
  <tr>
    <td valign=\"top\">2002-07-10</td>
    <td valign=\"top\">Nico Walther</td>
    <td valign=\"top\">Realization</td>
  </tr>
</table>
</html>"));
          end bessel0;

          block DiscreteFIR "Realization of FIR filter"
            extends Interfaces.PartialDiscreteSISO_equality;
            parameter Real a[:]={1,1} "Coefficients of FIR filter";
          protected
            parameter Integer n = size(a, 1) - 1 annotation(HideResult=true);
            discrete Real x[n] annotation(HideResult=true);
            discrete Real sum[n] annotation(HideResult=true);
            discrete Real y_sampled "Sampled output" annotation(HideResult=true);
          equation
            when {initial(), sampleTrigger} then
               u_sampled = u;
               x[1] = pre(u);
               sum[1] = a[2]*x[1];
               x[2:n] = pre(x[1:n - 1]);
               sum[2:n] = a[3:n + 1]*diagonal(x[2:n]) + sum[1:n - 1];
               y_sampled = a[1]*u + sum[n];
            end when;
            y = y_sampled;
          initial equation
            //u = pre(u);
            x = pre(x);
            //sum = pre(sum);
            annotation (
              Documentation(info="<html>
</html>"),           Icon(graphics={Line(
                    points={{86,-84},{-94,-84}},
                    color={175,175,175}),
                  Line(
                    points={{-84,76},{-84,-92}},
                    color={175,175,175}),
                  Polygon(
                    points={{-84,90},{-92,68},{-76,68},{-84,90}},
                    lineColor={175,175,175},
                    fillColor={175,175,175},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{90,-84},{68,-92},{68,-76},{90,-84}},
                    lineColor={175,175,175},
                    fillColor={175,175,175},
                    fillPattern=FillPattern.Solid),
                  Rectangle(
                    extent={{-84,-84},{-18,4}},
                    lineColor={175,175,175}),
                  Line(
                    points={{-84,28},{-72,28},{-52,26},{-32,18},{-26,14},{-22,10},{-18,4},
                        {-14,-6},{-4,-48},{0,-66},{2,-84}},
                    color={0,0,127}),
                  Line(
                    points={{2,-84},{4,-66},{8,-58},{12,-58},{16,-62},{18,-68},{20,-84}},
                    color={0,0,127}),
                  Line(
                    points={{20,-82},{20,-80},{20,-74},{22,-68},{24,-66},{28,-66},{32,-68},
                        {34,-72},{36,-80},{36,-84},{36,-76},{38,-70},{40,-68},{44,-68},{46,
                        -70},{48,-74},{50,-80},{50,-84},{50,-80},{52,-72},{54,-70},{58,-70},
                        {62,-74},{64,-78},{64,-80},{64,-82},{64,-84}},
                    color={0,0,127}),
                  Text(
                    extent={{-20,60},{80,30}},
                    lineColor={95,95,95},
                    textString="FIR")}));
          end DiscreteFIR;

          function FIR_coefficients
            "Calculates the FIR-filter coefficient vector"
            import
              .Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Types.FilterType;
            import
              .Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.FIRspec;

            input FIRspec specType=Modelica_LinearSystems2.Controller.Types.FIRspec.MeanValue
              "Specification type of FIR filter";
            input Integer L(min=2) = 2 "Length of mean value filter" annotation(Dialog(enable=specType==FIRspec.MeanValue));
            input
              .Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Types.FilterType
              filterType=Modelica_LinearSystems2.Types.FilterType.LowPass
              "Type of filter"
              annotation (Dialog(enable=specType == FIRspec.Window));
            input Integer order(min=1) = 2 "Order of filter" annotation(Dialog(enable=specType==FIRspec.Window));
            input Modelica.SIunits.Frequency f_cut=1 "Cut-off frequency" annotation(Dialog(enable=specType==FIRspec.Window));
            input Modelica.SIunits.Time Ts(min=0) "Sampling time";
            input Types.Window window=Modelica_LinearSystems2.Controller.Types.Window.Rectangle
              "Type of window" annotation(Dialog(enable=specType==FIRspec.Window));
            input Real beta=2.12 "Beta-Parameter for Kaiser-window"
              annotation(Dialog(enable=specType==FIRspec.Window and window==Modelica_LinearSystems2.Controller.Types.Window.Kaiser));
            input Real a_desired[:]={1,1} "FIR filter coefficients" annotation(Dialog(enable=specType==FIRspec.Coefficients));
            output Real a[if specType==FIRspec.MeanValue then L else
                               (if specType == FIRspec.Window then if mod(order,2)>0 and filterType == FilterType.HighPass then order+2 else order+1 else
                               size(a_desired,1))] "Filter coefficients";

          protected
            constant Real pi=Modelica.Constants.pi;
            Boolean isEven=mod(order,2)==0;
            Integer order2 = if not isEven and filterType == FilterType.HighPass then order+1 else order;
            Real Wc=2*pi*f_cut*Ts;
            Integer i;
            Real w[order2 + 1];
            Real k;
          algorithm
           assert(f_cut<=1/(2*Ts),"The cut-off frequency f_cut may not be greater than half the sample frequency (Nyquist frequency), i.e. f_cut <= " + String(1/(2*Ts)) + " but is "+String(f_cut));
            if specType == FIRspec.MeanValue then
              a := fill(1/L, L);
            elseif specType == FIRspec.Window then
              w := Internal.FIR_window(order2 + 1, window, beta);
              for i in 1:order2 + 1 loop
                k := i - 1 - order2/2;
                if i - 1 == order2/2 then
                  a[i] := if filterType == FilterType.LowPass then Wc*w[i]/pi else
                          w[i] - Wc*w[i]/pi;
                else
                  a[i] := if filterType == FilterType.LowPass then sin(k*Wc)*
                    w[i]/(k*pi) else w[i]*(sin(k*pi) - sin(k*Wc))/(k*pi);
                end if;
              end for;
            else
              a := a_desired;
            end if;

            if not isEven and filterType == FilterType.HighPass then
              Modelica.Utilities.Streams.print("The requested order of the FIR filter in FIR_coefficients is odd and has been increased by one to get an even order filter\n");
            end if;

            annotation (
              Documentation(info="<html>
<p>
The FIR-filter synthesis based on the window method. The coefficients are
calculated through a fourier series approximation of the desired amplitude
characteristic. Due to the fact that the Fourier series is truncated, there
will be discontinuities in the magnitude of the filter. Especial at the edge
of the filter the ripple is concentrated (Gibbs-effect). To counteract this,
the filter coefficients are convolved in the frequency domain with the spectrum
of a window function, thus smoothing the edge transitions at any discontinuity.
This convolution in the frequency domain is equivalent to multiplying the filter
coefficients with the window coefficients in the time domain.
</p>
<p>
The filter equation
</p>
<pre>
     y(k) = a0*u(k) + a1*u(k-1) + a2*u(k-2) + ... + an*u(k-n)
</pre>
<p>
implies that the function outputs n+1 coefficients for a n-th order filter. The
coefficients can be weightened with different kind of windows: Rectangle, Bartlett,
Hann, Hamming, Blackman, Kaiser. The beta parameter is only needed by the Kaiser window.
</p>
</html>"));
          end FIR_coefficients;

          function FIR_window
            "Calculation of n-point weighting window for FIR filter"

            import
              .Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.Window;
            input Integer L "Number of Points";
            input Window window "Type of window";
            input Real beta=2.12 "Beta-Parameter for Kaiser-window";
            output Real a[L] "output vector";
          protected
            Integer i=0;
            constant Real pi=Modelica.Constants.pi;
            Real k;
          algorithm
            if window <> Window.Rectangle then
              for i in 1:L loop
                k := i - 1 - (L - 1)/2;
                if window == Window.Bartlett then
                  a[i] := 1 - 2*abs(k)/(L - 1);
                elseif window == Window.Hann then
                  a[i] := 0.5 + 0.5*cos(2*pi*k/(L - 1));
                elseif window == Window.Hamming then
                  a[i] := 0.54 + 0.46*cos(2*pi*k/(L - 1));
                elseif window == Window.Blackman then
                  a[i] := 0.42 + 0.5*cos(2*pi*k/(L - 1)) + 0.08*cos(4*pi*k/(L - 1));
                elseif window == Window.Kaiser then
                  k := 2*beta*sqrt((i - 1)*(L - i))/(L - 1);
                  a[i] := Internal.bessel0(k)/ Internal.bessel0(beta);
                else
                  Modelica.Utilities.Streams.error("window = " + String(window) + " not known");
                end if;
              end for;
            else
              a := ones(L);
            end if;
            annotation (
              Documentation(info="<html>
<p>
Weighting windows are used for digital filter design or spectrum estimation (e.g. DFT)
to increase the quality. In designing FIR-Filter the main role of windowing is to remove
non-ideal effects caused by the endless number of filter coefficients (Gibbs phenomenon).
Multiplying the coefficients with a window damps the coefficients at the beginning and at
the end.
</p>
<p>
The function outputs a L-point vector for a given kind of window. The parameter \"beta\" is
only needed by the Kaiser window. The types of windows are:
</p>
<OL>
<LI>Rectangle</LI>
<LI>Bartlett</LI>
<LI>Hann</LI>
<LI>Hamming</LI>
<LI>Blackman</LI>
<LI>Kaiser</LI>
</OL>
</html>"));
          end FIR_window;
          annotation (Documentation(info="<html>
<p>
Generally, the classes in this package should not be used by the user.
</p>
<p>
This package contains models, functions and parameters designed
to build up other models of higher level.
Some of them cannot be used in an arbitrary way and require
particular knowledge how to set the options in the parameter menu.
Therefore, only advanced users should deal with contained classes.
</p>
</html>"));
        end Internal;

        block FilterFIR
          "Discrete finite impulse response low or high pass filter"
          import
            .Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.FIRspec;
          import
            .Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types.BlockType;
          extends Interfaces.PartialSISO_equality;
          parameter Types.FIRspec specType=
              Modelica_LinearSystems2.Controller.Types.FIRspec.MeanValue
            "Specification type of FIR filter" annotation (Dialog(enable=blockType <>
                  Modelica_LinearSystems2.Controller.Types.BlockType.Continuous));
          parameter Integer L(min=2) = 2 "Length of mean value filter" annotation(Dialog(group="Mean value filter",enable=blockType<>Modelica_LinearSystems2.Controller.Types.BlockType.Continuous and specType==Modelica_LinearSystems2.Controller.Types.FIRspec.MeanValue));
          parameter
            .Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Types.FilterType
            filterType=Modelica_LinearSystems2.Types.FilterType.LowPass
            "Type of filter" annotation (Dialog(group="FIR filter design",
                enable=blockType <> Modelica_LinearSystems2.Controller.Types.BlockType.Continuous
                   and specType == Modelica_LinearSystems2.Controller.Types.FIRspec.Window));
          parameter Integer order(min=1) = 2 "Order of filter" annotation(Dialog(group="FIR filter design",enable=blockType<>Modelica_LinearSystems2.Controller.Types.BlockType.Continuous and specType==Modelica_LinearSystems2.Controller.Types.FIRspec.Window));
          parameter Modelica.SIunits.Frequency f_cut=1 "Cut-off frequency" annotation(Dialog(group="FIR filter design",enable=blockType<>Modelica_LinearSystems2.Controller.Types.BlockType.Continuous and specType==Modelica_LinearSystems2.Controller.Types.FIRspec.Window));
          parameter Types.Window window=Modelica_LinearSystems2.Controller.Types.Window.Rectangle
            "Type of window" annotation(Dialog(group="FIR filter design",enable=blockType<>Modelica_LinearSystems2.Controller.Types.BlockType.Continuous and specType==Modelica_LinearSystems2.Controller.Types.FIRspec.Window));
          parameter Real beta=2.12 "Beta-Parameter for Kaiser-window"
            annotation(Dialog(group="FIR filter design",enable=blockType<>BlockType.Continuous and specType==Modelica_LinearSystems2.Controller.Types.FIRspec.Window and window==Modelica_LinearSystems2.Controller.Types.Window.Kaiser));
          parameter Real a[:]={1,1} "FIR filter coefficients" annotation(Dialog(group="FIR filter defined by coefficient vector",enable=blockType<>Modelica_LinearSystems2.Controller.Types.BlockType.Continuous and specType==Modelica_LinearSystems2.Controller.Types.FIRspec.Coefficients));

        protected
          parameter Real a2[:]=Internal.FIR_coefficients(
              specType,
              L,
              filterType,
              order,
              f_cut,
              sampleClock.sampleTime*sampleFactor,
              window,
              beta,
              a) if  not continuous;
          Internal.DiscreteFIR discretePart(
            sampleFactor=sampleFactor,
            a=a2) if  not continuous "FIR realization";
        equation

          if continuous then
            y = u;
          end if;
        connect(u,discretePart.u);
        connect(y,discretePart.y);

          annotation (defaultComponentName="filter",Icon(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
                Polygon(
                  points={{-82,88},{-90,66},{-74,66},{-82,86},{-82,88}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{-82,76},{-82,-92}}, color={192,192,192}),
                Polygon(
                  points={{88,-82},{66,-74},{66,-90},{88,-82}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{-92,-82},{80,-82}}, color={192,192,192}),
                Text(
                  extent={{-14,32},{92,-10}},
                  lineColor={192,192,192},
                  textString="FIR"),
                Rectangle(
                  extent={{-82,-82},{-16,4}},
                  lineColor={160,160,164},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Backward),
                Line(points={{-82,30},{-70,30},{-50,28},{-30,20},{-24,16},{-20,12},{-16,
                      6},{-12,-4},{-2,-46},{2,-64},{4,-82}}, color={0,0,127}),
                Line(points={{4,-82},{6,-64},{10,-56},{14,-56},{18,-60},{20,-66},{22,-82}},
                    color={0,0,127}),
                Line(points={{22,-80},{22,-78},{22,-72},{24,-66},{26,-64},{30,-64},{34,
                      -66},{36,-70},{38,-78},{38,-82},{38,-74},{40,-68},{42,-66},{46,-66},
                      {48,-68},{50,-72},{52,-78},{52,-82},{52,-78},{54,-70},{56,-68},{
                      60,-68},{64,-72},{66,-76},{66,-78},{66,-80},{66,-82}}, color={0,0,
                      127}),
                Text(
                  extent={{-80,90},{100,60}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid,
                  textString="%sampleFactor")}));
        end FilterFIR;

        package Interfaces
          "Package of interfaces (partial blocks) of controllers"
          extends Modelica.Icons.BasesPackage;

          partial block PartialDiscreteSISO_equality
            "Common discrete part of blocks extending from PartialSISO_equality"
            extends Controller.Icons.PartialBlockIcon(cont=false);

            parameter Integer sampleFactor(min=1)=1
              "Sample factor (Ts = sampleFactor * sampleClock.sampleTime)";
            final parameter Modelica.SIunits.Time Ts = sampleClock.sampleTime*sampleFactor
              "Sample time" annotation(HideResult=false);
            Modelica.Blocks.Interfaces.RealInput u
              "Continuous or discrete input signal of block"
               annotation(Placement(transformation(extent={{-140,-20},{-100,20}})));
            Modelica.Blocks.Interfaces.RealOutput y
              "Continuous or discrete output signal of block"
               annotation(Placement(transformation(extent={{100,-10},{120,10}})));

          protected
            outer SampleClock sampleClock "Global options"                      annotation(HideResult=true);

           // Derived quantities
            discrete Real u_sampled "Sampled continuous input signal u";
            Integer ticks
              "Actual number of base samples starting from the last sample time instant"
                                                                                         annotation(HideResult=true);
            Boolean sampleTrigger "Triggers next sample time" annotation(HideResult=true);

          equation
            if sampleClock.blockType == Types.BlockType.Continuous then
               // no sampling in sampleClock
               sampleTrigger = sample(Ts, Ts);
               ticks = 0;
            else
               when sampleClock.sampleTrigger then
                  ticks = if pre(ticks) < sampleFactor then pre(ticks) + 1 else 1;
               end when;
               sampleTrigger = sampleClock.sampleTrigger and ticks >= sampleFactor;
            end if;

          initial equation
            pre(ticks) = 0;
            annotation (
              Documentation(info="<html>
</html>"));
          end PartialDiscreteSISO_equality;

          partial block PartialSISO_equality
            "Partial Single Input Single Output (continuous or discrete) control block of Controller library where usually y=u if continuous block"
            extends Icons.PartialBlockIcon(cont=continuous);
            import
              .Modelica_Noise.Blocks.Examples.Parts.Modelica_LinearSystems2.Controller.Types;

            parameter Types.BlockTypeWithGlobalDefault blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption
              "Type of block"
              annotation (
                Evaluate=true,
                HideResult=true,
                Dialog(
                  __Dymola_compact=true,
                  __Dymola_descriptionLabel=true),
                choices(__Dymola_radioButtons=true, choice=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Continuous
                  "Continuous",
                  choice=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Discrete
                  "Discrete",
                  choice=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption
                  "Dependent on sampleClock"));
            final parameter Boolean continuous = blockType == Types.BlockTypeWithGlobalDefault.Continuous or
                                           blockType == Types.BlockTypeWithGlobalDefault.UseSampleClockOption and
                                           sampleClock.blockType == Types.BlockType.Continuous
              "True, if continuous block, otherwise discrete block";
            parameter Integer sampleFactor(min=1)=1
              "Sample factor for sample time (Ts = sampleFactor * sampleClock.sampleTime)"
               annotation (Dialog(enable=blockType<>Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.Continuous,
               group="Discrete block parameters"));
            Modelica.Blocks.Interfaces.RealInput u
              "Continuous or discrete input signal of block"
               annotation(Placement(transformation(extent={{-140,-20},{-100,20}})));
            Modelica.Blocks.Interfaces.RealOutput y
              "Continuous or discrete output signal of block"
               annotation(Placement(transformation(extent={{100,-10},{120,10}})));

          protected
            outer SampleClock sampleClock "Global options";
            annotation (
              Documentation(info="<html>
<p>
If <b>discrete</b> block, the output y is sampled according to sample time
sampleClock.sampleTime * sampleFactor, where sampleClock.sampleTime
is defined globally in the outer component sampleClock and
sampleFactor is an Integer parameter of component Sampler.
</p>
<p>
If <b>continuous</b> block, the output y is identical to the input u.
</p>
</html>"));
          end PartialSISO_equality;
          annotation (
            Documentation(info="<html>
<p>
This package contains the partial blocks of controller models. The
components define global parameters, such as <em>startTime</em>, <em>method</em>,
<em>Ts</em> or <em>steadyStateStart</em> and handle the input/output conversation.
</p>
</html>"));
        end Interfaces;
        annotation (Documentation(info="<html>
<p>
This package provides input/output blocks where every
block is available in a <b>continuous</b> and a <b>discrete</b> (sampled)
representation. A block is defined via its <b>continuous
parameterization</b>. By specifying a discretization method and
a sample time, the discrete representation is automatically
derived from the continuous form. The defaults of the most
important options for <b>all blocks</b> are set in the global SampleClock
component (via inner/outer).
As a result, it is, e.g., easy to switch quickly
between a continuous and a discrete representation of all
blocks of a controller.
</p>

<p>
Examples to demonstrate the technique are given in the package
<a href=\"modelica://Modelica_LinearSystems2.Controller.Examples\">Examples</a>.
Especially, the continuous or discrete control of a simple flexible
drive with a P-PI cascade controller is demonstrated in example
<a href=\"modelica://Modelica_LinearSystems2.Controller.Examples.SimpleControlledDrive\">SimpleControlledDrive</a>.
</p>

<p>
<img src=\"modelica://Noise/Resources/Images/Controllers/Examples/SimpleControlledDrive_Layout.png\">
</p>
</html>"));
      end Controller;

      package Types "Package of type definitions"
        extends Modelica.Icons.Package;

        type Method = enumeration(
            ExplicitEuler "Discretization with explicit Euler integration",
            ImplicitEuler "Discretization with implicit Euler integration",
            Trapezoidal
              "Discretization with trapezoidal integration (Tustins method, recommended)",

            ImpulseExact "Exact discretization for impulse inputs",
            StepExact
              "Exact discretization for step inputs (zero-order hold equivalent)",

            RampExact
              "Exact discretization for ramp inputs (first-order hold equivalent)")
          "Enumeration of discretization methods"
            annotation (Evaluate=true, Documentation(info="<html>
</html>"));

        type FilterType = enumeration(
            LowPass "Low pass filter",
            HighPass "High pass filter",
            BandPass "Band pass filter",
            BandStop "Band stop / notch filter")
          "Enumeration of analog filter types (high pass or low pass)"
            annotation (Evaluate=true, Documentation(info="<html>
</html>"));

        annotation (
          preferredView="info",
          Documentation(info="<html>
<p>
This package contains type definitions. Generally,
the enumeration type is used to assign a unique choice of parameter
within a model.
</p>
</html>"));
      end Types;
    annotation (
      preferredView="info",
      versionBuild=1,
      versionDate="2013-10-01",
      dateModified = "2013-10-01 15:20:01Z",
      revisionId="$Id:: package.mo 7060 2013-10-01 13:37:08Z #$",
      conversion(
        noneFromVersion="2.0",
        noneFromVersion="2.1",
        noneFromVersion="2.2",
        noneFromVersion="2.3"),
      Documentation(info="<html>
<p>Library <b>Modelica_LinearSystems2</b> is a Modelica package providing different representations of linear, time invariant differential and difference equation systems. For example, record <a href=\"modelica://Modelica_LinearSystems2.StateSpace\">StateSpace</a> defines a linear time invariant differential equation system in state space form: </p>
<blockquote><code>der(<b>x</b>) = <b>A</b> * <b>x</b> + <b>B</b> * <b>u</b></code></blockquote>
<blockquote><code>    <b>y</b>  = <b>C</b> * <b>x</b> + <b>D</b> * <b>u</b></code></blockquote>
<p>Operators are overloaded to work conveniently with these system descriptions in an interactive environment, e.g. to multiply transfer functions or to operate on complex numbers. About 180 functions are provided to operate on these data structures, e.g. to compute eigenvalues, zeros, step responses, to design pole-placement and LQG controllers, to plot step responses, frequency responses, eigenvalues, to convert between different description forms, or to generate a linear system description by linearization of a Modelica model. </p>
<p>Furthermore, in subpackage <a href=\"modelica://Modelica_LinearSystems2.Controller\">Controller</a> about 20 input/output blocks of linear systems are provided that are based on the different representation forms, e.g. PID, StateSpace, Filter blocks. A unique feature of these blocks is that it is very convenient to quickly switch between a continuous and a discrete block representation. Also, templates are provided to quickly built-up standard controller structures. </p>
<p>For an introduction, have especially a look at: </p>
<ul>
<li><a href=\"modelica://Modelica_LinearSystems2.UsersGuide.GettingStarted\">Getting started</a> provides an overview of the Library in the <a href=\"modelica://Modelica_LinearSystems2.UsersGuide\">User&apos;s Guide</a>.</li>
<li><a href=\"modelica://Modelica_LinearSystems2.UsersGuide.ReleaseNotes\">Release Notes</a> summarizes the changes of new versions of this package.</li>
<li><a href=\"modelica://Modelica_LinearSystems2.UsersGuide.Contact\">Contact</a> gives the contact information for this library.</li>
<li>In an interactive environment, it is useful to run first the script &QUOT;_abbreviations.mos&QUOT; in directory &QUOT;Modelica_LinearSystems2/Resources/Scripts&QUOT; in order to set useful abbreviations: ss, tf, zp, poly, Complex, Plot, s, p, j. </li>
</ul>
<p>It is planned to include this library in a future version of the Modelica Standard Library. </p>
<h4>Important notice!</h4>
<h4>This sub-package of Modelica_Noise.Examples.Parts is a copy from the Modelica_LinearSystems2 library. Please refer to the original library!</h4>
<table cellspacing=\"2\" cellpadding=\"2\" border=\"0\"><tr>
<td rowspan=\"3\" valign=\"middle\"><p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> </p></td>
<td valign=\"top\"><p><br><b>Licensed by DLR under the Modelica License 2</b></p></td>
</tr>
<tr>
<td valign=\"top\"><h4>Copyright &copy; 2005-2012, DLR Institute of Robotics and Mechatronics</h4></td>
</tr>
<tr>
<td valign=\"top\"><h4>Copyright &copy; 2012-2013, DLR Institute of System Dynamics and Control</h4></td>
</tr>
</table>
<p><br><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica license 2, see the license conditions (including the disclaimer of warranty) in the <a href=\"modelica://Modelica_LinearSystems2.UsersGuide.ModelicaLicense2\">User&apos;s Guide</a> or at <a href=\"http://www.Modelica.org/licenses/ModelicaLicense2\">http://www.Modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Text(
            extent={{-100,40},{100,-100}},
            lineColor={255,0,0},
            textString="!")}));
    end Modelica_LinearSystems2;
  end Parts;
annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This package contains examples of how to use the Noise library.</p>
</html>"));
end Examples;
