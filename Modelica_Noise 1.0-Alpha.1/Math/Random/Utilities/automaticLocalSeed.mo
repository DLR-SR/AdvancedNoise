within Modelica_Noise.Math.Random.Utilities;
impure function automaticLocalSeed
  "Creates an automatic local seed from the instance name"
  input String path
    "Full path name of the instance (inquire with getInstanceName())";
  output Integer seed "Automatically generated seed";
protected
  Integer pos;
  Integer len;
  String str;
algorithm
  // Remove first name from the path, because all instances have the same root name
  pos := Modelica.Utilities.Strings.find(path, ".");
  len := Modelica.Utilities.Strings.length(path);
  if pos > 0 and pos < len then
    str := Modelica.Utilities.Strings.substring(path, pos+1, len);
  else
    str := path;
  end if;

  // Generate a hash value from the generated string
  seed := Modelica_Noise.Utilities.Strings.hashString(str);

 annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
seed = Utilities.<b>automaticLocalSeed</b>(path);
</pre></blockquote>

<h4>Description</h4>
<p>
Returns an automatically computed seed (Integer) from the hash value of 
the full path name of an instance (has to be inquired in the model or block
where this function is called by getInstanceName()). Contrary to automaticGlobalSeed(),
this is a pure function, that is, the same seed is returned, if an identical
path is provided.
</p>

<h4>Example</h4>
<blockquote><pre>
<b>parameter</b> Boolean useAutomaticLocalSeed = true;
<b>parameter</b> Integer fixedLocalSeed        = 10; 
<b>final parameter</b> Integer localSeed = <b>if</b> useAutomaticLocalSeed <b>then</b> 
                                       automaticLocalSeed(getInstanceName())
                                    <b>else</b> 
                                       fixedLocalSeed;
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.Random.Utilities.automaticGlobalSeed\">automaticGlobalSeed</a>.
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
         A. Klouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end automaticLocalSeed;
