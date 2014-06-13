within Noise.Examples;
model CompareRNG
  "An example to compare the generated random numbers of differenzt RNGs"
  extends Modelica.Icons.Example;
protected
  model RNG_Design0
    extends Modelica.Blocks.Interfaces.SO;
    extends Modelica.Blocks.Interfaces.DiscreteBlockIcon;
    //output Real y;
    Design.Experimentation.RandomNumber.Functions.seed s;
  equation
    when sample(0,0.01) then
      (y,s) = .Design.Experimentation.RandomNumber.Functions.random(pre(s));
    end when;
  end RNG_Design0;
public
  Noise.PRNG Weyl(useSampleBasedMethods=false, redeclare function SampleFreeRNG
      = Noise.RNG.SampleFree.RNG_Weyl)
    annotation (Placement(transformation(extent={{-32,2},{-12,22}})));
  Noise.PRNG DIRCS(useSampleBasedMethods=false, redeclare function
      SampleFreeRNG = Noise.RNG.SampleFree.RNG_DIRCS)
    annotation (Placement(transformation(extent={{-72,2},{-52,22}})));
  Noise.PRNG NumericalRecipes(useSampleBasedMethods=true, redeclare function
      SampleBasedRNG = Noise.RNG.SampleBased.RNG_LCG_NumericalRecipes)
    annotation (Placement(transformation(extent={{-72,-78},{-52,-58}})));
  Noise.PRNG VAX(useSampleBasedMethods=true, redeclare function SampleBasedRNG
      = Noise.RNG.SampleBased.RNG_LCG_VAX)
    annotation (Placement(transformation(extent={{-34,-78},{-14,-58}})));
  Modelica_LinearSystems2.Controller.Noise LinearSystems2(y_min=0, y_max=1)
    annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
  inner Modelica_LinearSystems2.Controller.SampleClock sampleClock(blockType=
        Modelica_LinearSystems2.Controller.Types.BlockType.Discrete, sampleTime=
       0.01) annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  RNG_Design0 Design
    annotation (Placement(transformation(extent={{0,70},{20,90}})));
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
</html>", info="<html>
<p>This example compares all currently available RNG algorithms and also compares them to the current state-of-the-art in Modelica.</p>
</html>"));
end CompareRNG;
