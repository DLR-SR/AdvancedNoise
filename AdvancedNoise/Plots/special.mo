within AdvancedNoise.Plots;
function special "Plot functions Modelica.Math.Special"
   import Modelica.Utilities.Streams.print;
   import Modelica.Math.Special;
   input Integer nPoints = 1000;
   input Real erfRange = 3.0;
   input Real sincRange = 20.0;
   input Real normalEps = 1e-5;
protected
   Real uErf[nPoints] = linspace(-erfRange, erfRange, nPoints);
   Real yErf[nPoints];
   Real yErfc[nPoints];
   Real uErfInv[nPoints];
   Real uErfcInv[nPoints];
   Real r[nPoints] = linspace(normalEps, 1-normalEps, nPoints);
   Real rn[nPoints];
algorithm
   yErf := Special.erf(uErf);
   plotArray(uErf, yErf,  legend="y = erf(u)", id=1);

   yErfc := Special.erfc(uErf);
   plotArray(uErf, yErfc,  legend="y = erfc(u)", id=2);

   uErfInv := Special.erfInv(yErf);
   plotArray(yErf, uErfInv, legend="y = erfInv(u)", id=3);

   uErfcInv := Special.erfcInv(yErfc);
   plotArray(yErf, uErfInv, legend="y = erfcInv(u)", id=4);

   r :=linspace(-sincRange,sincRange,nPoints);
   rn :=Special.sinc(r);
   plotArray(r,rn,legend="y=sinc(u)",id=5);

   annotation(__Dymola_interactive = true, Documentation(info="<html>
<p>
Plot results of calling functions from
<a href=\"modelica://Modelica.Math.Special\">Modelica.Math.Special</a>.
</p>
</html>"));
end special;
