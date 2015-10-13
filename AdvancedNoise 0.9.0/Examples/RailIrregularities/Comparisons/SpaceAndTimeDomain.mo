within AdvancedNoise.Examples.RailIrregularities.Comparisons;
model SpaceAndTimeDomain "Compares implementation in space and time domain"
  extends FilterAndConvolution(doMinimum = true, doZero = false, doFilter = false, doTime = true);
  annotation (experiment(
      StopTime=5,
      Interval=0.01,
      Tolerance=0.001),Documentation(revisions="<html>
<p>
<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
</td><td valign=\"bottom\">
         <b>Copyright</b> <b>&copy; DLR Institute of System Dynamics and Control</b><br>
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</p>
</html>", info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">This exam</span>ple compares the&nbsp;implementation&nbsp;in&nbsp;space&nbsp;and&nbsp;time&nbsp;domain</p>
</html>"));
end SpaceAndTimeDomain;
