within AdvancedNoise.Examples;
model FaultTrigger "Demonstrates using the fault trigger model"
  extends Modelica.Icons.Example;
  Sources.FaultTrigger faultTrigger
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Modelica.Blocks.Sources.Constant const(k=1/1)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
equation
  connect(const.y, faultTrigger.u)
    annotation (Line(points={{-59,50},{-40,50},{-22,50}}, color={0,0,127}));
end FaultTrigger;
