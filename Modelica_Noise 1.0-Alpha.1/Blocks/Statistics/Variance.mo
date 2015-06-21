within Modelica_Noise.Blocks.Statistics;
block Variance "Calculates the empirical variance of its input signal"
  extends Modelica.Blocks.Interfaces.BlockIcon;
  parameter Modelica.SIunits.Time t_eps(min=0.0)=1e-7
    "Variance calculation starts at startTime + t_eps"
    annotation(Dialog(group="Advanced"));

  Modelica.Blocks.Interfaces.RealInput u "Noisy input signal" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Variance of the input signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
protected
  Real mu "Mean value (state variable)";
  Real var "Variance (state variable)";
  parameter Real t_0(fixed=false) "Start time";
initial equation
  t_0 = time;
  mu  = u;
  var = 0;
equation
  der(mu) = noEvent(if time >= t_0 + t_eps then (u-mu)/(time-t_0) else 0);
  der(var) = noEvent(if time >= t_0 + t_eps then ((u-mu)^2 - var)/(time - t_0) else 0);
  y = noEvent(if time >= t_0 + t_eps then max(var,0) else 0);

  annotation (Documentation(revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> June 22, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>",                                 info="<html>
<p>
This block calculates the empirical variance of its input signal. It is based on the formula
(but implemented in a more reliable numerical way):
</p>
<blockquote>
<pre>y = mean(  (u - mean(u))^2  )</pre>
</blockquote>

<p>The parameter t_eps is used to guard against division by zero (the variance computation
starts at startTime + t_eps and before that time instant y = 0).</p>
<p>The variance of a signal is also equal to its mean power.</p>

<p>
This block is demonstrated in the examples
<a href=\"modelica://Modelica_Noise.Blocks.Examples.NoiseExamples.UniformNoiseProperties\">UniformNoiseProperties</a>,
<a href=\"modelica://Modelica_Noise.Blocks.Examples.NoiseExamples.NormalNoiseProperties\">NormalNoiseProperties</a> and
<a href=\"modelica://Modelica_Noise.Blocks.Examples.NoiseExamples.WeibullNoiseProperties\">WeibullNoiseProperties</a>.
</p>
</html>"),
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
