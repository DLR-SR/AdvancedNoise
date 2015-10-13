within AdvancedNoise.Sources;
model FaultTrigger "Triggers a fault given a time history of the failure rate"
  extends Modelica.Blocks.Icons.PartialBooleanBlock;
  Modelica.Blocks.Interfaces.RealInput u "The current failure rate"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
          rotation=0)));
  Modelica.Blocks.Interfaces.BooleanOutput y "=true, if the fault is triggered"
    annotation (Placement(transformation(extent={{100,-10},{120,10}},
          rotation=0)));

// Calculate the probabilities
public
  Real F(min=0,max=1) "The current probability to have failed already";
equation
  der(F) = (1-F) * u;

// Generate the next probability to match

y=F>0.5;

end FaultTrigger;
