within Noise.RNG.SampleFree;
function RNG_Weyl
  "Number generator based on the Equidistribution Theorem (Weyl's criterion), WARNING: Not random!"
  extends Noise.Utilities.Interfaces.SampleFreeRNG;
  input Real y0 = sqrt(4345543)-1
    "An irrational number used to yield the pseudo-random number rand_i = i*yo mod 1"
    annotation(Dialog);
algorithm
  states_out := states_in;
  rand       := mod((1+instance)*y0, 1);
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This is not actually a random number generator. Weyl&apos;s theorem guarantees a very uniform distribution, but the generated signal is highly correlated.</p>
</html>"));
end RNG_Weyl;
