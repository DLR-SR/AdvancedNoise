within AdvancedNoise.Interpolators;
package Constant "Constant interpolation"
  extends Utilities.Interfaces.PartialInterpolator(
  final continuous=false,
  final nFuture=0,
  final nPast=0,
  final varianceFactor=1,
  final smoothness=-1);


  redeclare function extends interpolate
  "Constant interpolation in a buffer of random values"
  algorithm
     y := buffer[if nBuffer == 1 then 1 else integer(offset) + 1];
     annotation(Inline=true, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><code>y = Constant.<b>interpolate</b>(buffer,offset);</code> </blockquote>
<h4>Description</h4>
<p>Interpolate in buffer by using constant interpolation. Input argument offset is a Real number marking the point at which interpolation shall take place. offset=0 is the first buffer value buffer[1]. offset=size(buffer,1)-1 is the last buffer value buffer[size(buffer,1)]. It is required that 0 &le; offset &LT; size(buffer,1)-1. If the buffer has length 1, the function always returns y=buffer[1]. Otherwise the function returns y = buffer[integer(offset)+1]. </p>
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
</html>"));
  end interpolate;


  annotation (Documentation(info="<html>
<p>
This Interpolation package provides <b>constant</b> interpolation in a buffer.
</p>
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
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
        -100},{100,100}}),
        graphics={Line(
      points={{-78,-48},{-24,-48},{-24,-8},{28,-8},{28,52},{78,52}},
      color={0,0,0},
      smooth=Smooth.None)}));
end Constant;
