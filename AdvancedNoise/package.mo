within ;
package AdvancedNoise "A library with additional noise modules compatible to the Modelica standard library"
  extends Modelica.Icons.Package;

  annotation (
    preferredView="info",
    version =      "1.2.0",
    versionDate =  "2025-10-02",
    dateModified = "2025-10-02 12:00:00Z",
    revisionId="$Format:%h %ci$",
    uses(
      Modelica(version="4.1.0")),
    conversion(
      noneFromVersion="0.9.0",
      noneFromVersion="0.9.1",
      noneFromVersion="1.0.0",
      noneFromVersion="1.1.0"),
    Icon(graphics={
        Line(
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
    Sample-free <a href=\"modelica://AdvancedNoise.Sources.TimeBasedNoise\">TimeBasedNoise</a>
    which allows for faster system simulations.
  </li>
  <li>
    <a href=\"modelica://AdvancedNoise.Sources.SignalBasedNoise\">Signal-based noise</a>
    which allows a noise that is based on a system input.
    This signal-based noise can be used for example as a&nbsp;source of road-irregularities
    in automotive applications.
  </li>
  <li>
    <a href=\"modelica://AdvancedNoise.Sources.ColoredSignalBasedNoise\">Colored noise</a>.
  </li>
</ul>

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
