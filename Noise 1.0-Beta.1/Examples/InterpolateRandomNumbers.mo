within Noise.Examples;
model InterpolateRandomNumbers
  "Interpolate random numbers with the various interpolators"
   extends Modelica.Icons.Example;

  parameter Modelica.SIunits.Time samplePeriod = 1.0
    "Sample period for the generation of random numbers";
  parameter Integer seed = 614657 "Seed to initialize random number generator";

protected
  final parameter Integer id = Modelica_Noise.Math.Random.Utilities.initializeImpureRandom(
                                                                seed)
    "An identifier to ensure initialization of the impure random number generator";
public
  parameter Real r[100](fixed = false) "Random number buffer";
initial algorithm
  for i in 1:100 loop
    r[i] := Modelica_Noise.Math.Random.Utilities.impureRandom(id);
  end for;

public
  Real offset "The offset for interpolation";
  Real rConstant "Constantly interpolated random number";
  Real rLinear "Linearly interpolated random number";
  Real rSmooth "Smoothly inteprolated random number";
equation
  offset    = mod(time / samplePeriod, 90) + 5.0;
  rConstant =Noise.Interpolators.Constant.interpolate(buffer=r, offset=offset);
  rLinear   =Noise.Interpolators.Linear.interpolate(buffer=r, offset=offset);
  rSmooth   =Noise.Interpolators.SmoothIdealLowPass.interpolate(buffer=r,
    offset=offset);

  annotation (experiment(StopTime=20, NumberOfIntervals=1000),
                                      Documentation(info="<html>
<p>
This example demonstrates how to use the interpolators 
of package <a href=\"Modelica_Noise.Math.Random.Interpolators\">Math.Random.Interpolators</a> in a Modelica model.
The example uses the <a href=\"Modelica_Noise.Math.Random.Utilities.impureRandom\">impure random function</a> to generate a series of random numbers.
These are then interpolated piece-wise constantly, linearly and using the smooth interpolation of truncated ideal low-pass.
Simulations results are shown in the figure below:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/Random/InterpolateRandomNumbers.png\">
</blockquote></p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
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
</html>"),
    __Dymola_experimentSetupOutput);
end InterpolateRandomNumbers;
