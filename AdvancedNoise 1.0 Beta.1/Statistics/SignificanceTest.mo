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
<p><img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end SignificanceTest;
