within Modelica_Noise.Math.Random.Utilities.Interpolators;
package SmoothIdealLowPass "Smooth interpolation (with sinc function)"
  extends Random.Utilities.Interfaces.PartialInterpolator(
                                                final continuous=true,
                                                final nFuture=n-1,
                                                final nPast=n,
                                                final varianceFactor = 0.979776342307764,
                                                final smoothness = 1);
  constant Integer n = 5 "Number of support points for convolution";


  redeclare function extends interpolate
  "Smooth interpolation in a buffer of random values (using the sinc-function that approximates an ideal low pass filter)"
protected
    Real coefficient "The intermediate container for the kernel evaluations";
  algorithm
    // Ensure that offset is in assumed range
    assert(offset >= nPast and offset < nBuffer - nFuture,
           "offset out of range (offset=" + String(offset) + ", nBuffer="+String(nBuffer)+")");

    // Initialize the convolution algorithm
    y       := 0;

    // What is convolution?!
    //
    // We always carry a kernel function along with our time.
    // That means, that the kernel's central point kernel(0) always occurs at
    // the current time point!
    // Since we are working with an offset instead of the time directly,
    // the kernel's central point must occur at the current offset.
    //
    // See the following diagram:
    // (In our offset space, assume that dt=1 and t=offset.)
    //
    //                               t-2dt     t      t+2dt
    //                         + - + - + - + - + - + - + - + - + -> simulation time
    //                           t-3dt   t-1dt   t+1dt   t+3dt
    //                                         |
    //
    //                      1 -|               ^    kernel(delta_t)
    //                         |              / \
    //                         |     _       /   \       _
    //                         |  -3/ \-2 -1/  0  \1   2/ \3
    //                      0 -+ - + - + - + - + - + - + - + - + -> phase
    //                         |  |   | \ /   |   | \ /   |
    //                         |         V           V
    //             delta_t/dt <>
    //                        |
    // Now, we have some random samples, which are given at discrete points.
    // In our offset coordinates, these are given at integer offset values.
    //                        |
    //                        |   |   |   |   |   |   |   |   dt
    //                        |                              /
    //                        +   +   +   +   +   +   +   +<->+     offset
    //                           -3  -2  -1   0   1   2   3
    //
    // states_in _________________^___^___^___^___^___^___^
    //              iterations
    //               until -n       +1  +1  +1  +1  +1  +1
    //
    // Convolution: filter = sum( signal(time) * Kernel(phase*pi) )
    //              time   = sample + instance
    //              phase  = sample - delta_t/dt
    //              sample = -2 .. 3
    //
    // Loop over 2n support points for the convolution = sum( random(i)*kernel(offset-i) )
    // The random number is for time =     (floor(t/dt) * dt + i * dt)
    // The kernel result is for time = t - (floor(t/dt) * dt + i * dt)
    // or, if sampled:          time = t - (    t_last       + i * dt)

    // Calculate weighted sum over -nPast...nFuture random samples
    for i in -nPast:nFuture loop

      // We use the kernel in -i direction to enable step response kernels
      coefficient        :=     kernel(t=mod(    offset,1)-i);

      // We use the kernel in +i direction for the random samples
      // The +1 accounts for one-based indizes
      y                  := y + buffer[  integer(offset)  +i+1]*coefficient;

      //  Modelica.Utilities.Streams.print("i=" + String(i) + ", "
      //                                  +"t=" + String(mod(offset,1)+i) + ", "
      //                                  +"k=" + String(coefficient)+ ", "
      //                                  +"o=" + String(offset)+ ", "
      //                                  +"n=" + String(integer(offset)+i));
    end for;
    annotation(derivative(order=1) = der_interpolate, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><code>y = SmoothIdealLowPass.<b>interpolate</b>(buffer,offset);</code> </blockquote>
<h4>Description</h4>
<p>Interpolate in buffer by using the <a href=\"modelica://Modelica_Noise.Math.Special.sinc\">sinc</a> function. This is an approximation of an ideal low pass filter that completely blocks frequencies above the cut-off frequency f = 1/T (where T is the sample period with which the buffer was filled). Input argument offset is a Real number marking the point at which interpolation shall take place. offset=0 is the first buffer value buffer[1]. offset=size(buffer,1)-1 is the last buffer value buffer[size(buffer,1)]. It is required that 0 &le; offset &LT; size(buffer,1)-1. The function returns the interpolated value. The interpolation is continuous with a continuous first derivative. In order to avoid issues at the end of the buffer (where a minimally too large offset value triggers an assert), it is best to make the buffer one element larger as needed. For example, if the buffer is filled with a sample period of 1 ms and every 100 samples an event occurs, then the buffer should have length 102 for the samples 0 ms, 1 ms, 2 ms, ...., 100 ms, 101 ms. </p>
</html>"));
  end interpolate;


  function kernel "Kernel for ideal low pass (sinc-function)"
    import Modelica_Noise.Math.Special.sinc;
    import Modelica.Constants.pi;
    input Real t "The (scaled) time for sampling period=1";
    input Modelica.SIunits.Frequency f=1/2
    "The cut-off frequency of the filter";
    output Real h "The impulse response of the convolution filter";
  algorithm
    h := 2*f*sinc(2*pi*f*t);
    annotation(Inline=true, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><code>h = SmoothIdealLowPass.<b>kernel</b>(offset); </code></blockquote>
<h4>Description</h4>
<p>This function defines the kernel of the <a href=\"SmoothIdealLowPass\">SmoothIdealLowPass</a> interpolation. It uses the <a href=\"Math.Special.sinc\">sinc</a> function with a specified cut-off frequency.</p>
</html>"));
  end kernel;


  function der_kernel_offset
    input Real t "The (scaled) time for sampling period=1";
    input Modelica.SIunits.Frequency f=1/2
    "The cut-off frequency of the filter";
    output Real h "The impulse response of the convolution filter";
protected
    function d = der(kernel, t);
  algorithm
    h := d(t,f);
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><code>der_h = SmoothIdealLowPass.<b>der_kernel_offset</b>(offset); </code></blockquote>
<h4>Description</h4>
<p>This function defines the derivative of the <a href=\"kernel\">kernel</a> of the <a href=\"SmoothIdealLowPass\">SmoothIdealLowPass</a> interpolation with respect to its input argument offset. This function is used for determining the derivative of the interpolated signal.</p>
</html>"));
  end der_kernel_offset;


  annotation (Documentation(info="<html>
<p>
This Interpolation package provides <b>smooth</b> interpolation in a buffer
by approximating an ideal low pass filter (with an infinite steep drop of the
frequency response at the cut-off frequency) using an interpolation with 
the <a href=\"modelica://Modelica_Noise.Math.Special.sinc\">sinc</a> function over
a finite number of support points (the ideal low pass filter would require
an infinite number of support points).
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={Line(
      points={{-90,-50},{-22,-50},{6,44},{88,44}},
      color={0,0,0},
      smooth=Smooth.Bezier)}));
end SmoothIdealLowPass;
