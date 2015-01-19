within Modelica_Noise.Math.Random.Utilities.Interpolators;
package SmoothIdealLowPass "Smooth interpolation (with sinc function)"
  extends Random.Utilities.Interfaces.PartialInterpolator(
                                                final continuous=true,
                                                final nCopy=9,
                                                final overlap=5);


  redeclare function extends interpolate
  "Smooth sinc interpolation in a buffer of random values"
protected
    constant Integer n = 5 "Number of support points for convolution";
    Real eps = 0.001;
    Real scaling;
    Real coefficient;
    Integer nBuffer = size(buffer,1);
  algorithm
    assert(offset >= n-eps and offset <= nBuffer - n + 1 + eps,
          "offset out of range (offset=" + String(offset) + ", nBuffer="+String(nBuffer)+")");

    // Initialize the convolution algorithm
    y       := 0;
    scaling := 0;

    // What is convolution?!
    //                               -2dt      t      +2dt
    //                         + - + - + - + - + - + - + - + - + -> simulation time
    //                           -3dt    -1dt     +1dt    +3dt
    //                                         |
    //
    //                      1 -|               ^    Kernel(delta_t)
    //                         |              / \
    //                         |     _       /   \       _
    //                         |  -3/ \-2 -1/  0  \1   2/ \3
    //                      0 -+ - + - + - + - + - + - + - + - + -> phase
    //                         |  |   | \ /   |   | \ /   |
    //             delta_t/dt <>         V           V
    //                        |   |   |   |   |   |   |   |   dt
    //                        |                              /
    //                        +   +   +   +   +   +   +   +<->+     sample
    //                           -3  -2  -1   0   1   2   3         0 at floor(time/dt) = instance
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
    // Loop over 2n support points for the convolution = sum( random(t_i)*kernel(t-t_i) )
    // The random number is for time =     (floor(t/dt) * dt + i * dt)
    // The kernel result is for time = t - (floor(t/dt) * dt + i * dt)
    // or, if sampled:          time = t - (    t_last       + i * dt)
    for i in (1-n):(n) loop
      coefficient        := kernel(t=mod(offset,1)+i);

  //     Modelica.Utilities.Streams.print("i=" + String(i) + ", "
  //                                     +"t=" + String(mod(offset,1)+i) + ", "
  //                                     +"k=" + String(coefficient)+ ", "
  //                                     +"o=" + String(offset));

      y                  := y + buffer[max(1,min(integer(offset)-i+1,nBuffer))]*coefficient;
      scaling            := scaling + coefficient;
    end for;

    annotation(Inline=true);
  end interpolate;


  annotation (Documentation(info=
                             "<html>
<p>
For details of the xorshift64* algorithm see 
<a href=\"http://xorshift.di.unimi.it/\">http://xorshift.di.unimi.it/</a> .
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={Line(
      points={{-90,-50},{-22,-50},{6,44},{88,44}},
      color={0,0,0},
      smooth=Smooth.Bezier)}));
end SmoothIdealLowPass;
