within AdvancedNoise.Applications;
package Roads "Stochastic irregularities of roads"










  annotation (Documentation(info="<html>
<p>Collection of stochastic irregularities of roads as they are typically standardized and used for automotive applications. Generally, just the vertical excitation is of interest here.The correlation between left and right vehicle side is not given os far.</p>
<p>The irregularities defined here are either based on the <a href=\"modelica://AdvancedNoise.Interpolators.TabulatedStepResponse\">tabulated step response interpolation</a> or ... For the most common usage in the automotive use cases, take the <a href=\"modelica://AdvancedNoise.Sources.SignalBasedNoise\">signal based noise block</a> as an excitation source and replace the interpolation method by desired one from this package.</p>
</html>"));
end Roads;
