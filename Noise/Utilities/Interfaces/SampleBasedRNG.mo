within Noise.Utilities.Interfaces;
partial function SampleBasedRNG
  "The interface for sample based random number generators"
  extends RNG;
  annotation (Icon(graphics={
        Line(
          points={{-40,60},{-40,-80}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{0,60},{0,-80}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{40,60},{40,-80}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{80,60},{80,-80}},
          color={95,95,95},
          smooth=Smooth.None),
        Ellipse(
          extent={{-82,42},{-78,38}},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0},
          lineColor={0,0,0}),
        Line(
          points={{-80,40},{-40,40}},
          smooth=Smooth.None,
          color={255,0,0}),
        Ellipse(
          extent={{-42,-38},{-38,-42}},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0},
          lineColor={0,0,0}),
        Line(
          points={{-40,-40},{0,-40}},
          smooth=Smooth.None,
          color={255,0,0}),
        Ellipse(
          extent={{-2,-18},{2,-22}},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0},
          lineColor={0,0,0}),
        Line(
          points={{0,-20},{40,-20}},
          smooth=Smooth.None,
          color={255,0,0}),
        Ellipse(
          extent={{38,28},{42,24}},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0},
          lineColor={0,0,0}),
        Line(
          points={{40,26},{80,26}},
          smooth=Smooth.None,
          color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end SampleBasedRNG;
