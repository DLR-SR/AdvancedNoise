within Noise.Utilities.Auxiliary;
function automaticSeed
  "Creates an automatic integer seed from the current time and process id"

  input Real dummy=0 "Input the simulation time to ensure, this is evaluated";
  output Integer seed "Automatic seed";
protected
  Integer ms;
  Integer sec;
  Integer min;
  Integer hour;
  Integer pid;
algorithm
  (ms, sec, min, hour) := gettime(dummy);
  pid                  := getpid( dummy);
  seed := 1 + ms + 1000*sec + 1000*60*min + 1000*60*60*hour
            + 6007*pid;

 annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>Return an automatically computed seed (Integer) from</p>
<p>1. the current localtime by computing the number of milli-seconds upto the current hour</p>
<p>2. the process id (added to the first part by multiplying it with the prime number 6007).</p>
<p>Check that worst case combination can be included in an Integer:</p>
<p>1000*60*60*24 = 86400000 (8.6e7) &LT; 2^31 = 2147483648 (2.1e9)</p>
<p>Everything is added to 1, in order to guard against the very unlikely case that the sum is zero.</p>
</html>"));

end automaticSeed;
