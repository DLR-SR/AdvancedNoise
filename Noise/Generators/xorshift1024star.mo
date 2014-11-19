within Noise.Generators;
model xorshift1024star "The xorshift1024* generator with specifications"
  extends Noise.Utilities.Interfaces.PartialGenerator(final stateSize=33);

  redeclare function extends seed(final stateSize=33)
  end seed;

  redeclare function extends generator
    input Integer p = 1 "Number of iterations to do";
  algorithm
    assert(size(stateIn, 1) == 33, "State must have exactly 2 elements!");

    // Calculate new state
    for i in 1:p loop
      (stateOut, rand) := Noise.Utilities.Auxiliary.xorshift1024star(stateIn);
    end for;

    annotation (Documentation(revisions=
                                       "<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  end generator;

end xorshift1024star;
