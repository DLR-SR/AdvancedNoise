within Modelica_Noise.Math.Random.Utilities.Interpolators;
package Linear "Linear interpolation"
  extends Random.Utilities.Interfaces.PartialInterpolator(
                                                final continuous=true,
                                                final nCopy=1,
                                                final overlap=0);


  redeclare function extends interpolate
  "Linear interpolation in a buffer of random values"
protected
    Integer nBuffer = size(buffer,1);
    Integer ind;
    Real y1;
    Real y2;
    Real eps = 0.001;
  algorithm
    assert(offset >= -eps and offset <= (nBuffer - 1 + eps),
           "offset out of range (offset=" + String(offset) + ", nBuffer="+String(nBuffer)+")");
    ind := integer(offset) + 1;

    if ind >= nBuffer then
       y := buffer[nBuffer];
    else
       y1 := buffer[ind];
       y2 := buffer[ind+1];
       y  := y1 + (y2-y1)*(offset-ind+1);
    end if;
  /*  
  Modelica.Utilities.Streams.print("... offset="+String(offset)+",ind="+String(ind)+
                                   ", y1=" + String(y1) + ", y2=" +String(y2)+", y="+String(y));
*/
    annotation(Inline=true);
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
