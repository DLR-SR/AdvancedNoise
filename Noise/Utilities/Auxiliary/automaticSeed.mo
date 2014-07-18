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
<p></p>
</html>"));

end automaticSeed;
