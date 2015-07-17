within Modelica_Noise.Math;
package Distributions "Library of distribution functions"
   extends Modelica.Icons.Package;







annotation (Icon(graphics={Line(
          points={{-70,-65.953},{-66.5,-65.8975},{-63,-65.7852},{-59.5,
          -65.5674},{-56,-65.1631},{-52.5,-64.4442},{-49,-63.2213},{-45.5,
          -61.2318},{-42,-58.1385},{-38.5,-53.5468},{-35,-47.0467},{-31.5,
          -38.2849},{-28,-27.0617},{-24.5,-13.4388},{-21,2.1682},{-17.5,
          18.9428},{-14,35.695},{-10.5,50.9771},{-7,63.2797},{-3.5,
          71.2739},{0,74.047},{3.5,71.2739},{7,63.2797},{10.5,50.9771},{
          14,35.695},{17.5,18.9428},{21,2.1682},{24.5,-13.4388},{28,
          -27.0617},{31.5,-38.2849},{35,-47.0467},{38.5,-53.5468},{42,
          -58.1385},{45.5,-61.2318},{49,-63.2213},{52.5,-64.4442},{56,
          -65.1631},{59.5,-65.5674},{63,-65.7852},{66.5,-65.8975},{70,
          -65.953}},
          color={0,0,0},
          smooth=Smooth.Bezier)}), Documentation(info="<html>
<p>
This package provides
</p>
<ul>
<li> <a href=\"http://en.wikipedia.org/wiki/Probability_density_function\">probability density functions</a>
     (= derivative of cumulative distribution function),</li>
<li> <a href=\"http://en.wikipedia.org/wiki/Cumulative_distribution_function\">cumulative distribution functions</a>,
     and</li>
<li> <a href=\"http://en.wikipedia.org/wiki/Quantile_function\">quantiles</a>
     (= inverse cumulative distribution functions).</li>
</ul>
<p>
of different distributions.
</p>

<p>
In particular also <strong>truncated distributions</strong> are provided (see below).
The main reason to introduce
truncated distributions is to make the modeling of measurement noise easier, in order to 
limit the band in which the noise can occur. For example, if a sensor is used and the
sensor signal has a noise of ± 0.1 Volt (e.g. this can be determined by using a reference
value of 0 V and inspecting the measured signal), then the sensor signal will be often the input
to an Analog-Digital converter and this converter limits the signal, say to ± 5 Volt. 
Typically, the user would like to model noise within the noise band (say ± 0.1 Volt),
and often uses a normal distribution. But a normal distribution is not limited and
for a small sample time and a long simulation there might be some sample time instants
where the noise values of the normal signal is outside the ± 0.1 Volt range.
For some sensor types this is completely unrealistic (e.g. an angle sensor might
measure ± 0.1 rad, but the sensor will never add, say one revolution (6.28 rad) to it.
However, the noise model with a pure normal distribution could give such a value.
If a modeler would like to guarantee (and not to hope), that the modeled noise is 
always between ± 0.1 Volt, then there are two main possibilities: (a) The noise is computed
and the result is then limited to ± 0.1 Volt, or (b) the normal distribution is slightly modified,
so that it is within the band of ± 0.1 Volt. Approach (a) is a brute force method that
changes the statistical properties of the signal in an unknown way. Approach (b)
is a \"clean\" mathematical description. The blocks in package 
<a href=\"modelica://Modelica_Noise.Blocks.Noise\">Blocks.Noise</a>
give the user the freedom to choose: Either compute a normal (unlimited) noise, or
a truncated normal noise (truncated distribution).
</p>

<h4>
Details of truncated distributions
</h4>

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
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>
(the equations from the \"Truncated Distribution\" box in the right part
of this Wikipedia article are used for this package).
</p>

<p>
When using random numbers according to a given truncated distribution,
the output of the inverse cumulative distribution function (= quantile) is restricted
to the defined band. 
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
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Distributions/TruncatedNormal.density.png\">
</blockquote></p>
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
end Distributions;
