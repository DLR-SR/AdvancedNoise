within Noise.Utilities.Interaction.Show;
block StringValue
  "Show String value from stringPort or from string input field in diagram layer dynamically"
  parameter Boolean use_stringPort = true "= true, if stringPort enabled"
    annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true));
  input String string = "<null>"
    "String to visualize if use_stringPort=false (time varying)"
    annotation(Dialog(enable=not use_numberPort), HideResult=true);
  Interfaces.StringInput stringPort if use_stringPort
    "String to be shown in diagram layer if use_stringPort = true"
    annotation (HideResult=true,Placement(transformation(extent={{-130,-15},{-100,15}})));
   Interfaces.StringOutput showString;
equation
  if use_stringPort then
     connect(stringPort, showString);
  else
     showString = string;
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false,  extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{100,40},{-100,-40}},
            lineColor={0,0,255},
            fillColor={236,233,216},
            fillPattern=FillPattern.Solid,
            borderPattern=BorderPattern.Raised),
          Text(extent={{-94,-34},{96,34}}, textString=DynamicSelect("<null>",showString)),
          Text(
            visible=not use_numberPort,
            extent={{-150,-50},{150,-70}},
            lineColor={0,0,0},
            textString="%string")}), Documentation(info="<html>
<p>
This block visualizes a Real number in a diagram animation.
The number to be visualized can be defined in the following ways:
</p>

<ul>
<li> If useNumberPort = <b>true</b> (which is the default), a Real
     input is present and this input variable is shown.</li>

<li> If useNumberPort = <b>false</b> no input connector is present.
     Instead, a Real input field is activated in the parameter menu
     and the Real expression from this input menu is shown.</li>
</ul>

<p>
The two versions of the block are shown in the following image (in the right variant, the
name of the variable value that is displayed is also shown below the icon):<br>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Interaction/RealValue.png\">
</p>

<p>
The usage is demonstrated, e.g., in example
<a href=\"modelica://Modelica.Blocks.Examples.RealNetwork1\">Modelica.Blocks.Examples.RealNetwork1</a>.
</p>
</html>", revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>"));
end StringValue;
