within Modelica_Noise.Blocks.Examples.NoiseExamples.Utilities;
block ImpureRandom
  "Block generating random numbers with the impure random number generator"
  extends Modelica.Blocks.Interfaces.SO;

  parameter Modelica.SIunits.Time samplePeriod
    "Sample period for random number generation";

protected
   outer Modelica_Noise.Blocks.Noise.GlobalSeed globalSeed;

equation
   when {initial(), sample(samplePeriod,samplePeriod)} then
      y = globalSeed.random();
   end when;
  annotation (Documentation(info="<html>
<p>
This block demonstrates how to implement a block usign the impure
random number generator. This block is used in the example
<a href=\"modelica://Modelica_Noise.Blocks.Examples.NoiseExamples.ImpureGenerator\">Examples.NoiseExamples.ImpureGenerator</a>.
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
end ImpureRandom;
