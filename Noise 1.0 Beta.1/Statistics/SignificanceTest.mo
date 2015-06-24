within Noise.Statistics;
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
end SignificanceTest;
