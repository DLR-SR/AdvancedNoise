within AdvancedNoise.Applications;
package Examples "Collection of applied use cases"
  extends Modelica.Icons.ExamplesPackage;

  model Compare2Excitations "Compare two different road excitations"
    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput yGoodConcrete annotation (Placement(
          transformation(extent={{80,10},{100,30}}), iconTransformation(extent={{90,
              20},{90,20}})));
    Modelica.Blocks.Interfaces.RealOutput yBadPavement annotation (Placement(
          transformation(extent={{80,-30},{100,-10}}), iconTransformation(extent={
              {90,-20},{90,-20}})));
    RoadIrregularitiesGoodAsphaltConrete excitationGoodConcrete
      annotation (Placement(transformation(extent={{0,10},{20,30}})));
    RoadIrregularitiesBadPavement excitationBadPavement
      annotation (Placement(transformation(extent={{0,-30},{20,-10}})));
    Modelica.Blocks.Continuous.Integrator position_r(y_start=0)
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    Modelica.Blocks.Sources.Constant velocity(k=180/3.6)
      annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
                 annotation (Placement(transformation(extent={{60,60},{80,80}})));
  equation
    connect(velocity.y,position_r. u) annotation (Line(
        points={{-79,0},{-62,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(position_r.y, excitationGoodConcrete.u) annotation (Line(points={{-39,
            0},{-20,0},{-20,20},{-2,20}}, color={0,0,127}));
    connect(position_r.y, excitationBadPavement.u) annotation (Line(points={{-39,0},
            {-20,0},{-20,-20},{-2,-20}}, color={0,0,127}));
    connect(excitationBadPavement.y, yBadPavement)
      annotation (Line(points={{21,-20},{90,-20}}, color={0,0,127}));
    connect(excitationGoodConcrete.y, yGoodConcrete)
      annotation (Line(points={{21,20},{58,20},{90,20}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Compare2Excitations;

  model RoadIrregularitiesBadPavement "Provides vertical road irregularities "
    extends AdvancedNoise.Applications.Examples.RoadIrregularities(
        spaceDomainNoiseZero(redeclare package interpolation =
            AdvancedNoise.Applications.Roads.PavementBad));
  annotation (Icon(graphics={  Text(
            extent={{-100,-70},{100,-100}},
            lineColor={0,0,0},
            textString="Bad pavement")}));
  end RoadIrregularitiesBadPavement;

  model RoadIrregularitiesGoodAsphaltConrete
    "Provides vertical road irregularities "
    extends AdvancedNoise.Applications.Examples.RoadIrregularities(
        spaceDomainNoiseZero(redeclare package interpolation =
            AdvancedNoise.Applications.Roads.ConreteAsphaltGood));
    annotation (Icon(graphics={Text(
            extent={{-100,-70},{100,-100}},
            lineColor={0,0,0},
            textString="Good asphalt concrete")}));
  end RoadIrregularitiesGoodAsphaltConrete;

  model RoadIrregularities
    "Base structure for vertical road irregularities"
    extends Modelica.Blocks.Interfaces.SISO;

    parameter Real samplePeriod=0.4;

    AdvancedNoise.Sources.SignalBasedNoise spaceDomainNoiseZero(
      useTime=false,
      useAutomaticLocalSeed=false,
      samplePeriod=samplePeriod,
      redeclare replaceable function distribution =
        Modelica.Math.Distributions.TruncatedNormal.quantile (
          mu=0,
          sigma=sqrt(0.5)/sqrt(samplePeriod),
          y_min=-0.5,
          y_max=0.5),
      redeclare replaceable package interpolation =
          Applications.Roads.ConreteAsphaltGood)
      annotation (Placement(transformation(extent={{-8,-10},{12,10}})));

  equation
    connect(u, spaceDomainNoiseZero.u) annotation (Line(
        points={{-120,0},{-10,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(spaceDomainNoiseZero.y, y) annotation (Line(
        points={{13,0},{110,0}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),           experiment(
        StopTime=20,
        Interval=0.01,
        Tolerance=0.001),
        __Dymola_experimentSetupOutput,
      Icon(graphics={
          Polygon(
            points={{-76,90},{-84,68},{-68,68},{-76,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-76,68},{-76,-80}}, color={192,192,192}),
          Line(points={{-86,0},{72,0}}, color={192,192,192}),
          Polygon(
            points={{94,0},{72,8},{72,-8},{94,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(
             points={{-75,-13},{-61,-13},{-61,3},{-53,3},{-53,-45},{-45,-45},{-45,
                -23},{-37,-23},{-37,61},{-29,61},{-29,29},{-29,29},{-29,-31},{-19,
                -31},{-19,-13},{-9,-13},{-9,-41},{1,-41},{1,41},{7,41},{7,55},{13,
                55},{13,-1},{23,-1},{23,11},{29,11},{29,-19},{39,-19},{39,53},{49,
                53},{49,19},{57,19},{57,-47},{67,-47}},
            color={0,0,0},
            smooth=Smooth.Bezier)}));
  end RoadIrregularities;

end Examples;
