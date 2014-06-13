within Noise.Examples.SystemNoiseInteraction;
model LinearSystemsNoiseSmartAveraging
  "Shows the modelling of a uniform noise sensor with sytem influence"
   extends Modelica.Icons.Example;
   parameter Integer downSampling = 20;
   parameter Real y_max= 0.05 "maximal noise value";
   parameter Real y_min=-y_max "minimal noise value";

  Modelica_LinearSystems2.Controller.Noise noise1(
    y_min=y_min,
    y_max=y_max,
    firstSeed={23,87,10},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-78,38},{-60,44}})));

  inner Modelica_LinearSystems2.Controller.SampleClock
                                                    sampleClock(
      sampleTime=1/300, blockType=Modelica_LinearSystems2.Controller.Types.BlockType.Discrete)
    annotation (Placement(transformation(extent={{8,-60},{28,-40}})));
  Modelica.Blocks.Continuous.CriticalDamping criticalDamping(f=10, n=50,
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{56,40},{76,60}})));
  Modelica.Blocks.Math.MultiSum NoiseAdd(nu=20)
    annotation (Placement(transformation(extent={{-10,44},{2,56}})));
  Modelica.Blocks.Math.Gain gain(k=1/20)
    annotation (Placement(transformation(extent={{12,40},{32,60}})));
  Modelica_LinearSystems2.Controller.Noise noise2(
    y_min=y_min,
    y_max=y_max,
    firstSeed={23,87,20},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-78,26},{-60,32}})));

  Modelica_LinearSystems2.Controller.Noise noise3(
    y_min=y_min,
    y_max=y_max,
    firstSeed={23,87,30},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-78,14},{-60,20}})));

  Modelica_LinearSystems2.Controller.Noise noise4(
    y_min=y_min,
    y_max=y_max,
    firstSeed={23,87,40},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-78,2},{-60,8}})));

  Modelica_LinearSystems2.Controller.Noise noise5(
    y_min=y_min,
    y_max=y_max,
    firstSeed={23,87,50},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-78,-10},{-60,-4}})));

  Modelica_LinearSystems2.Controller.Noise noise6(
    y_min=y_min,
    y_max=y_max,
    firstSeed={23,87,60},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-78,-22},{-60,-16}})));

  Modelica_LinearSystems2.Controller.Noise noise7(
    y_min=y_min,
    y_max=y_max,
    firstSeed={23,87,70},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-78,-34},{-60,-28}})));

  Modelica_LinearSystems2.Controller.Noise noise8(
    y_min=y_min,
    y_max=y_max,
    firstSeed={23,87,80},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-78,-46},{-60,-40}})));

  Modelica_LinearSystems2.Controller.Noise noise9(
    y_min=y_min,
    y_max=y_max,
    firstSeed={23,87,90},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-78,-58},{-60,-52}})));

  Modelica_LinearSystems2.Controller.Noise noise10(
    y_min=y_min,
    y_max=y_max,
    firstSeed={23,87,100},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-78,-70},{-60,-64}})));

  Modelica_LinearSystems2.Controller.Noise noise11(
    y_min=y_min,
    y_max=y_max,
    firstSeed={10,87,187},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-44,38},{-26,44}})));

  Modelica_LinearSystems2.Controller.Noise noise12(
    y_min=y_min,
    y_max=y_max,
    firstSeed={20,87,187},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-44,26},{-26,32}})));

  Modelica_LinearSystems2.Controller.Noise noise13(
    y_min=y_min,
    y_max=y_max,
    firstSeed={30,87,187},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-44,14},{-26,20}})));

  Modelica_LinearSystems2.Controller.Noise noise14(
    y_min=y_min,
    y_max=y_max,
    firstSeed={40,87,187},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-44,2},{-26,8}})));

  Modelica_LinearSystems2.Controller.Noise noise15(
    y_min=y_min,
    y_max=y_max,
    firstSeed={50,87,187},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-44,-10},{-26,-4}})));

  Modelica_LinearSystems2.Controller.Noise noise16(
    y_min=y_min,
    y_max=y_max,
    firstSeed={60,87,187},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-44,-22},{-26,-16}})));

  Modelica_LinearSystems2.Controller.Noise noise17(
    y_min=y_min,
    y_max=y_max,
    firstSeed={70,87,187},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-44,-34},{-26,-28}})));

  Modelica_LinearSystems2.Controller.Noise noise18(
    y_min=y_min,
    y_max=y_max,
    firstSeed={80,87,187},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-44,-46},{-26,-40}})));

  Modelica_LinearSystems2.Controller.Noise noise19(
    y_min=y_min,
    y_max=y_max,
    firstSeed={90,87,187},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-44,-58},{-26,-52}})));

  Modelica_LinearSystems2.Controller.Noise noise20(
    y_min=y_min,
    y_max=y_max,
    firstSeed={100,87,187},
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
    annotation (Placement(transformation(extent={{-44,-70},{-26,-64}})));

equation
  connect(gain.u, NoiseAdd.y) annotation (Line(
      points={{10,50},{3.02,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, criticalDamping.u) annotation (Line(
      points={{33,50},{54,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise1.y, NoiseAdd.u[1]) annotation (Line(
      points={{-59.1,41},{-54,41},{-54,53.99},{-10,53.99}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise2.y, NoiseAdd.u[2]) annotation (Line(
      points={{-59.1,29},{-54,29},{-54,53.57},{-10,53.57}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise3.y, NoiseAdd.u[3]) annotation (Line(
      points={{-59.1,17},{-54,17},{-54,53.15},{-10,53.15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise4.y, NoiseAdd.u[4]) annotation (Line(
      points={{-59.1,5},{-54,5},{-54,52.73},{-10,52.73}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise5.y, NoiseAdd.u[5]) annotation (Line(
      points={{-59.1,-7},{-54,-7},{-54,52.31},{-10,52.31}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise6.y, NoiseAdd.u[6]) annotation (Line(
      points={{-59.1,-19},{-54,-19},{-54,51.89},{-10,51.89}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise7.y, NoiseAdd.u[8]) annotation (Line(
      points={{-59.1,-31},{-54,-31},{-54,51.05},{-10,51.05}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise8.y, NoiseAdd.u[9]) annotation (Line(
      points={{-59.1,-43},{-54,-43},{-54,50.63},{-10,50.63}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise9.y, NoiseAdd.u[10]) annotation (Line(
      points={{-59.1,-55},{-54,-55},{-54,50.21},{-10,50.21}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise10.y, NoiseAdd.u[11]) annotation (Line(
      points={{-59.1,-67},{-54,-67},{-54,49.79},{-10,49.79}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise11.y, NoiseAdd.u[12]) annotation (Line(
      points={{-25.1,41},{-20,41},{-20,49.37},{-10,49.37}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise12.y, NoiseAdd.u[13]) annotation (Line(
      points={{-25.1,29},{-20,29},{-20,48.95},{-10,48.95}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise13.y, NoiseAdd.u[14]) annotation (Line(
      points={{-25.1,17},{-20,17},{-20,48.53},{-10,48.53}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise14.y, NoiseAdd.u[15]) annotation (Line(
      points={{-25.1,5},{-20,5},{-20,48.11},{-10,48.11}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise15.y, NoiseAdd.u[16]) annotation (Line(
      points={{-25.1,-7},{-20,-7},{-20,47.69},{-10,47.69}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise16.y, NoiseAdd.u[17]) annotation (Line(
      points={{-25.1,-19},{-20,-19},{-20,47.27},{-10,47.27}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise17.y, NoiseAdd.u[18]) annotation (Line(
      points={{-25.1,-31},{-20,-31},{-20,46.85},{-10,46.85}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise18.y, NoiseAdd.u[19]) annotation (Line(
      points={{-25.1,-43},{-20,-43},{-20,46.43},{-10,46.43}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise19.y, NoiseAdd.u[7]) annotation (Line(
      points={{-25.1,-55},{-20,-55},{-20,51.47},{-10,51.47}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(noise20.y, NoiseAdd.u[20]) annotation (Line(
      points={{-25.1,-67},{-20,-67},{-20,46},{-20,46.01},{-16,46.01},{-10,46.01}},
      color={0,0,127},
      smooth=Smooth.None));
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
")}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This is the same approach as in <a href=\"LinearSystemsNoise\">LinearSystemsNoise</a>, but uses an array of noise generators to achieve the same effect. It is faster because the sampling time can be chosen higher!</p>
</html>"));
end LinearSystemsNoiseSmartAveraging;
