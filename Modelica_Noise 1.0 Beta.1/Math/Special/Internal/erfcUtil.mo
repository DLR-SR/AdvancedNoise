within Modelica_Noise.Math.Special.Internal;
function erfcUtil "erfc(z) for 0.5 <= z "
   input Real z "Input argument 0.5 <= z required (but not checked)";
   output Real y "erfc(z) for 0.5 <= z";
protected
   constant Real y1 = 0.405935764312744140625;
   constant Real P1[6] = {-0.098090592216281240205,
                           0.178114665841120341155,
                           0.191003695796775433986,
                           0.0888900368967884466578,
                           0.0195049001251218801359,
                           0.00180424538297014223957};
   constant Real Q1[7] = {1,
                          1.84759070983002217845,
                          1.42628004845511324508,
                          0.578052804889902404909,
                          0.12385097467900864233,
                          0.0113385233577001411017,
                          0.337511472483094676155e-5};

   constant Real y2 = 0.50672817230224609375;
   constant Real P2[6] = {-0.0243500476207698441272,
                           0.0386540375035707201728,
                           0.04394818964209516296,
                           0.0175679436311802092299,
                           0.00323962406290842133584,
                           0.000235839115596880717416};
   constant Real Q2[6] = {1,
                          1.53991494948552447182,
                          0.982403709157920235114,
                          0.325732924782444448493,
                          0.0563921837420478160373,
                          0.00410369723978904575884};

   constant Real y3 = 0.5405750274658203125;
   constant Real P3[6] = {0.00295276716530971662634,
                          0.0137384425896355332126,
                          0.00840807615555585383007,
                          0.00212825620914618649141,
                          0.000250269961544794627958,
                          0.113212406648847561139e-4};
   constant Real Q3[6] = {1,
                          1.04217814166938418171,
                          0.442597659481563127003,
                          0.0958492726301061423444,
                          0.0105982906484876531489,
                          0.000479411269521714493907};

   constant Real y4 = 0.5579090118408203125;
   constant Real P4[7] = {0.00628057170626964891937,
                          0.0175389834052493308818,
                         -0.212652252872804219852,
                         -0.687717681153649930619,
                         -2.5518551727311523996,
                         -3.22729451764143718517,
                         -2.8175401114513378771};
   constant Real Q4[7] = {1,
                          2.79257750980575282228,
                         11.0567237927800161565,
                         15.930646027911794143,
                         22.9367376522880577224,
                         13.5064170191802889145,
                          5.48409182238641741584};

algorithm
   if z < 1.5 then
      // Maximum Deviation Found:                     3.702e-17
      // Expected Error Term:                         3.702e-17
      // Maximum Relative Change in Control Points:   2.845e-04
      // Max Error found at double precision =        4.841816e-17
      y :=y1 + polyEval(P1, z - 0.5)/polyEval(Q1, z - 0.5);

   elseif z < 2.5 then
      // Max Error found at double precision =        6.599585e-18
      // Maximum Deviation Found:                     3.909e-18
      // Expected Error Term:                         3.909e-18
      // Maximum Relative Change in Control Points:   9.886e-05
      y :=y2 + polyEval(P2, z - 1.5)/polyEval(Q2, z - 1.5);

   elseif z < 4.5 then
      // Maximum Deviation Found:                     1.512e-17
      // Expected Error Term:                         1.512e-17
      // Maximum Relative Change in Control Points:   2.222e-04
      // Max Error found at double precision =        2.062515e-17
      y :=y3 + polyEval(P3, z - 3.5)/polyEval(Q3, z - 3.5);

   else
      // Max Error found at double precision =        2.997958e-17
      // Maximum Deviation Found:                     2.860e-17
      // Expected Error Term:                         2.859e-17
      // Maximum Relative Change in Control Points:   1.357e-05
      y :=y4 + polyEval(P4, 1/z)/polyEval(Q4, 1/z);
   end if;

   y := y*(exp(-z * z) / z);
 annotation (Documentation(info="<html>
<p>
Utility function in order to compute part of erf(..) and erfc(..).
</p>
</html>",
       revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> June 22, 2015 </td>
    <td valign=\"top\">

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\">
         Initial version implemented by
         A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end erfcUtil;
