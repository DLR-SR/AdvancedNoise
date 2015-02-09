within Modelica_Noise.Math.Random.Generators;
package Xorshift128plus "Random number generator xorshift128+"
  extends Random.Utilities.Interfaces.PartialGenerator(final nState=4);


  redeclare function extends initialState
  "Returns an initial state for the xorshift128+ algorithm"
  algorithm
    state := Random.Utilities.initialStateWithXorshift64star(localSeed,globalSeed,size(state, 1));
    annotation(Inline=true);
  end initialState;


  redeclare function extends random
  "Returns a uniform random number with the xorshift128+ algorithm"
     external "C" NOISE_xorshift128plus(stateIn, stateOut, result)
       annotation (Include = "#include \"ModelicaNoise.c\"");
  end random;


  annotation (Documentation(info=
                             "<html>
<p>
For details of the xorshift128+ algorithm see 
<a href=\"http://xorshift.di.unimi.it/\">http://xorshift.di.unimi.it/</a> .
</p>
</html>"),
 Icon(graphics={
    Ellipse(
      extent={{-70,60},{-20,10}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{32,58},{82,8}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{-20,-12},{30,-62}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid)}));
end Xorshift128plus;
