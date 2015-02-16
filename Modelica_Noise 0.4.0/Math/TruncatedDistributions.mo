within Modelica_Noise.Math;
package TruncatedDistributions "Library of truncated distribution functions"
   extends Modelica.Icons.Package;

  package Uniform
    "Library of truncated uniform distribution functions (= identical to uniform distribution functions)"
    extends Modelica.Icons.Package;

    function density
      "Density of truncated uniform distribution (= identical to uniform distribution)"
      extends
        Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialDensity;
    algorithm
      y := Modelica_Noise.Math.Distributions.Uniform.density(u,u_min,u_max);

      annotation(Inline=true, Documentation(info="<html>
<p>
The truncated uniform distribution is identical to the uniform distribution.
For details about function density(..), see therefore
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.density\">Math.Distributions.Uniform.density</a>.
</p>
</html>"));
    end density;

    function cumulative
      "Cumulative distribution function of truncated uniform distribution (= identical to uniform distribution)"
      extends
        Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialCumulative;
    algorithm
      y := Modelica_Noise.Math.Distributions.Uniform.cumulative(u,u_min,u_max);

      annotation(Inline=true, Documentation(info="<html>
<p>
The truncated uniform distribution is identical to the uniform distribution.
For details about function cumulative(..), see therefore
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.cumulative\">Math.Distributions.Uniform.cumulative</a>.
</p>
</html>"));
    end cumulative;

    function quantile "Quantile of uniform distribution"
      extends
        Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialQuantile;
    algorithm
      y := Modelica_Noise.Math.Distributions.Uniform.quantile(u,y_min,y_max);

      annotation(Inline=true, Documentation(info="<html>
<p>
The truncated uniform distribution is identical to the uniform distribution.
For details about function quantile(..), see therefore
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform.quantile\">Math.Distributions.Uniform.quantile</a>.
</p>
</html>"));
    end quantile;
    annotation (Icon(graphics={             Line(
        points={{-80,-60},{-40,-60},{-40,60},{40,60},{40,-60},{80,-60}},
        color={0,0,0},
        smooth=Smooth.None)}), Documentation(info="<html>
<p>
The truncated uniform distribution is identical to the uniform distribution.
For details about the functions, see therefore package
<a href=\"modelica://Modelica_Noise.Math.Distributions.Uniform\">Math.Distributions.Uniform</a>.
</p>
</html>"));
  end Uniform;

  package Normal "Library of truncated normal distribution functions"
    extends Modelica.Icons.Package;
    function density "Density of truncated normal distribution"
      import Modelica_Noise.Math.Distributions.Normal;
      extends
        Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialDensity;
      input Real mu= (u_max + u_min)/2
        "Expectation (mean) value of the normal distribution" annotation(Dialog);
      input Real sigma=(u_max - u_min)/6
        "Standard deviation of the normal distribution"                                  annotation(Dialog);
    protected
      Real pdf;
      Real cdf_min;
      Real cdf_max;
    algorithm
      if u >= u_min and u <= u_max then
         pdf :=Normal.density(u,mu,sigma);
         cdf_min :=Normal.cumulative(u_min,mu,sigma);
         cdf_max :=Normal.cumulative(u_max,mu,sigma);
         y := pdf / max(cdf_max - cdf_min, 10*Modelica.Constants.eps);
      else
         y := 0;
      end if;
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Normal.<b>density</b>(u, u_min=0, u_max=1, mu=0, sigma=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the probability density function according to a
<b>truncated normal</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
mean value of original distribution <b>mu</b> and 
standard deviation of original distribution <b>sigma</b> (variance = sigma<sup>2</sup>).
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.density.png\">
</blockquote></p>

<p>
For more details<br>
of the normal distribution, see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  density(0.5)                // = 1.041828977196953
  density(0.5,-1.5,1.5,1,0.9) // = 0.5365495585520803
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Normal.cumulative\">Normal.cumulative</a>,
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Normal.quantile\">Normal.quantile</a>.
</p>
</html>"));
    end density;

    function cumulative
      "Cumulative distribution function of truncated normal distribution"
      import Modelica_Noise.Math.Distributions.Normal;
      extends
        Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialCumulative;
      input Real mu= (u_max + u_min)/2
        "Expectation (mean) value of the normal distribution" annotation(Dialog);
      input Real sigma=(u_max - u_min)/6
        "Standard deviation of the normal distribution"                                  annotation(Dialog);
    protected
      Real cdf;
      Real cdf_min;
      Real cdf_max;
    algorithm
      if u <= u_min then
         y := 0;
      elseif u < u_max then
         cdf     :=Normal.cumulative(u, mu, sigma);
         cdf_min :=Normal.cumulative(u_min, mu, sigma);
         cdf_max :=Normal.cumulative(u_max, mu, sigma);
         y := (cdf - cdf_min) / max(cdf_max - cdf_min, 10*Modelica.Constants.eps);
      else
         y := 1;
      end if;

      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Normal.<b>cumulative</b>(u, u_min=0, u_max=1, mu=0, sigma=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the cumulative distribution function according to a
<b>truncated normal</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
mean value of original distribution <b>mu</b> and 
standard deviation of original distribution <b>sigma</b> (variance = sigma<sup>2</sup>).
The returned value y is in the range:
</p>

<p><blockquote>
0 &le; y &le; 1
</blockquote></p>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.cumulative.png\">
</blockquote></p>

<p>
For more details<br>
of the normal distribution, see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  cumulative(0.5)                 // = 0.5
  cumulative(0.5,-1.5,1.5,1,0.9)  // = 0.4046868865634537
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Normal.density\">Normal.density</a>,
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Normal.quantile\">Normal.quantile</a>.
</p>
</html>"));
    end cumulative;

    function quantile "Quantile of truncated normal distribution"
      import Modelica_Noise.Math.Distributions.Normal;
      extends
        Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialQuantile;
      input Real mu= (y_max + y_min)/2
        "Expectation (mean) value of the normal distribution" annotation(Dialog);
      input Real sigma=(y_max - y_min)/6
        "Standard deviation of the normal distribution"                                  annotation(Dialog);
    protected
      Real cdf_min = Normal.cumulative(y_min, mu, sigma);
      Real cdf_max = Normal.cumulative(y_max, mu, sigma);
    algorithm
      y := Normal.quantile(cdf_min + u*(cdf_max-cdf_min), mu=mu, sigma=sigma);

      /* Close to u=0 and u=1, large errors in the numerical computation can
   occur. The following statement is a guard to still keep the property
     that y is within y_min/y_max
  */
      y := min(y_max,max(y_min,y));

      annotation (Documentation(info="<html>
<p>
<h4>Syntax</h4>
<blockquote><pre>
Normal.<b>quantile</b>(u, y_min=0, y_max=1, mu=0, sigma=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the inverse cumulative distribution function (= quantile) according to a
<b>truncated normal</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
mean value of original distribution <b>mu</b> and 
standard deviation of original distribution <b>sigma</b> (variance = sigma<sup>2</sup>).
Input argument u must be in the range:
</p>

<blockquote>
<p>
0 &lt; u &lt; 1
</p>
</blockquote>

<p>
Output argument y is in the range:
</p>


<blockquote>
<p>
y_min &le; y &le; y_max
</p>
</blockquote>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.quantile.png\">
</blockquote></p>

<p>
For more details<br>
of the normal distribution, see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre> 
  quantile(0.001)           // = 0.001087357613043849;
  quantile(0.5,0,1,0.5,0.9) // = 0.5
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Normal.density\">Normal.density</a>,
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Normal.cumulative\">Normal.cumulative</a>.
</p>
</html>"));
    end quantile;
    annotation (Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}),
                     graphics={
          Line(
            points={{-32,-32},{-32,-80}},
            color={0,0,0},
            smooth=Smooth.None),
                             Line(
            points={{-32,-32},{-28,-21.0617},{-24.5,-7.4388},{-21,8.1682},{
                -17.5,24.9428},{-14,41.695},{-10.5,56.9771},{-7,69.2797},{-3.5,
                77.2739},{0,80.047},{3.5,77.2739},{7,69.2797},{10.5,56.9771},{
                14,41.695},{17.5,24.9428},{21,8.1682},{24.5,-7.4388},{28,
                -21.0617},{31.5,-32.2849},{35,-41.0467}},
            color={0,0,0},
            smooth=Smooth.Bezier),
          Line(
            points={{34.5,-40.5},{34.5,-78.5}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            points={{34.5,-78.5},{70.5,-78.5}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            points={{-68,-79},{-32,-79}},
            color={0,0,0},
            smooth=Smooth.None)}),
      Documentation(info="<html>
<p>
This package provides
</p>
<ul>
<li> probability density function (= derivative of cumulative distribution function),</li>
<li> cumulative distribution function, and</li>
<li> quantile (= inverse cumulative distribution function).</li>
</ul>
<p>
of the <b>truncated normal</b> distribution. Examples:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.density.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.cumulative.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.quantile.png\">
</blockquote></p>

<p>
For more details<br>
of the normal distribution, see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>
</html>"),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1})));
  end Normal;

  package Weibull "Library of truncated Weibull distribution functions"
    extends Modelica.Icons.Package;

    function density "Density of truncated Weibull distribution"
      import Modelica_Noise.Math.Distributions.Weibull;
      extends
        Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialDensity;
      input Real lambda(min=0) = 1
        "Scale parameter of the Weibull distribution"                            annotation(Dialog);
      input Real k(min=0) = 1 "Shape parameter of the Weibull distribution" annotation(Dialog);
    protected
      Real pdf;
      Real cdf_min;
      Real cdf_max;
    algorithm
      if u >= u_min and u <= u_max then
         pdf :=Weibull.density(u, lambda=lambda, k=k);
         cdf_min :=Weibull.cumulative(u_min, lambda=lambda, k=k);
         cdf_max :=Weibull.cumulative(u_max, lambda=lambda, k=k);
         y := pdf / max(cdf_max - cdf_min, 10*Modelica.Constants.eps);
      else
         y := 0;
      end if;
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Weibull.<b>density</b>(u, u_min=0, u_max=1, lambda=1, k=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the probability density function according to a
<b>truncated Weibull</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
scale parameter of original distribution <b>lambda</b> and
shape parameter of original distribution <b>k</b>.
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Weibull.density.png\">
</blockquote></p>

<p>
For more details<br>
of the Weibull distribution, see
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  density(0.5)             // = 0.9595173756674719
  density(0.5,0,0.8,0.5,2) // = 1.5948036466479143
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Weibull.cumulative\">Weibull.cumulative</a>,
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Weibull.quantile\">Weibull.quantile</a>.
</p>
</html>"));
    end density;

    function cumulative
      "Cumulative distribution function of truncated Weibull distribution"
      import Modelica_Noise.Math.Distributions.Weibull;
      extends
        Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialCumulative;
      input Real lambda(min=0) = 1
        "Scale parameter of the Weibull distribution"                            annotation(Dialog);
      input Real k(min=0) = 1 "Shape parameter of the Weibull distribution" annotation(Dialog);
    protected
      Real cdf;
      Real cdf_min;
      Real cdf_max;
    algorithm
      if u <= u_min then
         y := 0;
      elseif u < u_max then
         cdf     :=Weibull.cumulative(u, lambda=lambda, k=k);
         cdf_min :=Weibull.cumulative(u_min, lambda=lambda, k=k);
         cdf_max :=Weibull.cumulative(u_max, lambda=lambda, k=k);
         y := (cdf - cdf_min) / max(cdf_max - cdf_min, 10*Modelica.Constants.eps);
      else
         y := 1;
      end if;

      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Weibull.<b>cumulative</b>(u, u_min=0, u_max=1, lambda=1, k=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the cumulative distribution function according to a
<b>truncated Weibull</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
scale parameter of original distribution <b>lambda</b> and
shape parameter of original distribution <b>k</b>.
The returned value y is in the range:
</p>

<p><blockquote>
0 &le; y &le; 1
</blockquote></p>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Weibull.cumulative.png\">
</blockquote></p>

<p>
For more details<br>
of the Weibull distribution, see
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre>
  cumulative(0.5)             // = 0.6224593312018546
  cumulative(0.5,0,0.8,0.5,2) // = 0.6850805314988328
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Weibull.density\">Weibull.density</a>,
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Weibull.quantile\">Weibull.quantile</a>.
</p>
</html>"));
    end cumulative;

    function quantile "Quantile of truncated Weibull distribution"
      import Modelica_Noise.Math.Distributions.Weibull;
      extends
        Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialQuantile;
      input Real lambda(min=0) = 1
        "Scale parameter of the Weibull distribution"                            annotation(Dialog);
      input Real k(min=0) = 1 "Shape parameter of the Weibull distribution" annotation(Dialog);
    protected
      Real cdf_min = Weibull.cumulative(y_min, lambda=lambda, k=k)
        "Value of cdf at y_min";
      Real cdf_max = Weibull.cumulative(y_max, lambda=lambda, k=k)
        "Value of cdf at y_max";
    algorithm
      y := Weibull.quantile(cdf_min + u*(cdf_max-cdf_min), lambda=lambda,k=k);

      /* Close to u=1, large errors in the numerical computation can
   occur. The following statement is a guard to still keep the property
   that y is within y_min .. y_max
  */
      y := min(y_max,max(y_min,y));

      annotation (Documentation(info="<html>
<p>
<h4>Syntax</h4>
<blockquote><pre>
Weibull.<b>quantile</b>(u, y_min=0, y_max=1, lambda=1, k=1);
</pre></blockquote>

<h4>Description</h4>
<p>
This function computes the inverse cumulative distribution function (= quantile) according to a
<b>truncated Weibull</b> distribution with
minimum value <b>u_min</b>, maximmum value <b>u_max</b>,
scale parameter of original distribution <b>lambda</b> and
shape parameter of original distribution <b>k</b>.
Input argument u must be in the range:
</p>

<blockquote>
<p>
0 &le; u &le; 1
</p>
</blockquote>

<p>
Output argument y is in the range:
</p>

<blockquote>
<p>
y_min &le; y &le; y_max
</p>
</blockquote>

<p>
Plot of the function:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Weibull.quantile.png\">
</blockquote></p>

<p>
For more details<br>
of the Weibull distribution, see
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre> 
  quantile(0.001)           // = 0.0006323204312624211;
  quantile(0.5,0,1,0.5,0.9) // = 0.256951787882498
</pre></blockquote>

<h4>See also</h4>
<p>
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Weibull.density\">Weibull.density</a>,
<a href=\"modelica://Modelica_Noise.Math.TruncatedDistributions.Weibull.cumulative\">Weibull.cumulative</a>.
</p>
</html>"));
    end quantile;
    annotation (Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}),
                     graphics={Line(
            points={{-72,-62},{-68.5,-62},{-65,-62},{-61.5,-62},{-58,-62},{
                -54.5,-62},{-51,-62},{-47.5,-62},{-44,-62},{-40.5,-62},{-37,-62},
                {-33.5,-62},{-30,-62},{-26.5,-62},{-23,-62},{-19.5,-62},{-16,
                -62},{-12.5,-62},{-9,-62},{-5.5,-62},{-2,-62},{1.5,41.1424},{5,
                69.1658},{8.5,78},{12,75.3585},{15.5,65.6645},{19,52.0082},{
                22.5,36.6157},{26,21.0458},{29.5,6.3239},{33,-6.9424},{36.5,
                -18.4596},{40,-28.1579},{43.5,-36.1153}},
            color={0,0,0},
            smooth=Smooth.Bezier),
          Line(
            points={{43.5,-36},{43.5,-63}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            points={{43.5,-63},{79.5,-63}},
            color={0,0,0},
            smooth=Smooth.None)}),
      Documentation(info="<html>
<p>
This package provides
</p>
<ul>
<li> probability density function (= derivative of cumulative distribution function),</li>
<li> cumulative distribution function, and</li>
<li> quantile (= inverse cumulative distribution function).</li>
</ul>
<p>
of the <b>truncated Weibull</b> distribution. Examples:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Weibull.density.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Weibull.cumulative.png\">
</blockquote></p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Weibull.quantile.png\">
</blockquote></p>

<p>
For more details<br>
of the Weibull distribution, see
<a href=\"http://en.wikipedia.org/wiki/Weibull_distribution\">Wikipedia</a>,<br>
of truncated distributions, see
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>
</html>"),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1})));
  end Weibull;

  package Interfaces
    "Library of interfaces for truncated distribution functions"
    extends Modelica.Icons.InterfacesPackage;

    partial function partialDensity
      "Common interface of truncated probability density functions"
      extends Modelica.Icons.Function;
      input Real u "Random number over the real axis (-inf < u < inf)";
      input Real u_min=0 "Lower limit of u" annotation(Dialog);
      input Real u_max=1 "Upper limit of u" annotation(Dialog);
      output Real y "Density of u (y=0 if u < u_min or u > u_max)";
      annotation (Documentation(info="<html>
<p>
A partial function containing the common
arguments of the probability density functions.
</p>
</html>"));
    end partialDensity;

    partial function partialCumulative
      "Common interface of truncated cumulative distribution functions"
      extends Modelica.Icons.Function;
      input Real u "Value over the real axis (-inf < u < inf)";
      input Real u_min=0 "Lower limit of u" annotation(Dialog);
      input Real u_max=1 "Upper limit of u" annotation(Dialog);
      output Real y "Value in the range 0 <= y <= 1";
      annotation (Documentation(info="<html>
<p>
A partial function containing the common
arguments of the cumulative distribution functions.
</p>
</html>"));
    end partialCumulative;

    partial function partialQuantile
      "Common interface of truncated quantile functions (= inverse cumulative distribution functions)"
      extends Modelica.Icons.Function;
      input Real u(min=0, max=1) "Random number in the range 0 <= u <= 1";
      input Real y_min=0 "Lower limit of y" annotation(Dialog);
      input Real y_max=1 "Upper limit of y" annotation(Dialog);
      output Real y
        "Random number u transformed according to the given distribution";
      annotation (Documentation(info="<html>
<p>
A partial function containing the common
arguments of the quantile functions.
</p>
</html>"));
    end partialQuantile;
    annotation (Documentation(info="<html>
<p>
This package contains partial functions that describe the
common interface arguments of the truncated distribution functions.
</p>
</html>"));
  end Interfaces;

  package Discrete "Library of truncated discrete distribution functions"
    extends Modelica.Icons.Package;

    function quantile "Quantile of discrete distribution"
      extends
        Modelica_Noise.Math.TruncatedDistributions.Interfaces.partialQuantile;
      input Real x[:] = {0,1} "Discrete values to be chosen from" annotation(Dialog);
      input Real p[size(x,1)] = ones(size(x,1))/size(x,1)
        "The probabilities of the discrete values" annotation(Dialog);
    algorithm
      y := Modelica_Noise.Math.Distributions.Discrete.quantile(u,x,p);

      annotation(Inline=true, Documentation(info="<html>
</html>"));
    end quantile;
    annotation (Icon(graphics={             Line(
        points={{-80,-60},{-40,-60},{-40,60},{40,60},{40,-60},{80,-60}},
        color={0,0,0},
        smooth=Smooth.None)}), Documentation(info="<html>
</html>"));
  end Discrete;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
                           Line(
          points={{-32,-38},{-28,-27.0617},{-24.5,-13.4388},{-21,2.1682},{-17.5,
              18.9428},{-14,35.695},{-10.5,50.9771},{-7,63.2797},{-3.5,71.2739},
              {0,74.047},{3.5,71.2739},{7,63.2797},{10.5,50.9771},{14,35.695},{
              17.5,18.9428},{21,2.1682},{24.5,-13.4388},{28,-27.0617},{31.5,
              -38.2849},{35,-47.0467}},
          color={0,0,0},
          smooth=Smooth.Bezier),
        Line(
          points={{-32,-38},{-32,-86}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{35,-46.5},{35,-84.5}},
          color={0,0,0},
          smooth=Smooth.None)}),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1})),
    Documentation(info="<html>
<p>
Truncated distributions are distributions that are transformed in such a way that
either the input is within a band u_min .. u_max, or the output is within
a band y_min .. y_max. 
A truncated distribution is derived from a base
distribution (e.g. from the normal distribution), by truncating its
propability density function to the desired band and adding a constant
value over this band, in order that the integral over the truncated distribution
remains one. All other properties (such as cumulative distribution function) can then be determined
in a straightforward way, provided the properties of the underlying base distribution
are available.
More details can be found, for example, in 
<a href=\"http://en.wikipedia.org/wiki/Truncated_distribution\">Wikipedia</a>.
</p>

<p>
When using random numbers according to a given truncated distribution,
the output of the inverse cumulative distribution function (= quantile) is restricted
to the defined band. This is important for simulations, where a simulation engine
might have difficulties to cope with very large values (say 1e60) that might
be returned by a quantile of a non-truncated distribution
(such as from a normal distribution), although the
probability is very low that this situation occurs.

</p>

<p>
The truncated distribution functions are derived from the underlying distribution
functions in the following way:
</p>

<blockquote>
<pre>
// Original distributions
    pdf = Distributions.XXX.density(u,..);
    cdf = Distributions.XXX.cumulative(u,...);
cdf_min = Distributions.XXX.cumulative(u_min,...);
cdf_max = Distributions.XXX.cumulative(u_max,...);

// Truncated distributions
</pre>

</pre>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function</i></b></th><th><b><i>Transformation</i></b></th></tr>
  <tr><td>density(u,u_min,u_max,...)</td>
      <td>= <b>if</b> u &ge; u_min <b>and</b> u&le;u_max <b>then</b> pdf / (cdf_max - cdf_min) <b>else</b> 0</td> 
  </tr>
  <tr><td>cumulative(u,u_min,u_max,...)</td>
      <td>= <b>if</b> u &le; u_min <b>then</b> 0
            <b>else if</b> u &lt; u_max <b>then</b> 
              (cdf - cdf_min))/(cdf_max - cdf_min)
            <b>else</b> 1</td> 
  </tr>
  <tr><td>quantile(u,u_min,u_max,...)</td>
      <td>= Distributions.XXX.quantile( cdf_min + u*(cdf_max - cdf_min), ... )</td> 
  </tr>
</table>
</blockquote>

<p>
For an example of a truncated distribution, see the following
plot of the probabibilty density function of a normal distribution
compared with its truncated distribution:
</p>

<p><blockquote>
<img src=\"modelica://Modelica_Noise/Resources/Images/Math/TruncatedDistributions/Normal.density.png\">
</blockquote></p>
</html>"));
end TruncatedDistributions;
