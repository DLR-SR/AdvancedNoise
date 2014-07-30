within Noise.Utilities.Interfaces;
partial function Filter
  "The basic interface for a power spectral density function"
  extends Icons.PSD;
  input Real buffer[:] "The buffer of random numbers";
  input Real offset "The current offset from buffer start";
  output Real y "The filtered data sample";

  annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Filter;
