within AdvancedNoise.Examples;
model TimeBasedInterpolation "Shows using the interpolators with derivatives"
  extends Modelica.Icons.Example;
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
        false) annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Sources.TimeBasedNoise constantNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    redeclare package interpolation = AdvancedNoise.Interpolators.Constant,
    redeclare function distribution =
      Modelica.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Sources.TimeBasedNoise linearNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    redeclare package interpolation = AdvancedNoise.Interpolators.Linear,
    redeclare function distribution =
        Modelica.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Sources.TimeBasedNoise smoothNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    redeclare package interpolation =
      AdvancedNoise.Interpolators.SmoothIdealLowPass,
    redeclare function distribution =
      Modelica.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Sources.TimeBasedNoise filteredNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    redeclare package interpolation =
      AdvancedNoise.Interpolators.FirstOrder,
    redeclare function distribution =
      Modelica.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
  Modelica.Blocks.Continuous.Der derFiltered
    annotation (Placement(transformation(extent={{0,-92},{20,-72}})));
  Modelica.Blocks.Continuous.FirstOrder filteredFiltered(
    T=0.00001,
    y_start=0.2,
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-20,-68},{0,-48}})));
  Modelica.Blocks.Continuous.Der derFilteredFiltered
    annotation (Placement(transformation(extent={{20,-68},{40,-48}})));
  Modelica.Blocks.Continuous.Der derLinear
    annotation (Placement(transformation(extent={{0,8},{20,28}})));
  Modelica.Blocks.Continuous.Filter linearFiltered(
    y_start=0.2,
    f_cut=1e5,
    order=2) annotation (Placement(transformation(extent={{-20,32},{0,52}})));
  Modelica.Blocks.Continuous.Der derLinearFiltered
    annotation (Placement(transformation(extent={{20,32},{40,52}})));
  Modelica.Blocks.Continuous.Der derSmooth
    annotation (Placement(transformation(extent={{0,-42},{20,-22}})));
  Modelica.Blocks.Continuous.Filter smoothFiltered(
    y_start=0.2,
    f_cut=1e5,
    order=2) annotation (Placement(transformation(extent={{-20,-18},{0,2}})));
  Modelica.Blocks.Continuous.Der derSmoothFiltered
    annotation (Placement(transformation(extent={{20,-18},{40,2}})));
  Sources.TimeBasedNoise stepNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    sampleFactor=10,
    redeclare package interpolation =
      AdvancedNoise.Interpolators.TabulatedStepResponse,
    redeclare function distribution =
      Modelica.Math.Distributions.Uniform.quantile (y_min=-1, y_max=3))
    annotation (Placement(transformation(extent={{-60,-130},{-40,-110}})));
  Modelica.Blocks.Continuous.FirstOrder stepFiltered(
    T=0.00001,
    y_start=0.2,
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-20,-118},{0,-98}})));
  Modelica.Blocks.Continuous.Der derStepFiltered
    annotation (Placement(transformation(extent={{20,-118},{40,-98}})));
  Modelica.Blocks.Continuous.Der derStep
    annotation (Placement(transformation(extent={{0,-140},{20,-120}})));
equation
  connect(filteredFiltered.y, derFilteredFiltered.u) annotation (Line(
      points={{1,-58},{18,-58}},
      color={0,0,127}));
  connect(filteredFiltered.u, filteredNoise.y) annotation (Line(
      points={{-22,-58},{-28,-58},{-28,-70},{-39,-70}},
      color={0,0,127}));
  connect(derFiltered.u, filteredNoise.y) annotation (Line(
      points={{-2,-82},{-28,-82},{-28,-70},{-39,-70}},
      color={0,0,127}));
  connect(linearFiltered.u, linearNoise.y) annotation (Line(
      points={{-22,42},{-30,42},{-30,30},{-39,30}},
      color={0,0,127}));
  connect(linearFiltered.y, derLinearFiltered.u) annotation (Line(
      points={{1,42},{18,42}},
      color={0,0,127}));
  connect(derLinear.u, linearNoise.y) annotation (Line(
      points={{-2,18},{-30,18},{-30,30},{-39,30}},
      color={0,0,127}));
  connect(smoothFiltered.y, derSmoothFiltered.u) annotation (Line(
      points={{1,-8},{18,-8}},
      color={0,0,127}));
  connect(smoothFiltered.u, smoothNoise.y) annotation (Line(
      points={{-22,-8},{-32,-8},{-32,-20},{-39,-20}},
      color={0,0,127}));
  connect(derSmooth.u, smoothNoise.y) annotation (Line(
      points={{-2,-32},{-32,-32},{-32,-20},{-39,-20}},
      color={0,0,127}));
  connect(stepFiltered.y, derStepFiltered.u) annotation (Line(
      points={{1,-108},{18,-108}},
      color={0,0,127}));
  connect(stepFiltered.u, stepNoise.y) annotation (Line(
      points={{-22,-108},{-28,-108},{-28,-120},{-39,-120}},
      color={0,0,127}));
  connect(derStep.u, stepNoise.y) annotation (Line(
      points={{-2,-130},{-28,-130},{-28,-120},{-39,-120}},
      color={0,0,127}));

  annotation (
    experiment(StopTime=2),
    Documentation(info="<html>
<p>
This example demonstrates the different interpolation methods that
can be selected for a Noise block. All the blocks use
samplePeriod&nbsp;=&nbsp;0.1&nbsp;s and generated uniform noise in
the band y_min=-1&nbsp;..&nbsp;y_max=3. Furhtermore, all blocks use
the same fixedLocalSeed, so all blocks generate exactly the same random
numbers at the sample instants 0&nbsp;s, 0.1&nbsp;s, 0.2&nbsp;s, ...
However, these values are differently interpolated as shown in the next diagram:
</p>

<blockquote>
<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/InterpolationInterpolators.png\" alt=\"Diagram InterpolationInterpolators.png\">
</blockquote>

<p>
As can be seen, constant (constantNoise.y) and linear (linearNoise.y)
interpolation respects the defined band -1&nbsp;..&nbsp;3.
Instead, smooth interpolation with the sinc function (smoothNoise.y)
may violate the band slightly in order to be able to smoothly interpolate
the random values at the sample instants. In practical applications,
this is not an issue because the exact band of the noise is usually
not exactly known.
</p>
</html>", revisions="<html>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td valign=\"top\">
      <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
    </td>
    <td valign=\"bottom\">
      <strong>Copyright</strong> <strong>&copy; DLR Institute of System Dynamics and Control</strong><br>
      Initial version implemented by
      A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
      <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td>
  </tr>
</table>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,100}}), graphics), Icon(coordinateSystem(extent={{-100,
            -140},{100,100}})));
end TimeBasedInterpolation;
