within Noise.Filters;
function ArbitraryInterpolation
  "Apply an arbitrary interpolation by convolution with a Kernel"
  extends Noise.Utilities.Interfaces.Filter;
  input Utilities.Interfaces.Kernel kernel = Noise.Filters.Kernels.IdealLowPass
    annotation(choicesAllMatching=true, Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  input Integer n = 5 "Number of support points for convolution" annotation(Dialog);
protected
  Real scaling;
  Real coefficient;
algorithm

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
    coefficient        := kernel(t=mod(offset,1)+i, dt=1);

//     Modelica.Utilities.Streams.print("i=" + String(i) + ", "
//                                     +"t=" + String(mod(offset,1)+i) + ", "
//                                     +"k=" + String(coefficient)+ ", "
//                                     +"o=" + String(offset));
    y                  := y + buffer[integer(offset)-i+1]*coefficient;
    scaling            := scaling + coefficient;
  end for;

  // Scale the result in order to smooth higher harmonics
  y := y / scaling;
//  y:=buffer[integer(offset)+1];

  annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end ArbitraryInterpolation;
