within Modelica_Noise.Math.Random.Generators;
package Xorshift64star "Random number generator xorshift64*"
  extends Random.Utilities.Interfaces.PartialGenerator(final nState=2);


  redeclare function extends initialState
  "Returns an initial state for the xorshift64* algorithm"
protected
    Real r "Random number not used outside the function";

    /* According to http://vigna.di.unimi.it/ftp/papers/xorshift.pdf, the xorshoft*
     random number generator generates statistically random numbers from a bad seed 
      within one iteration. To be on the safe side, 10 iterations are actually used
    */
    constant Integer p = 10 "The number of iterations to use";

  algorithm
    // If seed=0 use a large prime number as seed (seed must be different from 0).
    if localSeed == 0 and globalSeed == 0 then
      state := {126247697,globalSeed};
    else
      state := {localSeed,globalSeed};
    end if;

    // Generate p-times a random number, in order to get a "good" state
    // even if starting from a bad seed.
    for i in 1:p loop
      (r,state) := random(state);
    end for;
  end initialState;


  redeclare function extends random
  "Returns a uniform random number with the xorshift64* algorithm"
    external "C" NOISE_xorshift64star(stateIn, stateOut, result);
    annotation (Include = "#include \"ModelicaNoise.c\"");
  end random;


  annotation (Documentation(info=
                             "<html>
<p>
For details of the xorshift64* algorithm see 
<a href=\"http://xorshift.di.unimi.it/\">http://xorshift.di.unimi.it/</a> .
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
    Ellipse(
      extent={{-64,0},{-14,-50}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{12,52},{62,2}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid)}));
end Xorshift64star;
