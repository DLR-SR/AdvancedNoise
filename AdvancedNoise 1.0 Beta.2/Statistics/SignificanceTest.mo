within AdvancedNoise.Statistics;
model SignificanceTest "Tests the input against a null hypothesis"
  extends Modelica.Blocks.Interfaces.SISO;

// Null hypothesis
public
  replaceable function H =
       Modelica_Noise.Math.Distributions.Normal.cumulative constrainedby
    Modelica_Noise.Math.Distributions.Interfaces.partialCumulative
    "Cumulative density function of the null hypothesis"
    annotation(choicesAllMatching=true);

// Parameters
public
  parameter Boolean rightTail = true "Calculate Pr(X > u | H)" annotation(choices(checkBox=true));
  parameter Boolean leftTail =  true "Calculate Pr(X < u | H)" annotation(choices(checkBox=true));

// Calculate p-value
equation
  y = if rightTail and leftTail then 2 * min(H(u), 1-H(u)) else
      if rightTail              then               1-H(u)  else
      if               leftTail then         H(u)          else 1;

public
  Real l = H(u);
  Real r = 1-H(u);
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>The significance test is used to test wether a given <i>null-hypothesis</i> is to be abandoned; in favor of the alternative hypothesis. In this case, the null-hypothesis is that the <i>input u</i> of this block is a realization of a random number distributed with a given <i>cumulative density function H</i>. The alternative hypothesis is then that the input u is NOT such a realization, i.e. it has a different probability distribution.</p>
<p>The test is carried out by comparing the size of the input u with the probability (given the null-hypothesis H) that this can input occur. The further the input is away from the expected mean value (of H), the more improbable it becomes that the null-hypothesis is true. This can be carried out on both ends, i.e. very high and very low values. The low values are tested against using the parameter setting leftTail=true, i.e. a test is carried out that the input is lower than the assumed distribution. The high values are tested against using the parameter setting rightTail=true, i.e. a test is carried that the input is higher than the assumed distribution. If you set both values to true, a test is carried out that the input is simply not from the assumed distribution.</p>
<p>If the input is very high (or very low), the null-hypothesis is to be abandoned. However, the assumed distributions are typically not bounded, such that abandoning the null-hypothesis may always be a wrong decision. The output of this block is the probability of committing this error. </p>
<p>The output of this block is known as the <i>p-value</i>. If the p-value is low, the null-hypothesis should be abandoned. It is therefore usually comapred against a threshold, e.g. p&LT;0.05 or p&LT;0.01. In order to be more accurate, the p-value is usually also given along with the decision to keep or abandon the null-hypothesis.</p>
<p>More information about significance testing can be found e.g. on Wikipedia: <a href=\"https://en.wikipedia.org/wiki/Statistical_significance\">https://en.wikipedia.org/wiki/Statistical_significance</a>.</p>
</html>"));
end SignificanceTest;
