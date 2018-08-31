within AdvancedNoise.Interpolators.Utilities.Interfaces;
partial package PartialInterpolator "Interfaces of an interpolator in a buffer of random numbers"
  extends Modelica.Icons.Package;
  constant Boolean continuous=false
  "=true if interpolation is continuous, otherwise discontinuous";
  constant Integer nFuture(min=0)=0
  "Number of buffer values required in the future (=0 for causal filters)";
  constant Integer nPast(min=0) = 0
  "Number of buffer values required in the past";
  constant Real varianceFactor = 1
  "The factor by which the variance will be scaled, if this interpolation is used";
  constant Integer smoothness = 0
  "The smoothness of the interpolation. =0: continuous, =1: continuous and differentiable, ...";


  replaceable partial function interpolate
  "Interface of a function to interpolate in a buffer of random numbers"
  import AdvancedNoise;
    extends AdvancedNoise.Interpolators.Utilities.Interfaces.interpolate;
    annotation (Documentation(info="<html>
<p>
This partial function defines the input and output arguments of
the function to interpolate in a buffer of random values.
</p>
</html>", revisions="<html>
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
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));
  end interpolate;


  annotation (Documentation(info="<html>
<p>
This partial package defines the elements and function interface of a package
to interpolate in buffer of random values. It is assumed that at one point in
time, a buffer is filled with random values. In order to interpolate in the
buffer, the following constants need to be defined:
</p>

<blockquote>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
<tr><th>Name of constant</th>
    <th>Description</th></tr>

<tr><td>continuous</td>
    <td>= true if interpolation is continuous, otherwise discontinuous</td></tr>

<tr><td>nFuture</td>
    <td>= Number of buffer values required at the end of the buffer, in order to
         interpolate at the last time instant for which the buffer values have
         been computed.</td></tr>

<tr><td>nPast</td>
    <td>= Number of buffer values required at the beginning of the buffer, in order to
        interpolate at the first time instant for which the buffer values have
        been computed.</td></tr>

<tr><td>varianceFactor</td>
    <td>A non-constant interpolation is changing the variance of the interpolated
        random values. varianceFactor is the factor by which the variance of the underlying
        random distribution needs to be multiplied, in order to arrive
        at the variance of the interpolated signal.</td></tr>

<tr><td>smoothness</td>
    <td>The smoothness of the interpolation:<br>
        =-1: discontinuous<br>
        = 0: continuous<br>
        = 1: continuous and differentiable</td></tr>
</table>
</blockquote>
</html>", revisions="<html>
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
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));
end PartialInterpolator;
