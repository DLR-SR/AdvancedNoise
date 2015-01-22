within Modelica_Noise.Math.Random.Utilities.Interpolators;
package Constant "Constant interpolation"
  extends Random.Utilities.Interfaces.PartialInterpolator(
                                                final continuous=false,
                                                final nFuture=0,
                                                final nPast=0);


  redeclare function extends interpolate
  "Constant interpolation in a buffer of random values"
  algorithm
     y :=buffer[1];
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
      points={{-78,-48},{-24,-48},{-24,-8},{28,-8},{28,52},{78,52}},
      color={0,0,0},
      smooth=Smooth.None)}));
end Constant;
