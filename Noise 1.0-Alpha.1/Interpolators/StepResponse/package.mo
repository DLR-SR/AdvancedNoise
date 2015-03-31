within Noise.Interpolators;
package StepResponse "A generic filter using a tabulated step response"
  extends Utilities.Interfaces.PartialInterpolatorWithKernel(final continuous=false,
                                                             final nFuture=5,
                                                             nPast=5,
                                                             varianceFactor=0.900004539919624);

  //t = linspace(0,0.2,101); step = Noise.Interpolators.FirstOrder.kernel(t); plotArray(cat(1,Modelica.Math.Vectors.reverse(-t),t),cat(1,Modelica.Math.Vectors.reverse(-step),step))
  constant Real T[:] =      linspace(0, 0.2, 101) "Time vector";
  constant Real step[:] =   FirstOrder.kernel(T) "Step response data";
  constant Boolean mirror = true "Mirror the causal step response to -time?";


  redeclare function extends kernel
  "Kernel for first-order ideal low pass (k / (Ts + 1))"
  algorithm

    // Regular causal filter
    if     t <= T[1] then
      h := step[1];
    elseif t >= T[end] then
      h := step[end];
    else
      h := Modelica.Math.Vectors.interpolate(T, step, t);
    end if;

    // Apply the mirrored version, if anticausal filter is requested
    if mirror then
      if     t <= -T[end] then
        h := -step[end];
      elseif t < 0 then
        h := -Modelica.Math.Vectors.interpolate(T,step,-t);
      end if;
      h := h/2;
    end if;

    annotation(Inline=true);
  end kernel;


annotation (Icon(graphics={
                  Line(
      points={{-90,-48},{-22,-48},{-22,-48},{6,46},{88,46}},
      color={0,0,0},
      smooth=Smooth.Bezier)}));
end StepResponse;
