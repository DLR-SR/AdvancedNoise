within Modelica_Noise.Utilities.Strings;
function hashString "Creates a hash value of a String"
  input String string "The string to create a hash from";
  output Integer hash "The hash value of string";
  external "C" hash = ModelicaRandom_hashString(string)
      annotation (Include = "#include \"ModelicaRandom.c\"");
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
hash = Strings.<b>hashString</b>(string);
</pre></blockquote>
<h4>Description</h4>
<p>
Returns an Integer hash value of the provided string
(the hash can be any Integer, including zero or a negative number).
</p>

<h4>Example</h4>
<blockquote><pre>
  hashString(\"this is a test\")     // =  1827717433
  hashString(\"Controller.noise1\")  // = -1025762750
</pre></blockquote>
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
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end hashString;
