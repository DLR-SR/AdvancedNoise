within Modelica_Noise.Math.Special;
function erf "Error function"
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
</html>"));
end erf;
