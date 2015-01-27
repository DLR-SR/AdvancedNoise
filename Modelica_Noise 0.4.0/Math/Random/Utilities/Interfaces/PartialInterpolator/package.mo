within Modelica_Noise.Math.Random.Utilities.Interfaces;
partial package PartialInterpolator "Interfaces of an interpolator in a buffer of random numbers"
  extends Modelica.Icons.Package;
  constant Boolean continuous=false
  "=true if interpolation is continuous, otherwise discontinuous";
  constant Integer nFuture(min=0)=0
  "Number of buffer values required in the future (=0 for causal filters)";
  constant Integer nPast(min=0) = 0
  "Number of buffer values required in the past";
  constant Real varianceFactor = 1
  "The factor by which the variance will be scaled, if this inteprolation is used";
  constant Integer smoothness = 0
  "The factor by which the variance will be scaled, if this inteprolation is used";


  replaceable partial function interpolate
  "Interface of a function to interpolate in a buffer of random numbers"
    extends Modelica.Icons.Function;
    input Real buffer[:] "Buffer of random numbers";
    input Real offset "Offset from buffer start (0..size(buffer)-1";
    output Real y "Interpolated value at position offset";
protected
    Integer nBuffer = size(buffer,1) "Size of the buffer";
  end interpolate;


  annotation (Documentation(info="<html>
<p>If we only use one overlap, we assume that overlap is the same size for elements in the future and in the past.</p>
</html>"));
end PartialInterpolator;
