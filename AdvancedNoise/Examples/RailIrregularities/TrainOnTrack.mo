within AdvancedNoise.Examples.RailIrregularities;
model TrainOnTrack
  "This examples simulates a simple train on a track with irregularities"
  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Components.Fixed earth
    annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
  Parts.SimpleRailwayTrack simpleRailwayTrack annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-40})));
  Parts.QuarterRailwayCar quarterRailwayCar annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,40})));
  Parts.Displacement displacement(position(v(fixed=true)))
                                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Parts.Irregularity irregularity
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Mechanics.Translational.Sensors.AccSensor accSensor
    annotation (Placement(transformation(extent={{40,80},{60,100}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
equation
  connect(quarterRailwayCar.flange_a, displacement.flange_b) annotation (Line(
      points={{0,30},{0,10}},
      color={0,127,0}));
  connect(displacement.flange_a, simpleRailwayTrack.flange_b) annotation (Line(
      points={{0,-10},{0,-30}},
      color={0,127,0}));
  connect(simpleRailwayTrack.flange_a, earth.flange) annotation (Line(
      points={{0,-50},{0,-80}},
      color={0,127,0}));
  connect(irregularity.y, displacement.u) annotation (Line(
      points={{-39,0},{-2.4,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(positionSensor.flange, quarterRailwayCar.flange_b) annotation (Line(
      points={{40,70},{0,70},{0,50}},
      color={0,127,0}));
  connect(accSensor.flange, quarterRailwayCar.flange_b) annotation (Line(
      points={{40,90},{0,90},{0,50}},
      color={0,127,0}));

initial equation
  simpleRailwayTrack.track.a = 0;
  //simpleRailwayTrack.track.v = 0; // is given by spring-damper
  quarterRailwayCar.wheel.a  = 0;
  //quarterRailwayCar.wheel.v  = 0; // is given by spring-damper
  //quarterRailwayCar.body.a   = 0; // is given by spring-damper zero forces and wheel.a=0
  //quarterRailwayCar.body.v   = 0; // is given by spring-damper
  annotation ( Documentation(revisions="<html>
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
</html>", info="<html>
<p>
In literature, the excitation of railway vehicles by the rail
is usualy given in the frequency domain. Below an example of
such an excitation as found in literature is given.
</p>
<blockquote>
<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/RailIrregularities/RailExcitationSpatial.png\" alt=\"Diagram RailExcitationSpatial.png\">
</blockquote>
<p>
In this example, the average excitation is used to analyze
a train on a track in the frequency domain.
</p>
<p>
The settings from irragulatities as highlighted below can be used
to select the wanted method to generate the track irregulatities.
</p>
<blockquote>
<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/RailIrregularities/TrainOnTrackSettings.png\" alt=\"Diagram TrainOnTrackSettings.png\">
</blockquote>
<p>
Using the minimum phase filter a comparison is made between a 
well-trusted solution with the convolution implementation of this model.
The plot shows spectral density of the model&#39;s acceleration output
(red curve) compared to the trusted frequency-domain solution (blue curve).
Both curves agree very well.
</p>
<blockquote>
<img src=\"modelica://AdvancedNoise/Resources/Images/Examples/RailIrregularities/TrainOnTrack.png\" alt=\"Diagram TrainOnTrack.png\">
</blockquote>
<p>
For more information please see the publication
[<a href=\"modelica://AdvancedNoise.UsersGuide.References\">Kloeckner2015</a>].
</p>
</html>"));
end TrainOnTrack;
