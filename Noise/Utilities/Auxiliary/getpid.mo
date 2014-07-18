within Noise.Utilities.Auxiliary;
function getpid "Retrieves the current process id"

  input Real dummy=0 "Input the simulation time to ensure, this is evaluated";
  output Integer pid "Process ID";

  external "C" pid = NOISE_getpid();

 annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p></p>
</html>"));
end getpid;
