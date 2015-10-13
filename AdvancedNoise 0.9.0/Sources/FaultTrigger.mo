within AdvancedNoise.Sources;
model FaultTrigger "Triggers a fault given a time history of the failure rate"
  extends Modelica.Blocks.Interfaces.partialBooleanSO(y(start=false,fixed=true));

  Modelica.Blocks.Interfaces.RealInput u "The current failure rate"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
          rotation=0)));

// Calculate the probability to have failed by now
// => (1-F) is the probability to not yet have failed by now
// =>   u   is the probability/time to fail right now
// The fault is triggered, when F reaches a random threshold r in (0,1).
public
  Real F(min=0,max=1) "The current probability to have failed already";
equation
  der(F) = (1-F) * u;
  y      = F >= r;

// We need a random number to determine the trigger for F
protected
  outer Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    "Definition of global seed via inner/outer";
public
  Real r(min=0,max=1) "Value to trigger the fault";
equation
  when {initial(), reset and pre(y)} then
    r = globalSeed.random();
    reinit(F, 0.0);
  end when;

// Does the fault reset and is triggered again?
public
  input Boolean reset = true "=true: fault is triggered multiple times"
    annotation(Dialog);

  annotation (Icon(graphics={
        Line(points={{-88,-20},{-82,0},{-76,-20},{-88,20}}, color={28,108,200}),
        Line(points={{-54,74},{-54,-50},{80,-50}}, color={28,108,200}),
        Line(points={{-54,-50},{-50,-34},{-38,-2},{-24,20},{-6,40},{10,52},{26,60},
              {48,64},{64,66},{70,66}}, color={28,108,200}),
        Line(points={{-54,38},{72,38}}, color={255,0,0})}));

end FaultTrigger;
