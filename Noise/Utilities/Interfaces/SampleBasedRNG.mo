within Noise.Utilities.Interfaces;
partial function SampleBasedRNG
  "The interface for sample based random number generators"
  extends RNG;
  annotation (Icon(graphics={
        Line(
          points={{70,60},{70,-80}},
          color={95,95,95}),
        Line(
          points={{-40,60},{-40,-80}},
          color={95,95,95}),
        Line(
          points={{-2,60},{-2,-80}},
          color={95,95,95}),
        Line(
          points={{36,60},{36,-80}},
          color={95,95,95}),
        Ellipse(
          extent={{-82,42},{-78,38}},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0},
          lineColor={0,0,0}),
        Line(
          points={{-80,40},{-40,40}},
          color={255,0,0}),
        Ellipse(
          extent={{-42,-38},{-38,-42}},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0},
          lineColor={0,0,0}),
        Line(
          points={{-40,-40},{-2,-40}},
          color={255,0,0}),
        Ellipse(
          extent={{-4,-18},{0,-22}},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0},
          lineColor={0,0,0}),
        Line(
          points={{-2,-20},{36,-20}},
          color={255,0,0}),
        Ellipse(
          extent={{34,28},{38,24}},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          fillColor={255,0,0},
          lineColor={0,0,0}),
        Line(
          points={{36,26},{70,26}},
          color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end SampleBasedRNG;
