within Modelica_Noise.Utilities.System;
function getPid "Retrieves the current process id"
  output Integer pid "Process ID";
  external "C" pid = ModelicaRandom_getpid()
  annotation (Include = "#include \"ModelicaRandom.c\"");
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
pid = System.<b>getPid</b>();
</pre></blockquote>
<h4>Description</h4>
<p>
Returns the pid (process identification) of the process in which this function
is called. This is an impure function and the returned value depends on the
operating system.
</p>

<h4>Example</h4>
<blockquote><pre>
getPid()   // = 3044
</pre></blockquote>
<h4>Note</h4>
<p>This function is impure!</p>
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
end getPid;
