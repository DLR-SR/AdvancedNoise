within ;
package AdvancedNoise "A library with additional noise modules compatible to the Modelica standard library"
  extends Modelica.Icons.Package;


  annotation(version =                        "1.0 Beta.1",
             versionDate =                    "2015-06-22",
             versionBuild =                   1,
             uses(Modelica(version="3.2.1"), Modelica_Noise(version=
          "1.0 Beta.1")),
  Icon(graphics={            Line(
      points={{-84,0},{-54,0},{-54,40},{-24,40},{-24,-70},{6,-70},{6,80},{36,80},
            {36,-20},{66,-20},{66,60}},
      color={0,0,0},
      smooth=Smooth.None)}));
end AdvancedNoise;
