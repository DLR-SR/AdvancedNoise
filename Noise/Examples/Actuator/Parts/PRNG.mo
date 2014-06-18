within Noise.Examples.Actuator.Parts;
model PRNG "PRNG noise modeling"
  import Noise;
  extends NoiseModel;
  Noise.PRNG prng(useGlobalSeed=true,
    samplePeriod=1/200,
    redeclare function PDF = Noise.PDF.PDF_Bates (interval={-0.01,0.01}, n=10),
    redeclare function PSD = Noise.PSD.PSD_IdealLowPass)
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));

equation
  connect(prng.y, y) annotation (Line(
      points={{9,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={           Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255}),
        Rectangle(
          extent={{-80,-10},{-100,10}},
          lineThickness=0.5,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-60,-10},{-80,58}},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-20,-78},{-40,10}},
          lineThickness=0.5,
          fillColor={50,50,50},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-40,-60},{-60,10}},
          lineThickness=0.5,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{60,-62},{40,8}},
          lineThickness=0.5,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{40,-10},{20,88}},
          lineThickness=0.5,
          fillColor={238,238,238},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{0,-10},{-20,76}},
          lineThickness=0.5,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{20,-10},{0,58}},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{80,-10},{60,76}},
          lineThickness=0.5,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{100,-10},{80,56}},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Line(
          points={{-94,-2},{-74,18},{-56,-42},{-30,-68},{-14,38},{6,12},{26,58},
              {46,-42},{68,38},{96,-2}},
          color={255,0,0},
          thickness=0.5,
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(preserveAspectRatio=
           false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>A noise block. With noise.</p>
</html>"));
end PRNG;
