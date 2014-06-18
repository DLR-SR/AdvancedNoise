within Noise.PSD;
function PSD_Convolution
  "Apply an arbitrary filter by convolution with its impulse response"
  extends Noise.Utilities.Interfaces.PSD;
  replaceable function Kernel = Noise.PSD.Kernels.IdealLowPass constrainedby
    Utilities.Interfaces.Kernel
    annotation(choicesAllMatching=true, Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));

  input Integer n = 5 "Number of support points for convolution" annotation(Dialog);
  input Integer max_n = n "Maximum nummber of support points for comparability"
                                                          annotation(Dialog);

protected
  Real raw "The raw random numbers from the PDF function";
  Real coefficient "The convolution coefficients";
  Real coefficient_l "The convolution coefficients";
  Real coefficient_r "The convolution coefficients";
  Real scaling1 "The scaling to make sure, a constant signal remains constant";
  Real scaling2 "The scaling to make sure, the variance remains";
  Integer states_temp[size(states_in,1)]
    "Intermediate states for recurrent RNGs";
    Integer j;
algorithm

// Initialize the convolution algorithm
  rand        := 0;
  scaling1    := 0;
  scaling2    := 0;
  states_temp := states_in;

// Make sure, the recurrent generators are centered
  for i in (-max_n):(-n) loop
    (raw,states_temp) := PDF(instance=(floor(t/dt) + i)*dt, states_in=states_temp);
  end for;

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

    coefficient_l      := if t_last <= t then Kernel(t=     -              n*dt, dt=dt) else
                                              Kernel(t=     -              n*dt, dt=dt);
    coefficient_r      := if t_last <= t then Kernel(t=   t - (    t_last-n *dt)+dt, dt=dt) else
                                              Kernel(t=   t - (floor(t/dt-n)*dt)+dt, dt=dt);
//    rand := rand + raw*(coefficient_r - coefficient_l);

    coefficient_l      := if t_last <= t then Kernel(t=   t - (    t_last+j *dt)-dt, dt=dt) else
                                              Kernel(t=   t - (floor(t/dt+j)*dt)-dt, dt=dt);
    coefficient_r      := if t_last <= t then Kernel(t=   t - (    t_last+j *dt), dt=dt) else
                                              Kernel(t=   t - (floor(t/dt+j)*dt), dt=dt);

  for i in (-n+1):(n) loop
    (raw, states_temp) := PDF(states_in=states_temp, instance=(floor(t/dt+i)*dt));
    coefficient        := if t_last <= t then Kernel(t=   t - (    t_last+i *dt), dt=dt) else
                                              Kernel(t=   t - (floor(t/dt+i)*dt), dt=dt);
    coefficient_l      := if t_last <= t then Kernel(t=   t - (    t_last+i *dt), dt=dt) else
                                              Kernel(t=   t - (floor(t/dt+i)*dt), dt=dt);
    coefficient_r      := if t_last <= t then Kernel(t=   t - (    t_last+i *dt)+dt, dt=dt) else
                                              Kernel(t=   t - (floor(t/dt+i)*dt)+dt, dt=dt);

  //  Modelica.Utilities.Streams.print("i=" + String(i) + ", raw=" + String(raw));
//    rand               := rand + raw*coefficient;
    rand               := rand + raw*(coefficient_r-coefficient_l);
    scaling1           := scaling1 + coefficient^1;
    scaling2           := scaling2 + coefficient^2;
  end for;

// Scale according to dt and n
  //rand := rand / 1;//dt;//sqrt((2*n+1) *dt^2);

// Scale the result in order to smooth higher harmonics
  //rand := rand / scaling1;

// Scale the result in order to match the variance
  //rand := rand * sqrt(abs(scaling1)) / sqrt(scaling2);

// Make sure, the output states_out for recurrent generators are senseful
  (rand_hold, states_out)    := PDF(states_in=states_in,   instance=floor(t/dt)*dt+dt);

  annotation (Icon(graphics), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PSD_Convolution;
