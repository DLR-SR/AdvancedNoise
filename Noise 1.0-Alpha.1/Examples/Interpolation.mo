within Noise.Examples;
model Interpolation "Tests all interpolators"
  extends Modelica_Noise.Blocks.Examples.NoiseExamples.Interpolation;
  Modelica_Noise.Blocks.Noise.TimeBasedNoise filteredNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    sampleFactor=10,
    redeclare package interpolation = Noise.Interpolators.FirstOrder)
    annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
  Modelica.Blocks.Continuous.Der derFiltered
    annotation (Placement(transformation(extent={{0,-92},{20,-72}})));
  Modelica.Blocks.Continuous.FirstOrder filteredFiltered(T=0.00001, y_start=0.2,
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
  Modelica_Noise.Blocks.Noise.TimeBasedNoise stepNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    sampleFactor=10,
    redeclare package interpolation = Noise.Interpolators.StepResponse)
    annotation (Placement(transformation(extent={{-60,-130},{-40,-110}})));
  Modelica.Blocks.Continuous.FirstOrder stepFiltered(T=0.00001, y_start=0.2,
    initType=Modelica.Blocks.Types.Init.InitialState)
    annotation (Placement(transformation(extent={{-20,-118},{0,-98}})));
  Modelica.Blocks.Continuous.Der derStepFiltered
    annotation (Placement(transformation(extent={{20,-118},{40,-98}})));
equation
  connect(filteredFiltered.y, derFilteredFiltered.u) annotation (Line(
      points={{1,-58},{18,-58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(filteredFiltered.u, filteredNoise.y) annotation (Line(
      points={{-22,-58},{-28,-58},{-28,-70},{-39,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(derFiltered.u, filteredNoise.y) annotation (Line(
      points={{-2,-82},{-28,-82},{-28,-70},{-39,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(linearFiltered.u, linearNoise.y) annotation (Line(
      points={{-22,42},{-30,42},{-30,30},{-39,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(linearFiltered.y, derLinearFiltered.u) annotation (Line(
      points={{1,42},{18,42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(derLinear.u, linearNoise.y) annotation (Line(
      points={{-2,18},{-30,18},{-30,30},{-39,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(smoothFiltered.y, derSmoothFiltered.u) annotation (Line(
      points={{1,-8},{18,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(smoothFiltered.u, smoothNoise.y) annotation (Line(
      points={{-22,-8},{-32,-8},{-32,-20},{-39,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(derSmooth.u, smoothNoise.y) annotation (Line(
      points={{-2,-32},{-32,-32},{-32,-20},{-39,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(stepFiltered.y, derStepFiltered.u) annotation (Line(
      points={{1,-108},{18,-108}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(stepFiltered.u, stepNoise.y) annotation (Line(
      points={{-22,-108},{-28,-108},{-28,-120},{-39,-120}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,100}}), graphics), Icon(coordinateSystem(extent={{-100,
            -140},{100,100}})));
end Interpolation;
