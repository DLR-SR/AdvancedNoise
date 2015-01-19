within Modelica_Noise.Math.Special;
function cdfInvNormal
  "Quantile (inverse cummulative distribution function) of the normal distribution"
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
</html>"));
end cdfInvNormal;
