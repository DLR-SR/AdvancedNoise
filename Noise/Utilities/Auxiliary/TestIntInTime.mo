within Noise.Utilities.Auxiliary;
model TestIntInTime
  function muh
    input Integer[2] inputs;
    output Real dodo;
  protected
    Integer[2] outputs;
  algorithm
    (outputs,dodo) :=Noise.Utilities.Auxiliary.xorshift64star(inputs);
  end muh;

  Real dodo = muh(Noise.Utilities.Auxiliary.convertRealToIntegers(time));
equation

end TestIntInTime;
