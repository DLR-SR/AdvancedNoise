within Modelica_Noise.Blocks.Statistics;
block StandardDeviation
  "Calculates the empirical standard deviation of its input signal"
  extends Modelica.Blocks.Interfaces.BlockIcon;

  Modelica.Blocks.Interfaces.RealInput u "Noisy input signal" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    "Standard deviation of the input signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  Variance variance
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Math.Sqrt sqrt1
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
equation
  connect(variance.u, u) annotation (Line(
      points={{-62,0},{-120,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sqrt1.u, variance.y) annotation (Line(
      points={{-22,0},{-39,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sqrt1.y, y) annotation (Line(
      points={{1,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Documentation(revisions=""),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(graphics={
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
          points={{-76,46},{70,46}},
          color={215,215,215},
          smooth=Smooth.None),
        Line(
          points={{-16,0},{-16,30}},
          color={0,0,0},
          smooth=Smooth.None),
        Polygon(
          points={{-76,90},{-84,68},{-68,68},{-76,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-16,46},{-24,24},{-8,24},{-16,46}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end StandardDeviation;
