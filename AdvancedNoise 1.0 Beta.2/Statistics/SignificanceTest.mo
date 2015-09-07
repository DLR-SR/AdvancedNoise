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
<p>The significance test is used to test wether a given null-hypothesis is to be abandoned; in favor of the alternative hypothesis. In this case, the null-hypothesis is that the input u of this block is a realization of a random number distributed with a given cumulative density function. The alternative hypothesis is then that the input u is NOT such a realization, i.e. it has a different probability distribution.</p>
<p>The test is carried out by comparing the size of the input u with the probability (given the null-hypothesis H) that this can input occur. The further the input is away from the expected mean value (of H), the more improbable it becomes, that the null-hypothesis is true. This can be carried out on both ends, i.e. very high and very low values. The low values are tested against using the parameter setting leftTail=true. The high values are tested against using the parameter setting rightTail=true. If you set both values to true, the </p>
</html>"));
end SignificanceTest;
