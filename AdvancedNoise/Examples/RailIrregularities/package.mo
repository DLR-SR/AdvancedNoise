within AdvancedNoise.Examples;
package RailIrregularities "A package of examples demonstrating the shaping of rail irregularities"
  extends Modelica.Icons.ExamplesPackage;


annotation (Documentation(revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      <strong>Copyright</strong> <strong>&copy; DLR Institute of System Dynamics and Control</strong><br>
      Initial version implemented by
      A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
      <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>", info="<html>
<p>
This package demonstrates actual frequency shaping of noise signals with the example
of rail track irregularities. The method is described in
[<a href=\"modelica://AdvancedNoise.UsersGuide.References\">Kloeckner2015</a>].
</p>
<p>
The models contained in this package can be used to generate results presented in
this paper. See also: <a href=\"http://dlr-sr.github.io/\">http://dlr-sr.github.io/</a>.
</p>
<p>
The example <a href=\"TrainOnTrack\">TrainOnTrack</a> shows the complete simulation
of railway track irregularities together with a simplified quarter railway car model.
This shows that the approach is applicable to a relevant example.
</p>
<p>
The package <a href=\"Comparisons\">Comparisons</a> contains a step-wise comparison of
</p>
<ol>
  <li>an actual filter implementation against the convolution approach,</li>
  <li>the time and space domain simulations, and</li>
  <li>the minimum and zero phase implementation of the convolution filter.</li>
</ol>
</html>"));
end RailIrregularities;
