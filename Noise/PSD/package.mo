within Noise;
package PSD "Power spectral density functions"
  extends Modelica.Icons.Package;


  extends Utilities.Icons.PSD;


annotation (Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This package contains the implemented power spectral densities, i.e. the distributions of generated frequencies in the random signal.</p>
<p>There are currently two different ways of shaping these frequencies:</p>
<ul>
<li>An interpolation method (which is readily usabale) and</li>
<li>a convolution filter (which needs some review).</li>
</ul>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
          {100,100}}), graphics={
                          Text(
          extent={{-10,100},{100,-80}},
          lineColor={255,0,0},
        textString="?")}));
end PSD;
