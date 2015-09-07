within AdvancedNoise.Examples;
package RailIrregularities "A package of examples demonstrating the shaping of rail irregularities"
  extends Modelica.Icons.ExamplesPackage;


annotation (Documentation(revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>", info="<html>
<p>This package demonstrates actual frequency shaping of noise signals with the example of rail track irregularities. The method is described in the paper:</p>
<p style=\"margin-left: 30px;\">Kl&ouml;ckner, A., Linden, F. L. J. van der, &AMP; Zimmer, D. (2015). How to Shape Noise Spectra for Continuous System Simulation. In Proceedings of the 11th International Modelica Conference (pp. 837&ndash;846). Versailles, France. In Press</p>
<p>The models contained in this package can be used to generate results presented in this paper. See also: <a href=\"http://dlr-sr.github.io/\">http://dlr-sr.github.io/</a>.</p>
<p>The example <a href=\"TrainOnTrack\">TrainOnTrack</a> shows the complete simulation of railway track irregularities together with a simplified quarter railway car model. This shows that the approach is applicable to a relevant example.</p>
<p>The package <a href=\"Comparisons\">Comparisons</a> contains a step-wise comparison of </p>
<ol>
<li>an actual filter implementation against the convolution approach,</li>
<li>the time and space domain simulations, and</li>
<li>the minimum and zero phase implementation of the convolution filter.</li>
</ol>
</html>"));
end RailIrregularities;
