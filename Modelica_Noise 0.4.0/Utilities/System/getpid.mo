within Modelica_Noise.Utilities.System;
impure function getpid "Retrieves the current process id"
  output Integer pid "Process ID";
  external "C" pid = NOISE_getpid()
  annotation (Include = "#include \"ModelicaNoise.c\"");
end getpid;
