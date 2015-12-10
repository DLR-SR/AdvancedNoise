within Modelica_Noise.Math.Random.Utilities;
function automaticGlobalSeed
  "Creates an automatic integer seed (typically from the current time and process id; this is an impure function)"
  output Integer seed "Automatically generated seed";
  /*
protected 
  Integer ms,sec,min,hour "Current system time";
  Integer pid "Current process ID";
algorithm 
  (ms,sec,min,hour) := Modelica_Noise.Utilities.System.getTime();
  pid := Modelica_Noise.Utilities.System.getPid();
  seed := 1 + ms + 1000*sec + 1000*60*min + 1000*60*60*hour
  + 6007*pid;
  */
  external "C" seed = ModelicaRandom_automaticGlobalSeed()
    annotation (Include = "#include \"ModelicaRandom.c\"");

 annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
seed = Utilities.<b>automaticGlobalSeed</b>();
</pre></blockquote>

<h4>Description</h4>
<p>Returns an automatically computed seed (Integer). Typically, this seed is computed from:</p>
<ol>
<li> The current localtime by computing the number of milli-seconds up to the current hour</li>
<li> The process id (added to the first part by multiplying it with the prime number 6007).</li>
</ol>
<p>
If getTime and getPid functions are not available on the target where this Modelica function
is called, other means to compute a seed may be used.
</p>

<p>
Note, this is an impure function that returns always a different value, when it is newly called.
This function should be only called once during initialization.
</p>

<h4>Example</h4>
<blockquote><pre>
  <b>parameter</b> Boolean useAutomaticSeed = false;
  <b>parameter</b> Integer fixedSeed = 67867967;
  <b>final parameter</b> Integer seed = <b>if</b> useAutomaticSeed <b>then</b>
                                    Random.Utilities.automaticGlobalSeed()
                                 <b>else</b> fixedSeed;
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Random.Utilities.automaticLocalSeed\">automaticLocalSeed</a>.
</p>
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
end automaticGlobalSeed;
