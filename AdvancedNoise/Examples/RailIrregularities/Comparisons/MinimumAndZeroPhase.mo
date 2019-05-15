within AdvancedNoise.Examples.RailIrregularities.Comparisons;
model MinimumAndZeroPhase
  "Compares implementation of convolution with minim and zero phase filters"
  extends FilterAndConvolution(doMinimum = true, doZero = true, doFilter = false, doTime = false);
  annotation (experiment(
      StopTime=5,
      Interval=0.01,
      Tolerance=0.001),Documentation(revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      <b>Copyright</b> <b>&copy; DLR Institute of System Dynamics and Control</b><br>
      Initial version implemented by
      A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
      <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>", info="<html>
<p>
This example compares the implementation of convolution with
minimum and zero phase filters
on the background of a railway application.
</p>
</html>"));
end MinimumAndZeroPhase;
