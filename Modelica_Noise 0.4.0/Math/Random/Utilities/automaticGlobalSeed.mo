within Modelica_Noise.Math.Random.Utilities;
impure function automaticGlobalSeed
  "Creates an automatic integer seed from the current time and process id (= impure function)"
  output Integer seed "Automatically generated seed";
protected
  Integer ms,sec,min,hour "Current system time";
  Integer pid "Current process ID";
algorithm
  (ms,sec,min,hour) := Modelica_Noise.Utilities.System.getTime();
  pid := Modelica_Noise.Utilities.System.getPid();
  seed := 1 + ms + 1000*sec + 1000*60*min + 1000*60*60*hour
            + 6007*pid;

 annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
seed = Utilities.<b>automaticGlobalSeed</b>();
</pre></blockquote>

<h4>Description</h4>
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
</html>"));
end automaticGlobalSeed;
