within Modelica_Noise.Math.Random.Generators;
package Xorshift1024star "Random number generator xorshift1024*"
  extends Random.Utilities.Interfaces.PartialGenerator(final nState=33);


  redeclare function extends initialState
  "Returns an initial state for the xorshift1024* algorithm"
  algorithm
    state := Random.Utilities.initialStateWithXorshift64star(localSeed,globalSeed,size(state, 1));
    annotation(Inline=true);
  end initialState;


  redeclare function extends random
  "Returns a uniform random number with the xorshift1024* algorithm"
     external "C" NOISE_xorshift1024star(stateIn, stateOut, result)
       annotation (Include = "#include \"ModelicaNoise.c\"");
  end random;


  annotation (Documentation(info=
                             "<html>
<p>
For details of the xorshift1024* algorithm see 
<a href=\"http://xorshift.di.unimi.it/\">http://xorshift.di.unimi.it/</a> .
</p>
</html>"),
 Icon(graphics={
    Ellipse(
      extent={{-70,78},{-20,28}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{20,58},{70,8}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{-64,6},{-14,-44}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{16,-20},{66,-70}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid)}));
end Xorshift1024star;
