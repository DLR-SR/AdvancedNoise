within Modelica_Noise.Math.Random.Utilities.Interfaces;
partial package PartialInterpolator "Interfaces of an interpolator in a buffer of random numbers"
  extends Modelica.Icons.Package;
  constant Boolean continuous=false
  "=true if interpolation is continuous, otherwise discontinuous";
  constant Integer nCopy=0
  "Number of buffer elements that need to be copied at an event";
  constant Integer overlap=0 "Number of overlap values needed in the buffer";


  replaceable partial function interpolate
  "Interface of a function to interpolate in a buffer of random numbers"
    extends Modelica.Icons.Function;
    input Real buffer[:] "Buffer of random numbers";
    input Real offset "Offset from buffer start";
    output Real y "Interpolated value at position offset";
  end interpolate;

end PartialInterpolator;
