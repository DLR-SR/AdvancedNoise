within Noise;
package Seed "A number of seeding functions"
  extends Modelica.Icons.Package;


  extends Utilities.Icons.Seed;


annotation (Icon(graphics={
                          Text(
          extent={{0,118},{110,-62}},
          lineColor={255,0,0},
        textString="?")}), Documentation(revisions="<html>
<p><img src=\"modelica://Noise/Resources/Images/dlr_logo.png\"/> <b>Developed 2014 at the DLR Institute of System Dynamics and Control</b> </p>
</html>", info="<html>
<p>This package contains the seeding functions, i.e. the generation of initial states for the sample-based random number generators. The sample-free methods hava a contanst &QUOT;initial state&QUOT; and only use the first entries of the &QUOT;initial state&QUOT; for their continuous seeding.</p>
</html>"));
end Seed;
