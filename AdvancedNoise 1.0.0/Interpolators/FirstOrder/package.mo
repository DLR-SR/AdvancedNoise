within AdvancedNoise.Interpolators;
package FirstOrder "A linear first order filter (k / (Ts + 1))"
  extends Utilities.Interfaces.PartialInterpolatorWithKernel(final continuous=true,
                                                             final nFuture=0,
                                                             nPast=5,
                                                             varianceFactor=0.900004539919624,
                                                             suggestedSamplePeriod=0.1);

  constant Real k=1 "Gain";
  constant Modelica.SIunits.Period T=0.01 "Time Constant";


  redeclare function extends kernel
  "Kernel for first-order ideal low pass (k / (Ts + 1))"
protected
    Real a;
    Real b;
  algorithm

    // Transfer function:
    // G = k / (Ts + 1)
    //   = b / ( s + a) => b = k/T, a = 1/T
    b := k/T;
    a := 1/T;

    // Impulse response:
    // h =  b *   e^(-at)  for t >= 0
    //
    // Step response:
    // h = b/a*(1-e^(-at)) for t >= 0
    h := if t < 0 then 0 else b/a * (1-exp(-a*t));

    annotation(Inline=true);
  end kernel;


  redeclare function extends der_kernel_offset
protected
    function d = der(kernel, t);
  algorithm
    h := d(t);
  end der_kernel_offset;


  redeclare function extends interpolate

    annotation(Inline=true,
               derivative(order=1) = der_interpolate);
  end interpolate;


  annotation (
    Icon(graphics={
        Line(
          points={{-90,-48},{-22,-48},{-22,-48},{6,46},{88,46}},
          smooth=Smooth.Bezier)}),
    Documentation(revisions="<html>
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
</html>", info="<html>
<p>This interpolation uses a first order filter to smooth the data.</p>
</html>"));
end FirstOrder;
