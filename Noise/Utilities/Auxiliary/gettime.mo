within Noise.Utilities.Auxiliary;
impure function gettime "Retrieves the local time"
  output Integer ms "Millisecond";
  output Integer sec "Second";
  output Integer min "Minute";
  output Integer hour "Hour";
  output Integer mday "Day";
  output Integer mon "Month";
  output Integer year "Year";
  external "C" NOISE_getTime(ms,sec,min,hour,mday,mon,year);
  annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p></p>
</html>"));
end gettime;
