within Modelica_Noise.Utilities.System;
impure function getTime "Retrieves the local time (in the local time zone)"
  output Integer ms "Millisecond";
  output Integer sec "Second";
  output Integer min "Minute";
  output Integer hour "Hour";
  output Integer day "Day";
  output Integer mon "Month";
  output Integer year "Year";
  external "C" ModelicaRandom_getTime(ms,sec,min,hour,day,mon,year)
  annotation (Include = "#include \"ModelicaRandom.c\"");
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(ms, sec, min, hour, day, mon, year) = System.<b>getTime</b>();
</pre></blockquote>
<h4>Description</h4>
<p>
Returns the local time at the time instant this function was called. 
All returned values are of type Integer and have the following meaning:
</p>

<blockquote>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Argument</th>
    <th>Range</th>
    <th>Description</th></tr>

<tr><td>ms</td> <td>0 .. 999</td>
    <td>Milli-seconds after seconds</td></tr>

<tr><td>sec</td> <td>0 .. 59</td>
    <td>Seconds after minute</td></tr>

<tr><td>min</td> <td>0 .. 59</td>
    <td>Minutes after hour</td></tr>

<tr><td>hour</td> <td>0 .. 23</td>
    <td>Hours after midnight</td></tr>

<tr><td>day</td> <td>1 .. 31</td>
    <td>Day of month</td></tr>

<tr><td>mon</td> <td>1 .. 12</td>
    <td>Current month</td></tr>

<tr><td>year</td> <td>&ge; 2015</td>
    <td>Current year</td></tr>
</table>
</blockquote>

<h4>Example</h4>
<blockquote><pre>
(ms, sec, min, hour, mon, year) = getTime()   // = (281, 30, 13, 10, 15, 2, 2015)
                                              // Feb. 15, 2015 at 10:13 after 30.281 s
</pre></blockquote>
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
end getTime;
