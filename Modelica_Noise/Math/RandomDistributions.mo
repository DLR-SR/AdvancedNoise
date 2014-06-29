within Modelica_Noise.Math;
package RandomDistributions
  "Library of random number generators according to specific probability density functions"
    extends Modelica.Icons.Package;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;
    partial function partialInputOutput
      "The basic interface for inputs and outputs of a random number generator function"
      input Modelica.SIunits.Time instance
        "The current time for an arithmetic random number generator";
      input Integer[:] states_in
        "The discrete states for a recursive random number generator";
      output Real rand
        "The random number with a uniform distribution on the interval [1,0]";
      output Integer[size(states_in,1)] states_out
        "The new states of a recursive random number generator";
      annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end partialInputOutput;

    partial function partialRandom
      "The basic interface for a probability density function"
      extends partialInputOutput;
      replaceable function RNG = Modelica_Noise.Math.Random.SampleBased.RNG_LCG
        constrainedby Random.Interfaces.partialRNG
        "The random number generator function to be used"
        annotation(choicesAllMatching=true,
                   Dialog(enable=false,
                          tab = "Do not use"),
        Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
            Text(
              lineColor={0,0,255},
              extent={{-150,105},{150,145}},
              textString="%name"),
            Ellipse(
              lineColor = {108,88,49},
              fillColor = {255,215,136},
              fillPattern = FillPattern.Solid,
              extent = {{-100,-100},{100,100}})}),
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end partialRandom;
  end Interfaces;

  function uniform
    "A random number with a uniform distribution in a given interval"
    extends Modelica_Noise.Math.RandomDistributions.Interfaces.partialRandom;
    input Real[2] interval = {0,1}
      "The interval from which the uniformly distributed random number is generated"
     annotation(Dialog);
  algorithm

    // Retrieve uniformly distributed random number
    (rand,states_out) :=RNG(instance=instance, states_in=states_in);

    // Transform limits of distribution
    rand              := rand*(interval[2] - interval[1]) + interval[1];
    annotation (Icon(graphics={Line(
            points={{-50,-60},{-50,60},{48,60},{48,-62}},
            color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  end uniform;

  function normal
    "A random number with approximate normal distribution using the BoxMuller method"
    extends Modelica_Noise.Math.RandomDistributions.Interfaces.partialRandom;
    input Real mu = 0 "The expectation (mean) value of the normal distribution"
                                                                                annotation(Dialog);
    input Real sigma = 1 "The standard deviation of the normal distribution" annotation(Dialog);
  protected
    Real U;
    Real V;
  algorithm

    // Retrieve two independent uniformly distributed random numbers
    states_out      := states_in;
    (U,states_out) :=RNG(instance=instance, states_in=states_out);
    (V,states_out) :=RNG(instance=U*U + U, states_in=states_out);

    // Apply Box-Muller transformation
    rand            := mu + sigma*sqrt(-2*log(U))*cos(2*Modelica.Constants.pi*V);
    annotation (Icon(graphics={Line(
            points={{-70,-53.953},{-66.5,-53.8975},{-63,-53.7852},{-59.5,-53.5674},
                {-56,-53.1631},{-52.5,-52.4442},{-49,-51.2213},{-45.5,-49.2318},
                {-42,-46.1385},{-38.5,-41.5468},{-35,-35.0467},{-31.5,-26.2849},
                {-28,-15.0617},{-24.5,-1.4388},{-21,14.1682},{-17.5,30.9428},{-14,
                47.695},{-10.5,62.9771},{-7,75.2797},{-3.5,83.2739},{0,86.047},{
                3.5,83.2739},{7,75.2797},{10.5,62.9771},{14,47.695},{17.5,30.9428},
                {21,14.1682},{24.5,-1.4388},{28,-15.0617},{31.5,-26.2849},{35,-35.0467},
                {38.5,-41.5468},{42,-46.1385},{45.5,-49.2318},{49,-51.2213},{52.5,
                -52.4442},{56,-53.1631},{59.5,-53.5674},{63,-53.7852},{66.5,-53.8975},
                {70,-53.953}},
            color={255,0,0},
            smooth=Smooth.Bezier)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  end normal;

  function CauchyLorentz "A random number with Cauchy-Lorentz distribution"
    extends Modelica_Noise.Math.RandomDistributions.Interfaces.partialRandom;
    import Modelica.Constants.pi;
    input Real mu = 0 "The expectation (mean) value of the distribution" annotation(Dialog);
    input Real gamma = 1 "The standard deviation of the normal distribution" annotation(Dialog);
  algorithm

    // Retrieve uniformly distributed random number
    (rand,states_out) :=RNG(instance=instance, states_in=states_in);

    // Transform by inverse cumulative density function
    // CDF = 1/pi atan( (x-mu)/gamma ) + 1/2
    // x   = mu + gamma tan pi (CDF - 1/2)
    rand              := mu + gamma * tan(pi * (rand - 0.5));
    annotation (Icon(graphics={Line(
            points={{-66,-47.7647},{-62.5,-46.9326},{-59,-45.9713},{-55.5,-44.8535},
                {-52,-43.5445},{-48.5,-42},{-45,-40.1629},{-41.5,-37.9588},{-38,
                -35.2899},{-34.5,-32.0274},{-31,-28},{-27.5,-22.9811},{-24,-16.6742},
                {-20.5,-8.7027},{-17,1.377},{-13.5,14},{-10,29.3659},{-6.5,46.9412},
                {-3,64.6897},{0.5,78.6154},{4,84},{7.5,78.6154},{11,64.6897},{14.5,
                46.9412},{18,29.3659},{21.5,14},{25,1.377},{28.5,-8.7027},{32,-16.6742},
                {35.5,-22.9811},{39,-28},{42.5,-32.0274},{46,-35.2899},{49.5,-37.9588},
                {53,-40.1629},{56.5,-42},{60,-43.5445},{63.5,-44.8535},{67,-45.9713},
                {70.5,-46.9326},{74,-47.7647}},
            color={255,0,0},
            smooth=Smooth.Bezier)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  end CauchyLorentz;

  function Weibull "A random number with Weibull distribution"
    extends Modelica_Noise.Math.RandomDistributions.Interfaces.partialRandom;
    input Real lambda(min=0) = 1 "The scale parameter of the distribution" annotation(Dialog);
    input Real k(min=0) = 1 "The shape parameter of the normal distribution" annotation(Dialog);
  algorithm

    // Retrieve uniformly distributed random number
    (rand,states_out) :=RNG(instance=instance, states_in=states_in);

    // Transform by inverse cumulative density function
    // CDF = 1 - exp( -(x/lambda)^k ) for x >= 0
    // x   = lambda * (-ln( 1-CDF ))^(1/k)
    rand              := lambda * (-log( 1-rand)) ^(1/k);
    annotation (Icon(graphics={Line(
            points={{-70,-50},{-66.5,-50},{-63,-50},{-59.5,-50},{-56,-50},{-52.5,
                -50},{-49,-50},{-45.5,-50},{-42,-50},{-38.5,-50},{-35,-50},{-31.5,
                -50},{-28,-50},{-24.5,-50},{-21,-50},{-17.5,-50},{-14,-50},{-10.5,
                -50},{-7,-50},{-3.5,-50},{0,-50},{3.5,53.1424},{7,81.1658},{10.5,
                90},{14,87.3585},{17.5,77.6645},{21,64.0082},{24.5,48.6157},{28,
                33.0458},{31.5,18.3239},{35,5.0576},{38.5,-6.4596},{42,-16.1579},
                {45.5,-24.1153},{49,-30.4975},{52.5,-35.5133},{56,-39.3832},{59.5,
                -42.3187},{63,-44.5105},{66.5,-46.123},{70,-47.2928}},
            color={255,0,0},
            smooth=Smooth.Bezier)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  end Weibull;

  function IrwinHall
    "A random number with Irwin-Hall distribution (sum of uniform variables)"
    extends Modelica_Noise.Math.RandomDistributions.Interfaces.partialRandom;
    input Real[2] interval = {0,1}
      "The interval from which the uniformly distributed random number is generated"
      annotation(Dialog);
    input Integer n = 1 "The number of samples used for summation"
      annotation(Dialog);
  protected
    Real temp;
  algorithm

    // Retrieve n uniformly distributed random numbers and sum them up
    rand       := 0;
    states_out := states_in;
    for i in 1:n loop
      (temp,states_out) :=RNG(instance=instance^i, states_in=states_out);
      rand              := rand + temp;
    end for;

    // Scale with interval boundaries
    rand := rand * (interval[2] - interval[1]) + interval[1]*n;

    annotation (Icon(graphics={Line(
            points={{-74,-52},{-70.5,-52},{-67,-52},{-63.5,-52},{-60,-52},{-56.5,
                -52},{-53,-52},{-49.5,-52},{-46,-52},{-42.5,-52},{-39,-52},{-35.5,
                -52},{-32,-52},{-28.5,-52},{-25,-52},{-21.5,-52},{-18,-52},{-14.5,
                -52},{-11,-52},{-7.5,-52},{-4,-52},{-0.5,-51.962},{3,-51.3913},{
                6.5,-48.9185},{10,-42.2609},{13.5,-28.413},{17,-5.7391},{20.5,23.9348},
                {24,55.1304},{27.5,79.0978},{31,88},{34.5,79.0978},{38,55.1304},
                {41.5,23.9348},{45,-5.7391},{48.5,-28.413},{52,-42.2609},{55.5,-48.9185},
                {59,-51.3913},{62.5,-51.962},{66,-52}},
            color={255,0,0},
            smooth=Smooth.Bezier)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  end IrwinHall;

  function Bates
    "A random number with Bates distribution (mean of uniform variables)"
    extends Modelica_Noise.Math.RandomDistributions.Interfaces.partialRandom;
    input Real[2] interval = {0,1}
      "The interval from which the uniformly distributed random number is generated"
      annotation(Dialog);
    input Integer n = 1 "The number of samples used for averaging"
      annotation(Dialog);
  protected
    Real temp;
  algorithm

    // Retrieve n uniformly distributed random numbers and sum them up
    rand       := 0;
    states_out := states_in;
    for i in 1:n loop
      (temp,states_out) :=RNG(instance=instance^i, states_in=states_out);
      rand              := rand + temp;
    end for;

    // Scale with interval boundaries
    rand := rand/n * (interval[2] - interval[1]) + interval[1];

    annotation (Icon(graphics={Line(
            points={{-72,-56},{-68.5,-56},{-65,-56},{-61.5,-56},{-58,-56},{-54.5,
                -56},{-51,-56},{-47.5,-56},{-44,-56},{-40.5,-56},{-37,-56},{-33.5,
                -56},{-30,-56},{-26.5,-56},{-23,-56},{-19.5,-56},{-16,-56},{-12.5,
                -56},{-9,-56},{-5.5,-56},{-2,-56},{1.5,-55.962},{5,-55.3913},{8.5,
                -52.9185},{12,-46.2609},{15.5,-32.413},{19,-9.7391},{22.5,19.9348},
                {26,51.1304},{29.5,75.0978},{33,84},{36.5,75.0978},{40,51.1304},
                {43.5,19.9348},{47,-9.7391},{50.5,-32.413},{54,-46.2609},{57.5,-52.9185},
                {61,-55.3913},{64.5,-55.962},{68,-56}},
            color={255,0,0},
            smooth=Smooth.Bezier)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  end Bates;

  function discreteValues
    "A random number with discrete values of given probability"
    extends Modelica_Noise.Math.RandomDistributions.Interfaces.partialRandom;
    import Modelica_Noise.Math.cumsum;
    input Real x[:] = {0,1} "Discrete values to be chosen from" annotation(Dialog);
    input Real p[size(x,1)] = ones(size(x,1))/size(x,1)
      "The probabilities of the discrete values" annotation(Dialog);
  protected
    Real P[:] = cumsum(p);
    Real raw;
  algorithm

    // Retrieve a raw uniformly distributed random number
    (raw,states_out) :=RNG(instance=instance, states_in=states_in);

    // Scale raw to range up to max(P)
    raw := raw * max(P);

    // Select a value
    for i in size(P,1):-1:1 loop
      if raw < P[i] then
        rand := x[i];
      end if;
    end for;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}),
                     graphics={
          Ellipse(
            extent={{-58,34},{-50,26}},
            lineColor={255,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-4,72},{4,64}},
            lineColor={255,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{54,0},{62,-8}},
            lineColor={255,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-76,-46},{72,-46},{70,-46}},
            color={255,0,0},
            smooth=Smooth.None),
          Line(
            points={{-54,30},{-54,-46}},
            color={255,0,0},
            smooth=Smooth.None),
          Line(
            points={{0,68},{0,-46}},
            color={255,0,0},
            smooth=Smooth.None),
          Line(
            points={{58,-2},{58,-46}},
            color={255,0,0},
            smooth=Smooth.None)}),            Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  end discreteValues;
end RandomDistributions;
