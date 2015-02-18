within Modelica_Noise.Utilities.System;
impure function getPid "Retrieves the current process id"
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
</html>"));
end getPid;
