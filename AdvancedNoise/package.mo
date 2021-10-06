within ;
package AdvancedNoise "A library with additional noise modules compatible to the Modelica standard library"
  extends Modelica.Icons.Package;

  annotation(
    preferredView="info",
    version =      "1.0.1",
    versionDate =  "2019-05-31",
    versionBuild = 1,
    dateModified = "2019-05-31 12:00:00Z",
    uses(Modelica(version="4.0.0")),
    Icon(graphics={Line(
      points={{-84,0},{-54,0},{-54,40},{-24,40},{-24,-70},{6,-70},{6,80},{36,80},
            {36,-20},{66,-20},{66,60}})}),
    Documentation(
      revisions="",
      info="<html>
<p>
This library contains components that can be used to efficiently
generate noise which can be used in simulations.
Examples of the these components are:
</p>

<ul>
<li>
  Sample-free <a href=\"AdvancedNoise.Sources.TimeBasedNoise\">TimeBasedNoise</a>
  which allows for faster system simulations.
</li>
<li>
  <a href=\"AdvancedNoise.Sources.SignalBasedNoise\">Signal-based noise</a>
  which allows a noise that is based on a system input.
  This signal-based noise can be for example as a source of road-irragularities.
</li>
<li>
  <a href=\"AdvancedNoise.Sources.ColoredSignalBasedNoise\">Colored noise</a>.</li>
</ul>
<p>

<h4>Literature</h4>
<ol>
<li>
  Kl&ouml;ckner, A., Linden, F. L. J. van der, &amp; Zimmer, D. (2014). Noise Generation for Continuous System Simulation. In <i>Proceedings of the 10th International Modelica Conference</i> (pp. 837&ndash;846). Lund, Sweden: Link&ouml;ping University Electronic Press, Link&ouml;pings universitet. <a href=\"http://doi.org/10.3384/ecp14096837\">doi:10.3384/ecp14096837</a>
</li>
<li>
  Linden, F. L. J. van der, Kl&ouml;ckner, A., &amp; Zimmer, D. (2015). Effects of Event-Free Noise Signals on Continuous-Time Simulation Performance. <i>IFAC-PapersOnLine</i>, <i>48</i>(1), 280&ndash;285. <a href=\"http://doi.org/10.1016/j.ifacol.2015.05.039\">doi:10.1016/j.ifacol.2015.05.039</a>
</li>
<li>
  Kl&ouml;ckner, A., Knoblach, A. &amp; Heckmann, A. (2015). How to Shape Noise Spectra for Continuous System Simulation. In Proceedings of the 11th International Modelica Conference (pp. 837&ndash;846). Versailles, France. <a href=\"http://doi.org/10.3384/ecp15118411\">doi:10.3384/ecp15118411</a>
</li>
</ol>


<h4>Copyright</h4>
<p>
<strong>Licensed by DLR&nbsp;SR under the 3-Clause BSD License</strong><br>
</p>
<p>
<em>
This Modelica package is <u>free</u> software and
the use is completely at <u>your own risk</u>;
it can be redistributed and/or modified under the terms of the
3-Clause BSD license, see the license conditions (including the
disclaimer of warranty) in the
<a href=\"modelica://AdvancedNoise.UsersGuide.License\">User&apos;s Guide</a>.
</em>
</p>

<p>
<strong>Modelica&reg;</strong> is a registered trademark of the Modelica Association.
</p>
</html>"));
end AdvancedNoise;
