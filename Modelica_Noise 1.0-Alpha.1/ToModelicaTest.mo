within Modelica_Noise;
package ToModelicaTest "Functions to be included in package ModelicaTest"
  package Math
    function randomNumbers
      "Demonstrate the generation of uniform random numbers in the range 0..1"
      import Modelica.Utilities.Streams.print;
      import Modelica_Noise;
      extends Modelica.Icons.Function;
      input Integer localSeed = 614657;
      input Integer globalSeed = 30020;
    protected
      constant Integer nRandom = 5;
      Integer state2[2];
      Integer state4[4];
      Integer state33[33];
      Real r;
    algorithm
      print("\n... Demonstrate how to generate uniform random numbers with xorshift64*:");

      // Generate initial state from localSeed and globalSeed
      state2 :=
        Modelica_Noise.Math.Random.Generators.Xorshift64star.initialState(
        localSeed, globalSeed);

      // Generate random numbers
      for i in 1:nRandom loop
        (r,state2) :=
          Modelica_Noise.Math.Random.Generators.Xorshift64star.random(state2);
        print("   random = " + String(r));
      end for;

      print("\n... Demonstrate how to generate uniform random numbers with xorshift128+:");

      // Generate initial state from localSeed and globalSeed
      state4 :=
        Modelica_Noise.Math.Random.Generators.Xorshift128plus.initialState(
        localSeed, globalSeed);

      // Generate random numbers
      for i in 1:nRandom loop
        (r,state4) :=
          Modelica_Noise.Math.Random.Generators.Xorshift128plus.random(state4);
        print("   random = " + String(r));
      end for;

      print("\n... Demonstrate how to generate uniform random numbers with xorshift1024*:");

      // Generate initial state from localSeed and globalSeed
      state33 :=
        Modelica_Noise.Math.Random.Generators.Xorshift1024star.initialState(
        localSeed, globalSeed);

      // Generate random numbers
      for i in 1:nRandom loop
        (r,state33) :=
          Modelica_Noise.Math.Random.Generators.Xorshift1024star.random(state33);
        print("   random = " + String(r));
      end for;
      annotation (Documentation(info="<html>
<p>
</p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
    end randomNumbers;

    function special "Test Math.Special"
       import Modelica.Utilities.Streams.print;
       import Modelica_Noise.Math.Special;
       input Integer nPoints = 1000;
       input Real erfRange = 3.0;
    protected
       Real u[nPoints] = linspace(-erfRange, erfRange, nPoints);
       Real u1[nPoints];
       Real u2[nPoints];
       Real y1[nPoints];
       Real y2[nPoints];
       Real u3[16] = {-1e-3, -1e-4, -1e-5, -1e-6, -1e-7, -1e-8, -1e-9, -1e-10,
                       1e-3,  1e-4,  1e-5,  1e-6,  1e-7,  1e-8,  1e-9,  1e-10};
       Real y3a[size(u3,1)];
       Real y3b[size(u3,1)];
       Real err;
    algorithm
        print("\n... Check Math.Special");

       // check erf
       y1 := Special.erf(u);
       y2 := Internal.erfSimple(u);
       err  := max(abs(y1 - y2));
       print("erf: err = " + String(err));
       assert( err < 1e-6, "Error function erf computed not precisely enough");

       // check erfInv
       u1 := Special.erfInv(y1);
       u2 := Internal.erfInvSimple(y1);
       err  := max(abs(u1 - u2));
       print("erfInv: err = " + String(err));
       assert( err < 1e-8, "Error function erfInv computed not precisely enough");

       // cross check erf and erfInv
       y1 := Special.erf(u);
       u1 := Special.erfInv(y1);
       err  := max(abs(u - u1));
       print("erf and erfInv: err = " + String(err));
       assert( err < 1e-12, "Functions erf and erfInc computed not precisely enough");

       // check erfc
       y1 := ones(nPoints) - Special.erf(u);
       y2 := Special.erfc(u);
       err  := max(abs(y1 - y2));
       print("erfc: err = " + String(err));
       assert( err < 1e-14, "Error function erf computed not precisely enough");

       // check erfcInv
       y1 := Special.erfc(u);
       u1 := Special.erfcInv(y1);
       err  := max(abs(u - u1));
       print("erfc and erfcInv: err = " + String(err));
       assert( err < 1e-12, "Error function erf computed not precisely enough");

       // check sinc
       y3a := Special.sinc(u3);
       y3b := sin(u3)./u3;
       err  := max(abs(y3a - y3b));
       print("sinc = " + String(err));
       assert( err < 1e-15, "sinc function computed not precisely enough");

      annotation (Documentation(revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
    end special;

    function distributions "Test Math.Distributions"
       import Modelica.Utilities.Streams.print;
       import Modelica_Noise.Math.Distributions;
       input Integer nPoints = 1000;
       input Real erfRange = 3.0;
    protected
       Real eps = 10*Modelica.Constants.eps;
       Real u[nPoints] = linspace(-erfRange, erfRange, nPoints);
       Real u1[nPoints] = linspace(0+eps,1-eps,nPoints);
       Real u2[nPoints];
       Real y1[nPoints];
       Real y2[nPoints];
       Real y3[nPoints];
       Real err;
       Integer n;
    algorithm
       print("\n... Check Math.Distributions");

       // check Uniform
       y1 := Distributions.Uniform.density(u,-1,2);
       y2 := Distributions.Uniform.cumulative(u,-1,2);
       y3 := Internal.derTwoSided(u,y2);
       err  := max(abs(y1 - y3));
       print("Uniform.density: err = " + String(err));
       assert( err < 0.2, "Uniform.density not correctly computed");

       y1 := Distributions.Uniform.quantile(u1,-1,2);
       u2 := Distributions.Uniform.cumulative(y1,-1,2);
       err :=max(abs(u1 - u2));
       print("Uniform.cumulative/.quantile: err = " + String(err));
       assert( err < 1e-14, "Uniform.cumulative or .quantile not correctly computed");

       // check Normal
       y1 := Distributions.Normal.density(u,1,0.5);
       y2 := Distributions.Normal.cumulative(u,1,0.5);
       y3 := Internal.derTwoSided(u,y2);
       err  := max(abs(y1 - y3));
       print("Normal.density: err = " + String(err));
       assert( err < 0.005, "Normal.density not correctly computed");

       y1 := Distributions.Normal.quantile(u1,1,0.5);
       u2 := Distributions.Normal.cumulative(y1,1,0.5);
       err :=max(abs(u1 - u2));
       print("Normal.cumulative/.quantile: err = " + String(err));
       assert( err < 1e-14, "Normal.cumulative or .quantile not correctly computed");

       // check Weibull
       y1 := Distributions.Weibull.density(u,0.5,2);
       y2 := Distributions.Weibull.cumulative(u,0.5,2);
       y3 := Internal.derTwoSided(u,y2);
       err  := max(abs(y1 - y3));
       print("Weibull.density: err = " + String(err));
       assert( err < 0.03, "Weibull.density not correctly computed");

       y1 := Distributions.Weibull.quantile(u1,0.5,2);
       u2 := Distributions.Weibull.cumulative(y1,0.5,2);
       err :=max(abs(u1 - u2));
       print("Weibull.cumulative/.quantile: err = " + String(err));
       assert( err < 1e-14, "Weibull.cumulative or .quantile not correctly computed");

      annotation (Documentation(revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
    end distributions;

    function truncatedDistributions "Test Math.TruncatedDistributions"
       import Modelica.Utilities.Streams.print;
       import Modelica_Noise.Math.TruncatedDistributions;
       input Integer nPoints = 1000;
       input Real erfRange = 3.0;
    protected
       Real eps = 10*Modelica.Constants.eps;
       Real u[nPoints] = linspace(-erfRange, erfRange, nPoints);
       Real u1[nPoints] = linspace(0+eps,1-eps,nPoints);
       Real u2[nPoints];
       Real y1[nPoints];
       Real y2[nPoints];
       Real y3[nPoints];
       Real err;
    algorithm
       print("\n... Check Math.TruncatedDistributions");

       // check Uniform
       y1 := TruncatedDistributions.Uniform.density(u,-1,2);
       y2 := TruncatedDistributions.Uniform.cumulative(u,-1,2);
       y3 := Internal.derTwoSided(u,y2);
       err  := max(abs(y1 - y3));
       print("Uniform.density: err = " + String(err));
       assert( err < 0.2, "Uniform.density not correctly computed");

       y1 := TruncatedDistributions.Uniform.quantile(u1,-1,2);
       u2 := TruncatedDistributions.Uniform.cumulative(y1,-1,2);
       err :=max(abs(u1 - u2));
       print("Uniform.cumulative/.quantile: err = " + String(err));
       assert( err < 1e-14, "Uniform.cumulative or .quantile not correctly computed");

       // check Normal
       y1 := TruncatedDistributions.Normal.density(u,u_min=-1.5,u_max=1.5);
       y2 := TruncatedDistributions.Normal.cumulative(u,u_min=-1.5,u_max=1.5);
       y3 := Internal.derTwoSided(u,y2);
       err  := max(abs(y1 - y3));
       print("Normal.density: err = " + String(err));
       assert( err < 0.2, "Normal.density not correctly computed");

       y1 := TruncatedDistributions.Normal.quantile(u1,y_min=-1.5,y_max=1.5);
       u2 := TruncatedDistributions.Normal.cumulative(y1,u_min=-1.5,u_max=1.5);
       err :=max(abs(u1 - u2));
       print("Normal.cumulative/.quantile: err = " + String(err));
       assert( err < 1e-14, "Normal.cumulative or .quantile not correctly computed");

       // check Weibull
       y1 := TruncatedDistributions.Weibull.density(u,u_max=0.8, lambda=0.5, k=2);
       y2 := TruncatedDistributions.Weibull.cumulative(u,u_max=0.8, lambda=0.5, k=2);
       y3 := Internal.derTwoSided(u,y2);
       err  := max(abs(y1 - y3));
       print("Weibull.density: err = " + String(err));
       assert( err < 0.2, "Weibull.density not correctly computed");

       y1 := TruncatedDistributions.Weibull.quantile(u1,y_max=0.8, lambda=0.5, k=2);
       u2 := TruncatedDistributions.Weibull.cumulative(y1,u_max=0.8, lambda=0.5, k=2);
       err :=max(abs(u1 - u2));
       print("Weibull.cumulative/.quantile: err = " + String(err));
       assert( err < 1e-14, "Weibull.cumulative or .quantile not correctly computed");
      annotation (Documentation(revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
    end truncatedDistributions;

    package Internal
      "Internal utility functions that should not be directly utilized by the user"
      function erfSimple
        "Error function (simple implementation, precision around 1e-7)"
        input Real u;
        output Real y "y = 2/sqrt(pi)*Integral_0_u exp(-t^2)*dt";
      protected
        constant Real a1 =  0.254829592;
        constant Real a2 = -0.284496736;
        constant Real a3 =  1.421413741;
        constant Real a4 = -1.453152027;
        constant Real a5 =  1.061405429;
        constant Real p =   0.3275911;
        Real t;
        Real w;
        Real uAbs;
      algorithm
        uAbs := abs(u);
        t := 1.0/(1.0 + p*uAbs);
        w := 1.0 - (((((a5*t + a4)*t) + a3)*t + a2)*t + a1)*t*exp(-uAbs*uAbs);
        y := if u >= 0.0 then w else -w;
        annotation (Documentation(info="<html>
<p>
Computes the error function erf(u)
with a maximum error of 1.5e−7.
Implementation is according to Abramowitz and Stegun 
(see <a href=\"http://people.math.sfu.ca/~cbm/aands/page_299.jpg\">Handbook of Mathematical Functions, page 299, equation 7.1.26</a>).
</p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
      end erfSimple;

      function cdfInvNormal
        "Quantile (inverse cummulative distribution function) of the normal distribution with a precision of about 1e-9"
        extends Modelica.Icons.Function;
        input Real u(min=0, max=1) "Number in the range 0 <= u <= 1";
        output Real y
          "Quantile of 1/sqrt(2*pi) * exp(-x^2/2): y = sqrt(2)*erfinv(2*u-1)";
      protected
        constant Real a[6] = {-3.969683028665376e+01, 2.209460984245205e+02, -2.759285104469687e+02,
                               1.383577518672690e+02, -3.066479806614716e+01, 2.506628277459239e+00};
        constant Real b[5] = {-5.447609879822406e+01, 1.615858368580409e+02, -1.556989798598866e+02,
                               6.680131188771972e+01, -1.328068155288572e+01};
        constant Real c[6] = {-7.784894002430293e-03, -3.223964580411365e-01, -2.400758277161838e+00,
                              -2.549732539343734e+00, 4.374664141464968e+00, 2.938163982698783e+00};
        constant Real d[4] = {7.784695709041462e-03, 3.224671290700398e-01, 2.445134137142996e+00,
                              3.754408661907416e+00};
        constant Real u_low =  0.02425;
        constant Real u_high = 1 - u_low;
        Real q;
        Real qq;
      algorithm
         if u >= u_low and u <= u_high then
            // Rational approximation for central region.
            q := u - 0.5;
            qq := q*q;
            y := (((((a[1]*qq+a[2])*qq+a[3])*qq+a[4])*qq+a[5])*qq+a[6])*q /
                 (((((b[1]*qq+b[2])*qq+b[3])*qq+b[4])*qq+b[5])*qq+1);

         elseif u <= 0.0 + 10*Modelica.Constants.eps then
            y := -Modelica.Constants.inf;

         elseif u < u_low then
            // Rational approximation for lower region.
            q := sqrt(-2*log(u));
            y := (((((c[1]*q+c[2])*q+c[3])*q+c[4])*q+c[5])*q+c[6]) /
                 ((((d[1]*q+d[2])*q+d[3])*q+d[4])*q+1);

         elseif u >= 1.0 - 10*Modelica.Constants.eps then
            y := Modelica.Constants.inf;

         else
            // Rational approximation for upper region.
            q := sqrt(-2*log(1-u));
            y := -(((((c[1]*q+c[2])*q+c[3])*q+c[4])*q+c[5])*q+c[6]) /
                  ((((d[1]*q+d[2])*q+d[3])*q+d[4])*q+1);
         end if;

        annotation (Documentation(info="<html>
<p>
Implementation according to:
<a href=\"http://home.online.no/~pjacklam/notes/invnorm/\">Peter John Acklam</a>.
The relative error is less than 1e-9.
</p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
      end cdfInvNormal;

      function erfInvSimple
        "Inverse error function with a precision of about 1e-7"
        input Real u;
        output Real y;
      algorithm
        y := cdfInvNormal((1 + u)/2)/sqrt(2);
        annotation (Inline=true, Documentation(info="<html>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
      end erfInvSimple;

      function quantileNormalSimple
        "Quantile of normal distribution (= inverse cumulative distribution function) with a precision of about 1e-7"
        extends Modelica_Noise.Math.Distributions.Interfaces.partialQuantile;
        input Real mu=0 "Expectation (mean) value of the normal distribution" annotation(Dialog);
        input Real sigma=1 "Standard deviation of the normal distribution" annotation(Dialog);
      algorithm
        y := mu + sigma*
          Modelica_Noise.ToModelicaTest.Math.Internal.cdfInvNormal(u);

        annotation (Inline=true, Documentation(info=
                                   "<html>
<p>
This function returns a random number according to a normal distribution.
This means that 99.7 % of the returned random numbers are in the range:
</p>

<blockquote>
<p>
mu-3*sigma &le; y &le; mu+3*sigma
</p>
</blockquote>

<p>
For more details of this distribution see
<a href=\"http://en.wikipedia.org/wiki/Normal_distribution\">Wikipedia</a>.
</p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
      end quantileNormalSimple;

      function derOneSided
        "Return approximation of derivative by a one-sided difference quotient (if size(u,1)=1, zero is returned)"
        input Real u[:];
        input Real y[size(u,1)];
        output Real der_y[size(u,1)] "dy/du";
      protected
        Integer nu = size(u,1);
      algorithm
        if nu < 1 then
           return;
        elseif nu==1 then
           der_y[1] :=0.0;
        else
           der_y[1] :=(y[2] - y[1])/(u[2] - u[1]);
           der_y[nu] := (y[nu] - y[nu-1])/(u[nu] - u[nu-1]);
           for i in 2:nu-1 loop
              der_y[i] :=(y[i + 1] - y[i - 1])/(u[i + 1] - u[i - 1]);
           end for;
        end if;
        annotation (Documentation(revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
      end derOneSided;

      function derTwoSided
        "Return approximation of derivative by a two-sided difference quotient (if size(u,1)=1, zero is returned)"
        input Real u[:];
        input Real y[size(u,1)];
        output Real der_y[size(u,1)] "dy/du";
      protected
        Integer nu = size(u,1);
      algorithm
        if nu < 1 then
           return;
        elseif nu==1 then
           der_y[1] :=0.0;
        else
           for i in 1:nu-1 loop
              der_y[i] :=(y[i + 1] - y[i])/(u[i + 1] - u[i]);
           end for;
           der_y[nu] :=der_y[nu - 1];
        end if;
        annotation (Documentation(revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
      end derTwoSided;
      annotation (Documentation(revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klöckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
    end Internal;
  end Math;

end ToModelicaTest;
