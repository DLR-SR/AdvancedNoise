within Noise.Examples.SystemNoiseInteraction;
model LinearSystemsNoise "Shows the modelling of a noisy sensor"
  extends Modelica.Icons.Example;
  parameter Integer downSampling = 20;

 Modelica_LinearSystems2.Controller.Noise
                                      noise(
   y_min=-0.05,
   y_max=0.05,
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption)
   annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
 Modelica_LinearSystems2.Controller.FilterFIR
                                       filter(
   L=downSampling,
    blockType=Modelica_LinearSystems2.Controller.Types.BlockTypeWithGlobalDefault.UseSampleClockOption,
    specType=Modelica_LinearSystems2.Controller.Types.FIRspec.MeanValue)
   annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

 inner Modelica_LinearSystems2.Controller.SampleClock
                                                  sampleClock(sampleTime=1/6000,
      blockType=Modelica_LinearSystems2.Controller.Types.BlockType.Discrete)
   annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
 Modelica.Blocks.Continuous.CriticalDamping criticalDamping(f=10,
    n=50,
    initType=Modelica.Blocks.Types.Init.InitialState)
   annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
 connect(noise.y, filter.u) annotation (Line(
     points={{-29,0},{-22,0}},
     color={0,0,127},
     smooth=Smooth.None));
  connect(filter.y, criticalDamping.u) annotation (Line(
      points={{1,0},{58,0}},
      color={0,0,127},
      smooth=Smooth.None));
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
")}),Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This is maximally realistic implementation of noise, with high noise sampling and a discrete filter. However, it is slow...</p>
</html>"));
end LinearSystemsNoise;
