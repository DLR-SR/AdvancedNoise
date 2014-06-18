within Noise.RNG.SampleBased;
function RNG_LCG_VAX =              RNG_LCG (
    a=69069,
    c=1,
    m=integer(2^32))
  "Linear congruential generator with parameters from VAX's MTH$RANDOM and old versions of glibc"
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
