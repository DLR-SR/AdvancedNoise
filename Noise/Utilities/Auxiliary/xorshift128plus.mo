within Noise.Utilities.Auxiliary;
function xorshift128plus "The xorshift128+ random number generator"
  input Integer[4] state_in "The input state";
  output Integer[4] state_out "The output state";
  output Real y "The uniform random number";

  external "C" NOISE_xorshift128plus(state_in, state_out, y);

  annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p></p>
</html>"));
end xorshift128plus;
