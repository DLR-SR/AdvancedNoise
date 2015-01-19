within Noise.Generators;
function xorshift64star "The xorshift64* generator with specifications"
  extends Noise.Utilities.Interfaces.PartialGenerator(stateSize=2);
  input Integer p = 1 "Number of iterations to do" annotation(Dialog);

algorithm
    //assert(size(stateIn, 1) == 2, "State must have exactly 2 elements!");

    // Calculate new state
    if initializeState then
      stateOut :=1:2;
      rand :=99.9;
    else
      for i in 1:p loop
        (stateOut, rand) := Noise.Utilities.Auxiliary.xorshift64star(stateIn);
      end for;
    end if;

end xorshift64star;
