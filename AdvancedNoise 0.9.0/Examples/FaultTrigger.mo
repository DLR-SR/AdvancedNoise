within AdvancedNoise.Examples;
model FaultTrigger "Demonstrates using the fault trigger model"
  extends Modelica.Icons.Example;
  Sources.FaultTrigger faultTrigger
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Modelica.Blocks.Sources.Constant failureRate(k=10)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  inner Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=true)
    annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
  Modelica.Blocks.MathInteger.TriggeredAdd triggeredAdd(use_reset=false,
      use_set=false)
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression(y=1)
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  Modelica.Blocks.Sources.RealExpression reconstructedFailureRate(y=if
        triggeredAdd.y < 1 then 0 else triggeredAdd.y/time)
    "The failure rate reconstructed from the simulation"
    annotation (Placement(transformation(extent={{-20,-20},{80,0}})));
equation
  connect(failureRate.y, faultTrigger.u)
    annotation (Line(points={{-59,30},{-40,30},{-22,30}}, color={0,0,127}));
  connect(faultTrigger.y, triggeredAdd.trigger) annotation (Line(points={{1,30},
          {12,30},{24,30},{24,58}}, color={255,0,255}));
  connect(integerExpression.y, triggeredAdd.u)
    annotation (Line(points={{1,70},{8,70},{16,70}}, color={255,127,0}));
  annotation (experiment(StopTime=10));
end FaultTrigger;
