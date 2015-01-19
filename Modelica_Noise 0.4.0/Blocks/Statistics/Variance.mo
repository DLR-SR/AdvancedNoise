within Modelica_Noise.Blocks.Statistics;
block Variance "Calculates the empirical variance of its input signal"
  extends Modelica.Blocks.Interfaces.BlockIcon;

  Modelica.Blocks.Interfaces.RealInput u "Noisy input signal" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Variance of the input signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  ContinuousMean mean1
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  ContinuousMean mean2
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Math.MultiProduct squared(nu=2)
    annotation (Placement(transformation(extent={{-20,-6},{-8,6}})));
  Modelica.Blocks.Math.Feedback subtract
    annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
  Modelica.Blocks.Math.Max max
    annotation (Placement(transformation(extent={{52,-10},{72,10}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
equation
  connect(mean1.u, u) annotation (Line(
      points={{-82,-30},{-90,-30},{-90,0},{-120,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mean1.y, subtract.u2) annotation (Line(
      points={{-59,-30},{-44,-30},{-44,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(u, subtract.u1) annotation (Line(
      points={{-120,0},{-52,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(subtract.y, squared.u[1]) annotation (Line(
      points={{-35,0},{-28,0},{-28,2.1},{-20,2.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(subtract.y, squared.u[2]) annotation (Line(
      points={{-35,0},{-28,0},{-28,-2.1},{-20,-2.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(squared.y, mean2.u) annotation (Line(
      points={{-6.98,0},{8,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mean2.y, max.u1) annotation (Line(
      points={{31,0},{40,0},{40,6},{50,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, max.u2) annotation (Line(
      points={{31,-30},{40,-30},{40,-6},{50,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(max.y, y) annotation (Line(
      points={{73,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Documentation(revisions=""),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Line(points={{-76,68},{-76,-80}}, color={192,192,192}),
        Line(points={{-86,0},{72,0}}, color={192,192,192}),
        Line(
           points={{-76,-13},{-62,-13},{-62,3},{-54,3},{-54,-45},{-46,-45},{-46,
              -23},{-38,-23},{-38,61},{-30,61},{-30,29},{-30,29},{-30,-31},{-20,
              -31},{-20,-13},{-10,-13},{-10,-41},{0,-41},{0,41},{6,41},{6,55},
              {12,55},{12,-1},{22,-1},{22,11},{28,11},{28,-19},{38,-19},{38,53},
              {48,53},{48,19},{56,19},{56,-47},{66,-47}},
            color={215,215,215}),
        Polygon(
          points={{94,0},{72,8},{72,-8},{94,0}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-76,66},{70,66}},
          color={215,215,215},
          smooth=Smooth.None),
        Line(
          points={{-16,0},{-16,48}},
          color={0,0,0},
          smooth=Smooth.None),
        Polygon(
          points={{-76,90},{-84,68},{-68,68},{-76,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-16,66},{-24,44},{-8,44},{-16,66}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end Variance;
