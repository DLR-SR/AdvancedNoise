within Modelica_Noise.Test;
function special "Test functions Math.Special"
   import Modelica.Utilities.Streams.print;
   import Modelica_Noise.Math.Special;
   input Integer nPoints = 1000;
   input Real erfRange = 3.0;
   input Real sincRange = 20.0;
   input Real normalEps = 1e-5;
protected
   Real uErf[nPoints] = linspace(-erfRange, erfRange, nPoints);
   Real yErf[nPoints];
   Real uErfInv[nPoints];
   Real err;
   Real r[nPoints] = linspace(normalEps, 1-normalEps, nPoints);
   Real rn[nPoints];
algorithm
   yErf := Special.erf(uErf);
   plotArray(uErf, yErf, id=1);

   uErfInv := Special.erfInv(yErf);
   err :=max(abs(uErf - uErfInv));
   print("err = " + String(err));
   plotArray(yErf, uErfInv, id=2);

   // Plot normal quantile
   rn :=Special.cdfInvNormal(r);
   plotArray(r,rn, id=3);

   // Plot sinc
   r :=linspace(-sincRange,sincRange,nPoints);
   rn :=Special.sinc(r);
   plotArray(r,rn,id=4);

   annotation(__Dymola_interactive = true);
end special;
