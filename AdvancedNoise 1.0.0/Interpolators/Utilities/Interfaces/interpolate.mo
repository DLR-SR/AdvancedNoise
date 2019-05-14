within AdvancedNoise.Interpolators.Utilities.Interfaces;
partial function interpolate
  "Interface of a function to interpolate in a buffer of random numbers"
  extends Modelica.Icons.Function;
  input Real buffer[:] "Buffer of random numbers";
  input Real offset "Offset from buffer start (0..size(buffer)-1";
  input Real samplePeriod = 1 "The sample period of the noise buffer";
  output Real y "Interpolated value at position offset";
protected
  Integer nBuffer = size(buffer,1) "Size of the buffer";
  annotation (Documentation(info="<html>
<p>
This partial function defines the input and output arguments of
the function to interpolate in a buffer of random values.
</p>
</html>",
        revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th align=\"left\">Description</th>
  </tr>
  <tr>
    <td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\">
      <table border=\"0\">
        <tr>
          <td valign=\"top\">
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));
end interpolate;
