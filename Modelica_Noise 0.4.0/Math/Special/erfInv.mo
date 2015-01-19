within Modelica_Noise.Math.Special;
function erfInv "Inverse error function"
  input Real u;
  output Real y;
algorithm
  y :=cdfInvNormal((1 + u)/2)/sqrt(2);
  annotation (Inline=true, Documentation(info="<html>
</html>"));
end erfInv;
