within Noise.PDF;
function PDF_Discrete
  "A random number with discrete values of given probability"
  extends Noise.Utilities.Interfaces.PDF;
  import Noise.Utilities.Math.cumsum;
  input Real x[:] = {0,1} "Discrete values to be chosen from" annotation(Dialog);
  input Real p[size(x,1)] = ones(size(x,1))/size(x,1)
    "The probabilities of the discrete values" annotation(Dialog);
protected
  Real P[:] = cumsum(p);
  Real raw;
algorithm

  // Retrieve a raw uniformly distributed random number
  (raw,states_out) := RNG(instance=instance, states_in=states_in);

  // Scale raw to range up to max(P)
  raw := raw * max(P);

  // Select a value
  for i in size(P,1):-1:1 loop
    if raw < P[i] then
      rand := x[i];
    end if;
  end for;

  annotation (Icon(graphics={
        Line(
          points={{-80,-80},{-60,-80},{-60,20},{-60,-80},{-30,-80},{-30,-8},{-30,
              -80},{-10,-80},{-10,60},{-10,-80},{20,-80},{20,30},{20,-80},{52,-80},
              {52,-6},{52,-80},{60,-80}},
          color={255,0,0},
          smooth=Smooth.None),
        Ellipse(
          extent={{-64,24},{-56,16}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-34,-2},{-26,-10}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-14,64},{-6,56}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{16,34},{24,26}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{48,-2},{56,-10}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end PDF_Discrete;
