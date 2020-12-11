within AdvancedNoise.Examples.RailIrregularities.Comparisons;
model FilterAndConvolution
  "Compares implementation with filter and convolution"
  extends Modelica.Icons.Example;

  constant Real convolutionResolution=RailMinimumPhaseInterpolator.T[2] -
      RailMinimumPhaseInterpolator.T[1];

  parameter Boolean doMinimum = true "Calculate minimum phase filter?";
  parameter Boolean doZero =    false "Calculate zero phase filter?";
  parameter Boolean doFilter =  true "Calculate state space phase filter?";
  parameter Boolean doTime =    false "Calculate time-based noise?";

  parameter Modelica.Units.SI.Duration samplePeriod = 0.2 "Common sample period";

  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
               annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Sources.SignalBasedNoise spaceDomainNoiseMinimum(
    useTime=false,
    redeclare package interpolation =
        AdvancedNoise.Examples.RailIrregularities.RailMinimumPhaseInterpolator,
    useAutomaticLocalSeed=false,
    samplePeriod=samplePeriod,
    redeclare function distribution =
        Modelica.Math.Distributions.TruncatedNormal.quantile (
        mu=0,
        sigma=sqrt(0.5)/sqrt(samplePeriod),
        y_min=-1e10,
        y_max=1e10)) if             doMinimum
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));

  Modelica.Blocks.Continuous.Integrator position(y_start=123)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Sources.Constant velocity(k=100)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Continuous.TransferFunction spaceDomainFilter(b={2.7542724e-04,
        4.5134777e-03} ./ {velocity.k,1}, a={1.0000000e+00,3.0670519e+00,2.2183340e-01}
         ./ {velocity.k^2,velocity.k,1},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=-0.00279) if                    doFilter
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Sources.SignalBasedNoise spaceDomainNoiseWhite(
    useTime=false,
    useAutomaticLocalSeed=false,
    samplePeriod=samplePeriod,
    redeclare function distribution =
        Modelica.Math.Distributions.TruncatedNormal.quantile (
        mu=0,
        sigma=sqrt(0.5)/sqrt(samplePeriod),
        y_min=-1e10,
        y_max=1e10)) if                      doFilter
    annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  Sources.SignalBasedNoise spaceDomainNoiseZero(
    useTime=false,
    useAutomaticLocalSeed=false,
    samplePeriod=samplePeriod,
    redeclare package interpolation =
        AdvancedNoise.Examples.RailIrregularities.RailZeroPhaseInterpolator,
    redeclare function distribution =
        Modelica.Math.Distributions.TruncatedNormal.quantile (
        mu=0,
        sigma=sqrt(0.5)/sqrt(samplePeriod),
        y_min=-1e10,
        y_max=1e10)) if                                              doZero
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  Modelica.Blocks.Continuous.TransferFunction timeDomainFilter(b={2.7542724e-04,
        4.5134777e-03} ./ {velocity.k,1}, a={1.0000000e+00,3.0670519e+00,
        2.2183340e-01} ./ {velocity.k^2,velocity.k,1},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=-0.00279) if                               doTime
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Modelica.Blocks.Noise.BandLimitedWhiteNoise bandLimitedWhiteNoise(
      samplePeriod=samplePeriod/velocity.k, noisePower=
        1/(velocity.k)) if                                                     doTime
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
equation
  connect(velocity.y, position.u) annotation (Line(
      points={{-79,30},{-62,30}},
      color={0,0,127}));
  connect(position.y, spaceDomainNoiseMinimum.u) annotation (Line(
      points={{-39,30},{-22,30}},
      color={0,0,127}));
  connect(spaceDomainNoiseWhite.u, position.y) annotation (Line(
      points={{-22,-10},{-30,-10},{-30,30},{-39,30}},
      color={0,0,127}));
  connect(spaceDomainFilter.u, spaceDomainNoiseWhite.y) annotation (Line(
      points={{18,-10},{1,-10}},
      color={0,0,127}));
  connect(spaceDomainNoiseZero.u, position.y) annotation (Line(
      points={{-22,70},{-30,70},{-30,30},{-39,30}},
      color={0,0,127}));
  connect(bandLimitedWhiteNoise.y, timeDomainFilter.u) annotation (Line(
      points={{1,-50},{18,-50}},
      color={0,0,127}));
  annotation ( experiment(
      StopTime=5,
      Interval=0.01,
      Tolerance=0.001),
Documentation(revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      <b>Copyright</b> <b>&copy; DLR Institute of System Dynamics and Control</b><br>
      Initial version implemented by
      A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
      <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>", info="<html>
<p>
This example compares the implementation of a filter and the convolution method
on the background of a railway application.
</p>
</html>"));
end FilterAndConvolution;
