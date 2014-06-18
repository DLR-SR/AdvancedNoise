within Noise.Utilities.Interfaces;
partial function Kernel
  "Interface for convolution kernels (impulse responses) of convolution filters"
  input Real t "The time";
  input Real dt "The sampling period of the signal";
  output Real h "The impulse response of convolution filter";
  annotation (Icon(graphics={
        Polygon(
          points={{-10,100},{-20,80},{0,80},{-10,100}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-10,-100},{-10,100}}, color={0,0,0}),
        Line(points={{-100,-10},{100,-10}},
                                        color={0,0,0}),
        Polygon(
          points={{100,-10},{80,0},{80,-20},{100,-10}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end Kernel;
