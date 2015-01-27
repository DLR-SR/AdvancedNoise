within Modelica_Noise.Math.Random.Utilities.Interpolators;
package Linear "Linear interpolation"
  extends Random.Utilities.Interfaces.PartialInterpolator(
                                                final continuous=true,
                                                final nFuture=1,
                                                final nPast=0,
                                                final varianceFactor = 2/3);


  redeclare function extends interpolate
  "Linear interpolation in a buffer of random values"
protected
    Integer ind "Index of buffer element just before offset";
    Real y1 "Value of buffer element just before offset";
    Real y2 "Value of buffer element just after offset";
  algorithm
    // Ensure that offset is in assumed range
    assert(offset >= nPast and offset < nBuffer - nFuture,
           "offset out of range (offset=" + String(offset) + ", nBuffer="+String(nBuffer)+")");

    // We need to interpolate only between two values
    ind := integer(offset) + 1;
    y1  := buffer[ind];
    y2  := buffer[ind+1];
    y   := y1 + (y2-y1)*(offset-ind+1);

    annotation(Inline=true,
               derivative(order=1) = der_interpolate);
  end interpolate;



  annotation (Documentation(info=
                             "<html>
<p>
For details of the xorshift64* algorithm see 
<a href=\"http://xorshift.di.unimi.it/\">http://xorshift.di.unimi.it/</a> .
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
        -100},{100,100}}),
        graphics={Line(
      points={{-86,-48},{-26,-48},{26,46},{92,46}},
      color={0,0,0},
      smooth=Smooth.None)}));
end Linear;
