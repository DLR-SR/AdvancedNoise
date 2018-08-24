within AdvancedNoise.Statistics;
model SignificanceTest "Tests the input against a null hypothesis"
  extends Modelica.Blocks.Interfaces.SISO;

// Null hypothesis
public
  replaceable function H = Modelica.Math.Distributions.Normal.cumulative
    constrainedby Modelica.Math.Distributions.Interfaces.partialCumulative
    "Cumulative density function of the null hypothesis"
    annotation(choicesAllMatching=true, Documentation(info="<html>
<p>This cumulative density function should be set to the expected distribution of the input value. The default is a standard normal distribution.</p>
</html>"));

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
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> 2014 </td>
    <td valign=\"top\">

    <table border=0>
    <tr><td valign=\"top\">
             <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
    </td><td valign=\"bottom\">
             Developed 2014 at the
             <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td></tr>
    </table>
    </td>
</tr>
</table>
</html>",
        info="<html>
<p>
The significance test is used to test whether a given <i>null-hypothesis</i>
is to be abandoned; in favor of the alternative hypothesis.
In this case, the null-hypothesis is that the <i>input&nbsp;u</i>
of this block is a realization of a random number distributed with
a given <i>cumulative density function&nbsp;H</i>. The alternative
hypothesis is then that the input&nbsp;u is NOT such a realization,
i.e. it has a different probability distribution.
</p>
<p>
The test is carried out by comparing the size of the input&nbsp;u with
the probability (given the null-hypothesis H) that this can input occur.
The further the input is away from the expected mean value (of&nbsp;H),
the more improbable it becomes that the null-hypothesis is true.
This can be carried out on both ends, i.e. very high and very low values.
The low values are tested against using the parameter setting leftTail&nbsp;=&nbsp;true,
i.e. a test is carried out that the input is lower than the assumed distribution.
The high values are tested against using the parameter setting rightTail&nbsp;=&nbsp;true,
i.e. a test is carried that the input is higher than the assumed distribution.
If you set both values to true, a test is carried out that the input is
simply not from the assumed distribution.
</p>
<p>
If the input is very high (or very low), the null-hypothesis is to be abandoned.
However, the assumed distributions are typically not bounded, such that
abandoning the null-hypothesis may always be a wrong decision.
The output of this block is the probability of committing this error.
</p>
<p>
The output of this block is known as the <i>p-value</i>. If the p-value is low,
the null-hypothesis should be abandoned. It is therefore usually comapred
against a threshold, e.g. p&nbsp;&lt;&nbsp;0.05 or p&nbsp;&lt;&nbsp;0.01.
In order to be more accurate, the p-value is usually also given along with
the decision to keep or abandon the null-hypothesis.
</p>
<p>
More information about significance testing can be found e.g. on Wikipedia:
<a href=\"https://en.wikipedia.org/wiki/Statistical_significance\">https://en.wikipedia.org/wiki/Statistical_significance</a>.
</p>
</html>"));
end SignificanceTest;
