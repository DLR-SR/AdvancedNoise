within Modelica_Noise;
package ToNoisePlotSpecial
  extends Modelica.Icons.Package;

  function special "Plot functions Math.Special"
     import Modelica.Utilities.Streams.print;
     import Modelica_Noise.Math.Special;
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

     annotation(__Dymola_interactive = true);
  end special;

  package Distributions
    extends Modelica.Icons.Package;

    function uniform "Plot functions Math.Distributions.Uniform"
       import Modelica_Noise.Math.Distributions.Uniform;
       input Integer nPoints(min=2) = 1000 "Number of evaluation points";
    protected
       Real u[nPoints] = linspace(-5, 5, nPoints);
       Real u2[nPoints] = linspace(0, 1, nPoints);
       Real y1[nPoints];
       Real y2[nPoints];
       Real y3[nPoints];
    algorithm
       y1 := Uniform.density(u, u_min=-3, u_max=3);
       y2 := Uniform.density(u, u_min=-1, u_max=3);
       y3 := Uniform.density(u, u_min=1, u_max=3);
       plotArrays(u, [y1,y2,y3], title="Densities of uniform distribution",
                  legend={"density(u,-3,3)", "density(u,-1,3)", "density(u,1,3)"},id=1);

       y1 := Uniform.cumulative(u, u_min=-3, u_max=3);
       y2 := Uniform.cumulative(u, u_min=-1, u_max=3);
       y3 := Uniform.cumulative(u, u_min=1, u_max=3);
       plotArrays(u, [y1,y2,y3], title="Cumulative distribution functions of uniform distribution",
                  legend={"cumulative(u,-3,3)", "cumulative(u,-1,3)", "cumulative(u,1,3)"},id=2);

       y1 := Uniform.quantile(u2, y_min=-3, y_max=3);
       y2 := Uniform.quantile(u2, y_min=-1, y_max=3);
       y3 := Uniform.quantile(u2, y_min=1, y_max=3);
       plotArrays(u2, [y1,y2,y3], title="Inverse cumulative distribution function of uniform distribution",
                  legend={"quantile(u,-3,3)", "quantile(u,-1,3)", "quantile(u,1,3)"}, id=3);

       annotation(__Dymola_interactive = true);
    end uniform;

    function normal "Plot functions Math.Distributions.Normal"
       import Modelica_Noise.Math.Distributions.Normal;
       input Integer nPoints(min=2) = 1000 "Number of evaluation points";
    protected
       Real u[nPoints] = linspace(-3, 3, nPoints);
       Real u2[nPoints] = linspace(0.001, 0.999, nPoints);
       Real y1[nPoints];
       Real y2[nPoints];
       Real y3[nPoints];
    algorithm
       y1 := Normal.density(u);
       y2 := Normal.density(u, mu=  1);
       y3 := Normal.density(u, mu=  0, sigma=  0.5);
       plotArrays(u, [y1,y2,y3], title="Densities of Normal distribution",
                  legend={"density(u,0,1)", "density(u,1,1)", "density(u,0,0.5)"},id=1);

       y1 := Normal.cumulative(u);
       y2 := Normal.cumulative(u, mu=1);
       y3 := Normal.cumulative(u, mu=0, sigma=  0.5);
       plotArrays(u, [y1,y2,y3], title="Cumulative distribution functions of Normal distribution",
                  legend={"cumulative(u,0,1)", "cumulative(u,1,1)", "cumulative(u,0,0.5)"}, id=10);

       y1 := Normal.quantile(u2);
       y2 := Normal.quantile(u2, mu=1);
       y3 := Normal.quantile(u2, mu=0, sigma=  0.5);
       plotArrays(u2, [y1,y2,y3], title="Inverse cumulative distribution function of Normal distribution",
                  legend={"quantile(u,0,1)", "quantile(u,1,1)", "quantile(u,0,0.5)"}, id=20);

       annotation(__Dymola_interactive = true);
    end normal;

    function weibull "Plot functions Math.Distributions.Weibull"
       import Modelica_Noise.Math.Distributions.Weibull;
       input Integer nPoints(min=2) = 1000 "Number of evaluation points";
    protected
       Real u[nPoints] = linspace(-1, 3, nPoints);
       Real u2[nPoints] = linspace(0.001, 0.999, nPoints);
       Real y1[nPoints];
       Real y2[nPoints];
       Real y3[nPoints];
    algorithm
       y1 := Weibull.density(u);
       y2 := Weibull.density(u, lambda=0.5, k=2);
       y3 := Weibull.density(u, lambda=0.5, k=3);
       plotArrays(u, [y1,y2,y3], title="Densities of Weibull distribution",
                  legend={"density(u,1,1)", "density(u,0.5,2)", "density(u,0.5,3)"},id=1);

       y1 := Weibull.cumulative(u);
       y2 := Weibull.cumulative(u, lambda=0.5, k=2);
       y3 := Weibull.cumulative(u, lambda=0.5, k=3);
       plotArrays(u, [y1,y2,y3], title="Cumulative distribution functions of Weibull distribution",
                  legend={"cumulative(u,1,1)", "cumulative(u,0.5,2)", "cumulative(u,0.5,3)"}, id=10);

       y1 := Weibull.quantile(u2);
       y2 := Weibull.quantile(u2, lambda=0.5, k=2);
       y3 := Weibull.quantile(u2, lambda=0.5, k=3);
       plotArrays(u2, [y1,y2,y3], title="Inverse cumulative distribution function of Weibull distribution",
                  legend={"quantile(u,1,1)", "quantile(u,0.5,2)", "quantile(u,0.5,3)"}, id=20);
       annotation(__Dymola_interactive = true);
    end weibull;

    function bates "Plot functions Math.Distributions.Bates"
       import Noise.Distributions.Bates;
       input Integer nPoints(min=2) = 500 "Number of evaluation points";
    protected
       Real u[nPoints] = linspace(-4, 4, nPoints);
       Real u2[nPoints] = linspace(0, 1, nPoints);
       Real y1[nPoints];
       Real y2[nPoints];
       Real y3[nPoints];
    algorithm
       y1 := Bates.density(u, y_min=-3, y_max=3);
       y2 := Bates.density(u, y_min=-3, y_max=3, n=6);
       y3 := Bates.density(u, y_min=-3, y_max=3, n=2);
       plotArrays(u, [y1,y2,y3], title="Densities of Bates distribution with y_min=-3, y_max=3",
                  legend={"n = 12", "n = 6", "n = 2"},id=10);

       y1 := Bates.cumulative(u, y_min=-3, y_max=3);
       y2 := Bates.cumulative(u, y_min=-3, y_max=3, n=6);
       y3 := Bates.cumulative(u, y_min=-3, y_max=3, n=2);
       plotArrays(u, [y1,y2,y3], title="Cumulative distribution functions of Bates distributionwith y_min=-3, y_max=3",
                  legend={"n = 12", "n = 6", "n = 2"},id=20);

       y1 := Bates.quantile(u2, y_min=-3, y_max=3);
       y2 := Bates.quantile(u2, y_min=-3, y_max=3, n=6);
       y3 := Bates.quantile(u2, y_min=-3, y_max=3, n=2);
       plotArrays(u2, [y1,y2,y3], title="Inverse cumulative distribution function of Bates distribution with y_min=-3, y_max=3",
                  legend={"n = 12", "n = 6", "n = 2"}, id=30);

       annotation(__Dymola_interactive = true);
    end bates;

    function Discrete "Plot functions Math.Distributions.Discrete"
       import Modelica_Noise.Math.Distributions.Discrete;
       input Integer nPoints(min=2) = 1000 "Number of evaluation points";
    protected
       Real u[nPoints] = linspace(-5, 5, nPoints);
       Real u2[nPoints] = linspace(0, 1, nPoints);
       Real y1[nPoints];
       Real y2[nPoints];
       Real y3[nPoints];
    algorithm
       y1 := Discrete.cumulative(u);
       y2 := Discrete.cumulative(u);
       y3 := Discrete.cumulative(u);
       plotArrays(u, [y1,y2,y3], title="Cumulative distribution functions of Discrete distribution",
                  legend={"cumulative(u,-3,3)", "cumulative(u,-1,3)", "cumulative(u,1,3)"},id=2);

       y1 := Discrete.quantile(u2);
       y2 := Discrete.quantile(u2);
       y3 := Discrete.quantile(u2);
       plotArrays(u2, [y1,y2,y3], title="Inverse cumulative distribution function of Discrete distribution",
                  legend={"quantile(u,-3,3)", "quantile(u,-1,3)", "quantile(u,1,3)"}, id=3);

       annotation(__Dymola_interactive = true);
    end Discrete;
  end Distributions;

  package TruncatedDistributions
       extends Modelica.Icons.Package;

    function uniform "Plot functions Math.TruncatedDistributions.Uniform"
       import Modelica_Noise.Math.TruncatedDistributions.Uniform;
       input Integer nPoints(min=2) = 1000 "Number of evaluation points";
    protected
       Real u[nPoints] = linspace(-5, 5, nPoints);
       Real u2[nPoints] = linspace(0, 1, nPoints);
       Real y1[nPoints];
       Real y2[nPoints];
       Real y3[nPoints];
    algorithm
       y1 := Uniform.density(u, u_min=-3, u_max=3);
       y2 := Uniform.density(u, u_min=-1, u_max=3);
       y3 := Uniform.density(u, u_min=1, u_max=3);
       plotArrays(u, [y1,y2,y3], title="Densities of uniform distribution",
                  legend={"density(u,-3,3)", "density(u,-1,3)", "density(u,1,3)"},id=1);

       y1 := Uniform.cumulative(u, u_min=-3, u_max=3);
       y2 := Uniform.cumulative(u, u_min=-1, u_max=3);
       y3 := Uniform.cumulative(u, u_min=1, u_max=3);
       plotArrays(u, [y1,y2,y3], title="Cumulative distribution functions of uniform distribution",
                  legend={"cumulative(u,-3,3)", "cumulative(u,-1,3)", "cumulative(u,1,3)"},id=2);

       y1 := Uniform.quantile(u2, y_min=-3, y_max=3);
       y2 := Uniform.quantile(u2, y_min=-1, y_max=3);
       y3 := Uniform.quantile(u2, y_min=1, y_max=3);
       plotArrays(u2, [y1,y2,y3], title="Inverse cumulative distribution function of uniform distribution",
                  legend={"quantile(u,-3,3)", "quantile(u,-1,3)", "quantile(u,1,3)"}, id=3);

       annotation(__Dymola_interactive = true);
    end uniform;

    function normal "Plot functions Math.TruncatedDistributions.Normal"
       import Modelica_Noise.Math.Distributions.Normal;
       import T_Normal = Modelica_Noise.Math.TruncatedDistributions.Normal;
       input Integer nPoints(min=2) = 1000 "Number of evaluation points";
    protected
       Real u[nPoints] = linspace(-3, 3, nPoints);
       Real u2[nPoints] = linspace(0.001, 0.999, nPoints);
       Real y1[nPoints];
       Real y2[nPoints];
    algorithm
       y1 := Normal.density(u);
       y2 := T_Normal.density(u, u_min=-1.5,u_max=1.5);
       plotArrays(u, [y1,y2], title="Densities of Normal distribution",
                  legend={"mu=0, sigma=1", "truncated to u_min=-1.5, u_max=1.5"},id=1);

       y1 := Normal.cumulative(u);
       y2 := T_Normal.cumulative(u, u_min=-1.5,u_max=1.5);
       plotArrays(u, [y1,y2], title="Cumulative distribution functions of Normal distribution",
                  legend={"mu=0, sigma=1", "truncated to u_min=-1.5, u_max=1.5"}, id=10);

       y1 := Normal.quantile(u2);
       y2 := T_Normal.quantile(u2, y_min=-1.5,y_max=1.5);
       plotArrays(u2, [y1,y2], title="Inverse cumulative distribution function of Normal distribution",
                  legend={"mu=0, sigma=1", "truncated to u_min=-1.5, u_max=1.5"}, id=20);

       annotation(__Dymola_interactive = true);
    end normal;

    function weibull "Plot functions Math.TruncatedDistributions.Weibull"
       import Modelica_Noise.Math.Distributions.Weibull;
       import T_Weibull = Modelica_Noise.Math.TruncatedDistributions.Weibull;
       input Integer nPoints(min=2) = 1000 "Number of evaluation points";
    protected
       Real u[nPoints] = linspace(-1, 2, nPoints);
       Real u2[nPoints] = linspace(0.001, 0.999, nPoints);
       Real y1[nPoints];
       Real y2[nPoints];
    algorithm
       y1 := Weibull.density(u, lambda=0.5, k=2);
       y2 := T_Weibull.density(u,u_max=0.8, lambda=0.5, k=2);
       plotArrays(u, [y1,y2], title="Densities of Weibull distribution",
                  legend={"lambda=0.5, k=2", "truncated to u_min=0, u_max=0.8"},id=1);

       y1 := Weibull.cumulative(u, lambda=0.5, k=2);
       y2 := T_Weibull.cumulative(u, u_max=0.8, lambda=0.5, k=2);
       plotArrays(u, [y1,y2], title="Cumulative distribution functions of Weibull distribution",
                  legend={"lambda=0.5, k=2", "truncated to u_min=0, u_max=0.8"}, id=10);

       y1 := Weibull.quantile(u2, lambda=0.5, k=2);
       y2 := T_Weibull.quantile(u2, y_max=0.8, lambda=0.5, k=2);
       plotArrays(u2, [y1,y2], title="Inverse cumulative distribution function of Weibull distribution",
                  legend={"lambda=0.5, k=2", "truncated to u_min=0, u_max=0.8"}, id=20);

       annotation(__Dymola_interactive = true);
    end weibull;
    annotation (Documentation(info="<html>
</html>"));
  end TruncatedDistributions;
end ToNoisePlotSpecial;
