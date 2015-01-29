within Noise.Examples;
model Interpolation "Tests all interpolators"
  extends Modelica_Noise.Blocks.Examples.NoiseExamples.Interpolation;
  Modelica_Noise.Blocks.Noise.EventBasedNoise filteredNoise(
    useAutomaticLocalSeed=false,
    samplePeriod=0.1,
    y_min=-1,
    y_max=3,
    sampleFactor=10,
    redeclare package interpolation = Noise.Interpolators.FirstOrder)
    annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
  Modelica.Blocks.Continuous.Der derFiltered
    annotation (Placement(transformation(extent={{0,-92},{20,-72}})));
  Modelica.Blocks.Continuous.FirstOrder filteredFiltered(T=0.00001, y_start=0.2)
    annotation (Placement(transformation(extent={{-20,-68},{0,-48}})));
  Modelica.Blocks.Continuous.Der derFilteredFiltered
    annotation (Placement(transformation(extent={{20,-68},{40,-48}})));
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
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end Interpolation;
