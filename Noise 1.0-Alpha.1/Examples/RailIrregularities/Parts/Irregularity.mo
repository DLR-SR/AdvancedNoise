within Noise.Examples.RailIrregularities.Parts;
model Irregularity "Source of track irregularity"
  extends Noise.Examples.RailIrregularities.Comparisons.FilterAndConvolution(
    doMinimum = true, doZero = false, doFilter = false, doTime = false);
  extends Modelica.Blocks.Interfaces.SO;
equation
  assert(    doMinimum and not doZero and not doFilter and not doTime
      or not doMinimum and     doZero and not doFilter and not doTime
      or not doMinimum and not doZero and     doFilter and not doTime
      or not doMinimum and not doZero and not doFilter and     doTime, "May only use one noise generator!");
  connect(spaceDomainNoiseZero.y, y) annotation (Line(
      points={{1,70},{50,70},{50,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(spaceDomainNoiseMinimum.y, y) annotation (Line(
      points={{1,30},{50,30},{50,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(spaceDomainFilter.y, y) annotation (Line(
      points={{41,-10},{50,-10},{50,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(timeDomainFilter.y, y) annotation (Line(
      points={{41,-50},{50,-50},{50,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics
        ={
        Line(
          points={{-80,80},{-80,-80},{80,-80}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-76,46},{-22,46},{42,-20},{74,-54}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{-76,60},{-10,60},{38,4},{74,-40}},
          color={255,0,0},
          smooth=Smooth.Bezier),
        Line(
          points={{-76,32},{-40,32},{12,-8},{74,-68}},
          color={0,127,0},
          smooth=Smooth.Bezier)}));
end Irregularity;
