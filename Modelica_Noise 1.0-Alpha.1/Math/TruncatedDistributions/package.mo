within Modelica_Noise.Math;
package TruncatedDistributions "Library of truncated distribution functions"
   extends Modelica.Icons.Package;


  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
                           Line(
          points={{-32,-38},{-28,-27.0617},{-24.5,-13.4388},{-21,2.1682},{-17.5,
              18.9428},{-14,35.695},{-10.5,50.9771},{-7,63.2797},{-3.5,71.2739},
              {0,74.047},{3.5,71.2739},{7,63.2797},{10.5,50.9771},{14,35.695},{
              17.5,18.9428},{21,2.1682},{24.5,-13.4388},{28,-27.0617},{31.5,
              -38.2849},{35,-47.0467}},
          color={0,0,0},
          smooth=Smooth.Bezier),
        Line(
          points={{-32,-38},{-32,-86}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{35,-46.5},{35,-84.5}},
          color={0,0,0},
          smooth=Smooth.None)}),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1})),
    Documentation(info="<html>
<p>
Truncated distributions are distributions that are transformed in such a way that
either the input is within a band u_min .. u_max, or the output is within
a band y_min .. y_max. 
A truncated distribution is derived from a base
distribution (e.g. from the normal distribution), by truncating its
propability density function to the desired band and adding a constant
value over this band, in order that the integral over the truncated distribution
remains one. All other properties (such as cumulative distribution function) can then be determined
in a straightforward way, provided the properties of the underlying base distribution
are available.
More details can be found, for example, in 
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>

<p>
When using random numbers according to a given truncated distribution,
the output of the inverse cumulative distribution function (= quantile) is restricted
to the defined band. This is important for simulations, where a simulation engine
might have difficulties to cope with very large values (say 1e60) that might
be returned by a quantile of a non-truncated distribution
(such as from a normal distribution), although the
probability is very low that this situation occurs.

</p>

<p>
The truncated distribution functions are derived from the underlying distribution
functions in the following way:
</p>

<blockquote>
<pre>
// Original distributions
    pdf = Distributions.XXX.density(u,..);
    cdf = Distributions.XXX.cumulative(u,...);
cdf_min = Distributions.XXX.cumulative(u_min,...);
cdf_max = Distributions.XXX.cumulative(u_max,...);

// Truncated distributions
</pre>

</pre>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function</i></b></th><th><b><i>Transformation</i></b></th></tr>
  <tr><td>density(u,u_min,u_max,...)</td>
      <td>= <b>if</b> u &ge; u_min <b>and</b> u&le;u_max <b>then</b> pdf / (cdf_max - cdf_min) <b>else</b> 0</td> 
  </tr>
  <tr><td>cumulative(u,u_min,u_max,...)</td>
      <td>= <b>if</b> u &le; u_min <b>then</b> 0
            <b>else if</b> u &lt; u_max <b>then</b> 
              (cdf - cdf_min))/(cdf_max - cdf_min)
            <b>else</b> 1</td> 
  </tr>
  <tr><td>quantile(u,u_min,u_max,...)</td>
      <td>= Distributions.XXX.quantile( cdf_min + u*(cdf_max - cdf_min), ... )</td> 
  </tr>
</table>
</blockquote>

<p>
For an example of a truncated distribution, see the following
plot of the probabibilty density function of a normal distribution
compared with its truncated distribution:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.density.png\">
</blockquote></p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
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
end TruncatedDistributions;
