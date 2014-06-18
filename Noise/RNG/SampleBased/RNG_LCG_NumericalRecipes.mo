within Noise.RNG.SampleBased;
function RNG_LCG_NumericalRecipes = RNG_LCG (
    a=1664525,
    c=1013904223,
    m=integer(2^32))
  "Linear congruential generator with parameters as used in book Numerical Recipes"
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
