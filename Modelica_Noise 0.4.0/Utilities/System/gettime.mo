within Modelica_Noise.Utilities.System;
impure function gettime "Retrieves the local time"
  output Integer ms "Millisecond";
  output Integer sec "Second";
  output Integer min "Minute";
  output Integer hour "Hour";
  output Integer mday "Day";
  output Integer mon "Month";
  output Integer year "Year";
  external "C" NOISE_getTime(ms,sec,min,hour,mday,mon,year)
  annotation (Include = "#include \"ModelicaNoise.c\"");
end gettime;
