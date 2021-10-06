within AdvancedNoise.Examples.RailIrregularities.Parts;
model Irregularity "Source of track irregularity"
  extends AdvancedNoise.Examples.RailIrregularities.Comparisons.FilterAndConvolution(
    doMinimum=true,
    doZero=false,
    doFilter=false,
    doTime=false);
  extends Modelica.Blocks.Interfaces.SO;
equation
  assert(    doMinimum and not doZero and not doFilter and not doTime
      or not doMinimum and     doZero and not doFilter and not doTime
      or not doMinimum and not doZero and     doFilter and not doTime
      or not doMinimum and not doZero and not doFilter and     doTime, "May only use one noise generator!");
  connect(spaceDomainNoiseZero.y, y) annotation (Line(
      points={{1,70},{50,70},{50,0},{110,0}},
      color={0,0,127}));
  connect(spaceDomainNoiseMinimum.y, y) annotation (Line(
      points={{1,30},{50,30},{50,0},{110,0}},
      color={0,0,127}));
  connect(spaceDomainFilter.y, y) annotation (Line(
      points={{41,-10},{50,-10},{50,0},{110,0}},
      color={0,0,127}));
  connect(timeDomainFilter.y, y) annotation (Line(
      points={{41,-50},{50,-50},{50,0},{110,0}},
      color={0,0,127}));
  annotation ( Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Line(
          points={{-80,80},{-80,-80},{80,-80}}),
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
          smooth=Smooth.Bezier)}),
    Documentation(revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      <strong>Copyright</strong> <strong>&copy; DLR Institute of System Dynamics and Control</strong><br>
      Initial version implemented by
      A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
      <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>", info="<html>
<p>
A model enabling application of various models
of a railway track irregularities.
</p>
</html>"));
end Irregularity;
