within Modelica_Noise.Math.Distributions;
package TruncatedNormal "Library of truncated normal distribution functions"
  extends Modelica.Icons.Package;




  annotation (Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}),
                   graphics={
        Line(
          points={{-32,-32},{-32,-80}}),
                           Line(
          points={{-32,-32},{-28,-21.0617},{-24.5,-7.4388},{-21,8.1682},{
              -17.5,24.9428},{-14,41.695},{-10.5,56.9771},{-7,69.2797},{-3.5,
              77.2739},{0,80.047},{3.5,77.2739},{7,69.2797},{10.5,56.9771},{
              14,41.695},{17.5,24.9428},{21,8.1682},{24.5,-7.4388},{28,
              -21.0617},{31.5,-32.2849},{35,-41.0467}},
          smooth=Smooth.Bezier),
        Line(
          points={{34.5,-40.5},{34.5,-78.5}}),
        Line(
          points={{34.5,-78.5},{70.5,-78.5}}),
        Line(
          points={{-68,-79},{-32,-79}})}),
    Documentation(info="<html>
<p>
This package provides
</p>
<ul>
<li> probability density function (= derivative of cumulative distribution function),</li>
<li> cumulative distribution function, and</li>
<li> quantile (= inverse cumulative distribution function).</li>
</ul>
<p>
of the <b>truncated normal</b> distribution. Examples:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedNormal.density.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedNormal.cumulative.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedNormal.quantile.png\">
</blockquote></p>

<p>
For more details<br>
of the normal distribution, see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>
</html>", revisions="<html>
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
</html>"));
end TruncatedNormal;
