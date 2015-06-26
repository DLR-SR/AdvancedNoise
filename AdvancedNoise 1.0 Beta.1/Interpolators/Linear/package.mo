within AdvancedNoise.Interpolators;
package Linear "Linear interpolation"
  extends Utilities.Interfaces.PartialInterpolator(
  final continuous=true,
  final nFuture=1,
  final nPast=0,
  final varianceFactor=2/3,
  final smoothness=0);


  redeclare replaceable function extends interpolate
  "Linear interpolation in a buffer of random values"
protected
    Integer ind "Index of buffer element just before offset";
    Real y1 "Value of buffer element just before offset";
    Real y2 "Value of buffer element just after offset";
    Real offset2;
  algorithm
    // Ensure that offset is in assumed range
    assert(offset >= 0 and offset < nBuffer-1,
           "offset out of range (offset=" + String(offset) + ", nBuffer="+String(nBuffer)+")");

    // We need to interpolate only between two values
    ind := integer(offset) + 1;
    y1  := buffer[ind];
    y2  := buffer[ind+1];
    y   := y1 + (y2-y1)*(offset-ind+1);

    annotation(derivative(order=1) = der_interpolate, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><code>y = Linear.<b>interpolate</b>(buffer,offset);</code> </blockquote>
<h4>Description</h4>
<p>Interpolate in buffer by using linear interpolation. Input argument offset is a Real number marking the point at which interpolation shall take place. offset=0 is the first buffer value buffer[1]. offset=size(buffer,1)-1 is the last buffer value buffer[size(buffer,1)]. It is required that 0 &le; offset &LT; size(buffer,1)-1. The function returns the lineraly interpolated value. In order to avoid issues at the end of the buffer (where a minimally too large offset value triggers an assert), it is best to make the buffer one element larger as needed. For example, if the buffer is filled with a sample period of 1 ms and every 100 samples an event occurs, then the buffer should have length 102 for the samples 0 ms, 1 ms, 2 ms, ...., 100 ms, 101 ms. </p>
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
This Interpolation package provides <b>linear</b> interpolation in a buffer.
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
      points={{-86,-48},{-26,-48},{26,46},{92,46}},
      color={0,0,0},
      smooth=Smooth.None)}));
end Linear;
