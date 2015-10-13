within AdvancedNoise.Sources;
model FaultTrigger "Triggers a fault given a time history of the failure rate"
  extends Modelica.Blocks.Icons.PartialBooleanBlock;
  Modelica.Blocks.Interfaces.RealInput u "The current failure rate"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
          rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput y "=true, if the fault is triggered"
    annotation (Placement(transformation(extent={{100,-10},{120,10}},
          rotation=0)));

// Calculate the probability to have failed by now
// => (1-F) is the probability to not yet have failed by now
// =>   u   is the probability/time to fail right now
// The fault is triggered, when F reaches a random threshold r in (0,1).
public
  Real F(min=0,max=1) "The current probability to have failed already";
equation
  der(F) = (1-F) * u;
  y      = F > r;

// We need a random number to determine the trigger for F
protected
  outer Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed
    "Definition of global seed via inner/outer";
public
  Real r(min=0,max=1) "Value to trigger the fault";
equation
  when {initial(), pre(y)} then
    r = globalSeed.random();
    reinit(F,0);
  end when;

end FaultTrigger;
