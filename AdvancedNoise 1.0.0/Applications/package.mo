within AdvancedNoise;
package Applications "Applications for a noise"
  extends Modelica.Icons.Package;

  annotation (Icon(graphics={
        Ellipse(
          extent={{-80,80},{80,-80}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(points={{-50,0},{50,0}}, color={0,0,0}),
        Line(points={{0,-50},{0,50}}, color={0,0,0}),
        Line(points={{34,-34},{-34,34}}, color={0,0,0}),
        Line(points={{-34,-34},{34,34}}, color={0,0,0})}), Documentation(info="<html>
<p>Collection of stochastic irregularities of roads as they are typically standardized and used for automotive applications. Generally, just the vertical excitation is of interest here.The correlation between left and right vehicle side is not given os far.</p>
<p>The irregularities defined here are either based on the <a href=\"modelica://AdvancedNoise.Interpolators.TabulatedStepResponse\">tabulated step response interpolation</a> or ... For the most common usage in the automotive use cases, take the <a href=\"modelica://AdvancedNoise.Sources.SignalBasedNoise\">signal based noise block</a> as an excitation source and replace the interpolation method by desired one from this package.</p>
</html>"));
end Applications;
