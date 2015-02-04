within Modelica_Noise.Blocks.Noise;
model GlobalSeed "Defines a global seed value"
  parameter Boolean enableNoise = true
    "= true, if noise blocks generate noise as output; = false, if they generate a constant output"
    annotation(choices(checkBox=true));
  parameter Boolean useAutomaticSeed = false
    "= true, choose a seed by system time and process id; = false, use fixedSeed"
    annotation(choices(checkBox=true));
  parameter Integer fixedSeed = 67867967
    "Fixed global seed for random number generators (if useAutomaticSeed = false)"
      annotation(Dialog(enable=not useAutomaticSeed));
  final parameter Integer seed = if useAutomaticSeed then
                                    Modelica_Noise.Math.Random.Utilities.automaticGlobalSeed()
                                 else fixedSeed;
  function random = Modelica_Noise.Math.Random.Utilities.impureRandom (final id=
         id);

protected
  Integer id;
equation
  when initial() then
    id = Modelica_Noise.Math.Random.Utilities.initializeImpureRandom(seed);
  end when;

  annotation (
    defaultComponentName="globalSeed",
    defaultComponentPrefixes="inner",
    missingInnerMessage="
Your model is using an outer \"globalSeed\" component but
an inner \"globalSeed\" component is not defined and therefore
a default inner \"globalSeed\" component is introduced by the tool.
To change the default setting, drag Noise.GlobalSeed
into your model and specify the seed.
",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                         graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                                        Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255}),
        Line(visible=  enableNoise,
             points={{-73,-15},{-59,-15},{-59,1},{-51,1},{-51,-47},{-43,-47},{-43,
              -25},{-35,-25},{-35,59},{-27,59},{-27,27},{-27,27},{-27,-33},{-17,-33},{-17,-15},{-7,-15},{-7,-43},{3,
              -43},{3,39},{9,39},{9,53},{15,53},{15,-3},{25,-3},{25,9},{31,9},{31,
              -21},{41,-21},{41,51},{51,51},{51,17},{59,17},{59,-49},{69,-49}},
            color={215,215,215}),
        Text(visible=enableNoise and not useAutomaticSeed,
          extent={{-90,8},{88,-18}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%fixedSeed"),
        Line(visible=  not enableNoise,
          points={{-80,-4},{84,-4}},
          color={215,215,215},
          smooth=Smooth.None)}),
    Documentation(revisions="<html>
</html>", info="<html>
<p>Inner/Outer Model for Global Seeding.</p>
<p>This model enables the modeler to define a global seed value for random generators.</p>
<p>The seed value can then be used (i.e. combined with a local seed value) at local pseudo-random signal generators. If so, then a switch of the global seed changes all pseudo-random signals.</p>
<p>Remark: Some pseudo-random number generators demand for larger seed values (array of integers). In this case the large seed is automatically generated out of this single integer seed value.</p>
</html>"));
end GlobalSeed;
