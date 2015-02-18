within Modelica_Noise.Math;
package Random "Library of functions for the generation of random numbers"
   extends Modelica.Icons.Package;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
        -100},{100,100}}), graphics={
    Ellipse(
      extent={{-84,84},{-24,24}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{22,62},{82,2}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{-58,6},{2,-54}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{26,-30},{86,-90}},
      lineColor={0,0,0},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
This package contains low level functions for the generation of random numbers.
Usually, the functions in this package are not used directly, but are utilized
as building blocks of higher level functionality.
</p>

<p>
Package <a href=\"modelica://Modelica_Noise.Math.Random.Generators\">Math.Random.Generators</a>
contains various pseudo random number generators. These generators are used in the blocks
of package <a href=\"modelica://Modelica_Noise.Blocks.Noise\">Blocks.Noise</a> to generate
reproducible noise signals.
Package <a href=\"modelica://Modelica_Noise.Math.Random.Utilities\">Math.Random.Utilities</a>
contains utility functions for the random number generators,
that are usually of no interested for the user
(they are, for example, used to implement the blocks in
package <a href=\"modelica://Modelica_Noise.Blocks.Noise\">Blocks.Noise</a>).
</p>
</html>"));
end Random;
