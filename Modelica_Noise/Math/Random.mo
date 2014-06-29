within Modelica_Noise.Math;
package Random
  "Library of functions generating random numbers in the interval [0,1]"
  extends Modelica.Icons.Package;

  package SampleBased
    extends Modelica.Icons.Package;

    function RNG_MRG
      "Multiple recursive generator implementing the equation i = mod( sum(a*i) + c, m)"
      extends Modelica_Noise.Math.Random.Interfaces.SampleBasedRNG;
      input Integer[:] a = {1071064,0,0,0,0,0,2113664}
        "The multiplier for the linear congruential generator"
        annotation(Dialog);
      input Integer c = 0
        "The increment for abstracting linear congruential generators"
        annotation(Dialog);
      input Integer m = 2147483629
        "The modulus for the multiple recursive generator"
        annotation(Dialog);
    algorithm
      assert(size(states_in,1) >= size(a,1), "State must have at least as many elements as a!");

      // Calculate new state
      states_out        := states_in;
      states_out[1]     := 0;
      for i in 1:size(a,1) loop
        states_out[1]   := states_out[1] + a[i] * states_in[i];
      end for;
      states_out[1]     := integer(mod(states_out[1] + c, m));

      // Advance old states
      for i in 1:size(a,1)-1 loop
        states_out[i+1] :=                        states_in[i];
      end for;

      // Calculate the random number
      rand              := abs(states_out[1] / (m-1)); // m is sometimes negative?!

      annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end RNG_MRG;

    function RNG_LCG
      "Linear congruential generator implementing the equation i = mod(a*i+c, m)"
      extends Modelica_Noise.Math.Random.Interfaces.SampleBasedRNG;
      input Integer a = 69069
        "The multiplier for the linear congruential generator"
        annotation(Dialog);
      input Integer c = 1 "The increment for the linear congruential generator"
                                                                                annotation(Dialog);
      input Integer m = 2147483647
        "The modulus for the linear congruential generator"
        annotation(Dialog);
    algorithm
      (rand, states_out) := RNG_MRG(instance, states_in, a={a}, c=c, m=m);

      annotation ( Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end RNG_LCG;

    function RNG_LCG_NumericalRecipes = RNG_LCG (
        a=1664525,
        c=1013904223,
        m=integer(2^32))
      "Linear congruential generator with parameters as used in book Numerical Recipes"
      annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    function RNG_LCG_VAX =              RNG_LCG (
        a=69069,
        c=1,
        m=integer(2^32))
      "Linear congruential generator with parameters from VAX's MTH$RANDOM and old versions of glibc"
      annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This package contains conventional sampled random number generators.</p>
</html>"));
  end SampleBased;

  package SampleFree
    extends Modelica.Icons.Package;

    function RNG_Weyl
      "Number generator based on the Equidistribution Theorem (Weyl's criterion), WARNING: Not random!"
      extends Modelica_Noise.Math.Random.Interfaces.SampleFreeRNG;
      input Real y0 = sqrt(4345543)-1
        "An irrational number used to yield the pseudo-random number rand_i = i*yo mod 1"
        annotation(Dialog);
    algorithm
      states_out := states_in;
      rand       := mod((1+instance)*y0, 1);
      annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",     info="<html>
<p>This is not actually a random number generator. Weyl&apos;s theorem guarantees a very uniform distribution, but the generated signal is highly correlated.</p>
</html>"));
    end RNG_Weyl;

    function RNG_DIRCS "DIRCS Immediate Random with Continuous Seed"
      extends Modelica_Noise.Math.Random.Interfaces.SampleFreeRNG;
      replaceable function Seed = Modelica_Noise.Math.Random.Seed.Seed_Real
        constrainedby Modelica_Noise.Math.Random.Interfaces.Seed
        "The seeding function to be used"
        annotation(choicesAllMatching=true, Dialog,
        Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",     info="<html>
<p>This replaceable function is used to seed the RNG used in the DIRCS algorithm. You can redeclare any function from here: <a href=\"Modelica_Noise.Seed\">Modelica_Noise.Seed</a>.</p>
</html>"));
      replaceable function RNG = Modelica_Noise.Math.Random.SampleBased.RNG_MRG
          (a={134775813,134775813}, c=1) constrainedby
        Modelica_Noise.Math.Random.Interfaces.partialRNG
        "The random number generator function to be used"
        annotation(choicesAllMatching=true, Dialog,
        Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",     info="<html>
<p>This replaceable RNG function is used in the DIRCS algorithm. You can redeclare any SampleBased RNG from here: <a href=\"Modelica_Noise.RNG.SampleBased\">Modelica_Noise.RNG.SampleBased</a>.</p>
</html>"));
      input Integer k = 1 "The number of RNG iterations to apply to the seed";
    protected
      Integer states_internal[2];
    algorithm
      states_internal := Seed(real_seed=instance, local_seed=states_in[1], global_seed=0, n=2);
      for i in 1:k loop
        (rand, states_internal) := RNG(instance=instance, states_in=states_internal);
      end for;
      states_out := states_in;

      annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",     info="<html>
<p>This is the random number generator &QUOT;DIRCS Immediate Random with Continuous Seed&QUOT;. It uses the time to seed a conventional sampled random number generator and does a number of discrete steps with this generator. The seeding function <a href=\"Seed\">Seed</a> and the random number generator <a href=\"RNG\">RNG</a> can be specified modularly.</p>
</html>"));
    end RNG_DIRCS;
  annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This package contains sample-free random number generators, especially <a href=\"RNG_DIRCS\">DIRCS</a>.</p>
</html>"));
  end SampleFree;

  package Seed "A number of seeding functions"
    extends Modelica.Icons.Package;

    function Seed_MRG "Uses an MRG for seeding"
      extends Interfaces.Seed;
      input Integer[:] a = fill(134775813,n)
        "The multiplier for the linear congruential generator"
        annotation(Dialog);
      input Integer c = 1
        "The increment for abstracting linear congruential generators"
        annotation(Dialog);
      input Integer m = 2147483629
        "The modulus for the multiple recursive generator"
        annotation(Dialog);
      input Integer k = n
        "The number times the MRG shall be applied to the initial state vector";
    protected
      Real dummy;
      Integer internal_states[max(n,2)];
    algorithm
      assert(n>0, "You are seeding a state vector of size 0!");

      // Build an initial state vector
      internal_states := cat(1,{local_seed,global_seed},fill(0, max(n, 2) - 2));

      // Do the iterations
      for i in 1:k loop
        (dummy, internal_states) :=Math.Random.SampleBased.RNG_MRG(
            instance=real_seed,
            states_in=internal_states,
            a=a,
            c=c,
            m=m);
      end for;

      // Fill the output state vector
      for i in 1:n loop
        states[i] := internal_states[i];
      end for;

      annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",     info="<html>
<p>This function fills the initial state vector using the <a href=\"Modelica_Noise.RNG.SampleBased.RNG_MRG\">MRG</a> random number generator.</p>
</html>"));
    end Seed_MRG;

    function Seed_Real "Uses the real value for seeding"
      extends Interfaces.Seed;
    algorithm
      states :=
        Modelica_Noise.Blocks.Sources.NoiseAuxiliaries.Auxiliary.SeedReal(
            local_seed=local_seed,
            global_seed=global_seed,
            real_seed=real_seed,
            n=n);

     annotation (Include = "#include \"ModelicaNoise.c\"", Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",     info="<html>
<p>This function converts the Real value to Integer values and fills the state vector with them.</p>
</html>"));
    end Seed_Real;
  annotation (Icon(graphics),Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>",   info="<html>
<p>This package contains the seeding functions, i.e. the generation of initial states for the sample-based random number generators. The sample-free methods hava a contanst &QUOT;initial state&QUOT; and only use the first entries of the &QUOT;initial state&QUOT; for their continuous seeding.</p>
</html>"));
  end Seed;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;
    partial function partialRNG
      "The basic interface for the random number generator"
      extends Math.RandomDistributions.Interfaces.partialInputOutput;
      annotation (Icon(graphics={
            Line(points={{-80,-90},{-80,90}},   color={0,0,0}),
            Polygon(
              points={{-80,90},{-90,70},{-70,70},{-80,90}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-80},{90,-80}},
                                            color={0,0,0}),
            Polygon(
              points={{90,-80},{70,-70},{70,-90},{90,-80}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,60},{90,60}}, color={0,0,0}),
            Rectangle(
              lineColor={255,128,0},
              extent={{-100,-100},{100,100}},
              radius=25)}),                                   Documentation(
            revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end partialRNG;

    partial function SampleBasedRNG
      "The interface for sample based random number generators"
      extends partialRNG;
      annotation (Icon(graphics={
            Line(
              points={{70,60},{70,-80}},
              color={95,95,95}),
            Line(
              points={{-40,60},{-40,-80}},
              color={95,95,95}),
            Line(
              points={{-2,60},{-2,-80}},
              color={95,95,95}),
            Line(
              points={{36,60},{36,-80}},
              color={95,95,95}),
            Ellipse(
              extent={{-82,42},{-78,38}},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              fillColor={255,0,0},
              lineColor={0,0,0}),
            Line(
              points={{-80,40},{-40,40}},
              color={255,0,0}),
            Ellipse(
              extent={{-42,-38},{-38,-42}},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              fillColor={255,0,0},
              lineColor={0,0,0}),
            Line(
              points={{-40,-40},{-2,-40}},
              color={255,0,0}),
            Ellipse(
              extent={{-4,-18},{0,-22}},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              fillColor={255,0,0},
              lineColor={0,0,0}),
            Line(
              points={{-2,-20},{36,-20}},
              color={255,0,0}),
            Ellipse(
              extent={{34,28},{38,24}},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              fillColor={255,0,0},
              lineColor={0,0,0}),
            Line(
              points={{36,26},{70,26}},
              color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end SampleBasedRNG;

    partial function SampleFreeRNG
      "The interface for sample free  random number generators"
      extends partialRNG;
      annotation (Icon(graphics={Line(
              points={{-80,40},{-70,0},{-60,58},{-52,20},{-40,-40},{-30,-20},{-20,
                  -80},{-10,20},{0,-20},{10,40},{20,-40},{30,20},{40,26},{50,60},{
                  60,20},{70,-60},{80,0}},
              color={255,0,0})}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end SampleFreeRNG;

    partial function Seed "The basic interface for a seeding function"
      input Integer local_seed = 12345
        "The local seed to be used for generating initial RNG states";
      input Integer global_seed = 67890
        "The global seed to be combined with the local seed";
      input Real real_seed = 1.234
        "A Real value to use as a seed for continuous seeding";
      input Integer n = 33 "The number of initial state values to be generated";
      output Integer states[n] "The generated initial states";
      annotation (
      Icon(graphics={
            Line(points={{0,-100},{0,100}},     color={0,0,0}),
            Polygon(
              points={{0,100},{-10,80},{10,80},{0,100}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Line(points={{-20,-80},{92,-80}},
                                            color={0,0,0}),
            Polygon(
              points={{92,-80},{72,-70},{72,-90},{92,-80}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Line(points={{0,70},{90,70}},   color={0,0,0}),
            Line(points={{-96,24},{-10,-20}},
                                            color={0,0,0}),
            Polygon(
              points={{0,-24},{-16,-8},{-22,-24},{0,-24}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-2,-22},{2,-26}},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              fillColor={255,0,0},
              lineColor={0,0,0}),
            Line(
              points={{0,-24},{80,-24}},
              color={255,0,0}),
            Rectangle(
              lineColor={255,128,0},
              extent={{-100,-100},{100,100}},
              radius=25)}),
      Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
    end Seed;
  end Interfaces;
annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
          {100,100}}),
                 graphics), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<h4><span style=\"color:#008000\">Introduction</span></h4>
<p>This package contains the implemented random number generators.</p>
<h5>SampleBased RNGs</h5>
<p>These need a state and correspond to many well-known and well-studied RNGs.</p>
<h5>SampleFree RNGs</h5>
<p>These do not need a state and thus don&apos;t issue events. They are, however, not yet as well studied...</p>
<h4><span style=\"color:#008000\">Important properties</span></h4>
<h5>Period</h5>
<p>When does the randum number stream repeat?</p>
<h5>Uniformity</h5>
<p>Are the random numbers uniformly distributed between 0 and 1?</p>
<h5>Correlation of randum numbers</h5>
<p>Are subsequent random numbers correlated? Are random numbers with different seeds correlated?</p>
</html>"));
end Random;
