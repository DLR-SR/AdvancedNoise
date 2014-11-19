within Noise;
model GlobalSeed_bak
  "Defines a global seed value and provides an impure random number generator"
  import Noise.Utilities.Auxiliary;

// Provide a flag to globally disable noise
public
  parameter Boolean enableNoise = true
    "= true, if noise generators shall be enabled. = false, if a constant substitute value shall be used"
    annotation(choices(checkBox=true));

// The global seed value
public
  parameter Boolean useGlobalSeed = true
    "= true, use fixed global initial seed. = false, choose a random seed by system time and process id)"
    annotation(choices(checkBox=true));
  parameter Integer globalSeed = 67867967
    "Global initial seed for random number generator"  annotation(Dialog(enable=useGlobalInitialSeed));
public
  final parameter Integer seed = if useGlobalSeed then globalSeed else Auxiliary.automaticSeed();

// The impure global random function
public
  function random = Auxiliary.random;
equation
  when initial() then
    Auxiliary.seedRandom(seed);
  end when;

// The pure global random function and associated parameters

  annotation (
   defaultComponentName="globalSeed",
    defaultComponentPrefixes="inner",
    missingInnerMessage="
Your model is using an outer \"globalSeed\" component but
an inner \"globalSeed\" component is not defined and therefore
a default inner \"globalSeed\" component is introduced by the tool.
To change the default setting, drag Noise.GlobalSeed
into your model and specify the seed.
",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Ellipse(
          extent={{-78,20},{84,-92}},
          fillColor={147,108,31},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={89,64,19},
          lineThickness=0.5),
        Ellipse(
          extent={{-64,6},{64,-58}},
          fillColor={89,64,19},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Polygon(
          points={{-20,-14},{-40,0},{-58,16},{-68,50},{-16,90},{20,82},{2,42},{-50,
              50},{-46,12},{-20,-14}},
          pattern=LinePattern.None,
          smooth=Smooth.Bezier,
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Polygon(
          points={{-28,-14},{-58,4},{-90,12},{-96,-2},{-88,-12},{-62,-2},{-28,-14}},
          smooth=Smooth.Bezier,
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),    Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})}),
    Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>Inner/Outer Model for Global Seeding.</p>
<p>This model enables the modeler to define a global seed value for random generators.</p>
<p>The seed value can then be used (i.e. combined with a local seed value) at local pseudo-random signal generators. If so, then a switch of the global seed changes all pseudo-random signals.</p>
<p>Remark: Some pseudo-random number generators demand for larger seed values (array of integers). In this case the large seed is automatically generated out of this single integer seed value.</p>
</html>"));
end GlobalSeed_bak;
