within Noise.Interpolators;
package FirstOrder "A linear first order filter (k / (Ts + 1))"
  extends Utilities.Interfaces.PartialInterpolatorWithKernel(final continuous=true,
                                                             final nFuture=0,
                                                             nPast=5,
                                                             varianceFactor=0.900004539919624);

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


annotation (Icon(graphics={
                  Line(
      points={{-90,-48},{-22,-48},{-22,-48},{6,46},{88,46}},
      color={0,0,0},
      smooth=Smooth.Bezier)}));
end FirstOrder;
