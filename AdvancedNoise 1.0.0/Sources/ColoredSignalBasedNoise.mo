within AdvancedNoise.Sources;
block ColoredSignalBasedNoise
  "Implements a filter directly within the (signal-based) noise signal"
  extends SignalBasedNoise(
    redeclare replaceable package interpolation =
      AdvancedNoise.Interpolators.FirstOrder
      constrainedby AdvancedNoise.Interpolators.Utilities.Interfaces.PartialInterpolatorWithKernel,
    redeclare replaceable function distribution =
      Modelica.Math.Distributions.TruncatedNormal.quantile (
        mu =    0,
        sigma = 1 / sqrt(samplePeriod)),
    samplePeriod = interpolation.suggestedSamplePeriod);
  annotation (Documentation(revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th align=\"left\">Description</th>
  </tr>
  <tr>
    <td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\">
      <table border=\"0\">
        <tr>
          <td valign=\"top\">
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>", info="<html>
<p>
This block extends the block
<a href=\"modelica://AdvancedNoise.Sources.SignalBasedNoise\">SignalBasedNoise</a>
and uses presets for custom colored noise.
</p>
</html>"));
end ColoredSignalBasedNoise;
