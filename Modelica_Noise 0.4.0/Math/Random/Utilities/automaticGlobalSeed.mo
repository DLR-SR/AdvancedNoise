within Modelica_Noise.Math.Random.Utilities;
impure function automaticGlobalSeed
  "Creates an automatic integer seed from the current time and process id"
  output Integer seed "Automatically generated seed";
protected
  Integer ms;
  Integer sec;
  Integer min;
  Integer hour;
  Integer pid;
algorithm
  (ms,sec,min,hour) := Modelica_Noise.Utilities.System.gettime();
  pid := Modelica_Noise.Utilities.System.getpid();
  seed := 1 + ms + 1000*sec + 1000*60*min + 1000*60*60*hour
            + 6007*pid;

 annotation (Documentation(info="<html>
<p>Returns an automatically computed seed (Integer) from:</p>
<ol>
<li> The current localtime by computing the number of milli-seconds upto the current hour</li>
<li> The process id (added to the first part by multiplying it with the prime number 6007).</li>
</ol>
<p>Check that worst case combination can be included in an Integer:</p>
<blockquote>
<p>1000*60*60 = 3.6e6 &LT; 2^31 = 2147483648 (2.1e9)</p>
</blockquote>
<p>
Everything is added to 1, in order to guard against the very unlikely case that the sum is zero.
</p>
</html>"));
end automaticGlobalSeed;
