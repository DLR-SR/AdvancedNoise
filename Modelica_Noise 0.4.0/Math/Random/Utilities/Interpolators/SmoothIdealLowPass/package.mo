within Modelica_Noise.Math.Random.Utilities.Interpolators;
package SmoothIdealLowPass "Smooth interpolation (with sinc function)"
  extends Interfaces.PartialInterpolatorWithKernel(
                                                final continuous=true,
                                                final nFuture=n-1,
                                                final nPast=n,
                                                final varianceFactor = 0.979776342307764);
  constant Integer n = 5 "Number of support points for convolution";


  redeclare function extends kernel "Kernel for ideal low pass (sinc-function)"
    import Modelica_Noise.Math.Special.sinc;
    import Modelica.Constants.pi;
    input Modelica.SIunits.Frequency f=1/2
    "The cut-off frequency of the filter";
  algorithm
    h := 2*f*sinc(2*pi*f*t);
    annotation(Inline=true);
  end kernel;


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
