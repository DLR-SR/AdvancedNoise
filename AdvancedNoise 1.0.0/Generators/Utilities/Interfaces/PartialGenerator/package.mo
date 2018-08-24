within AdvancedNoise.Generators.Utilities.Interfaces;
partial package PartialGenerator "Interfaces of a uniform random number generator"
  extends Modelica.Icons.Package;
  constant Integer nState "The dimension of the internal state vector";


  replaceable partial function initialState
    "Return the initial internal states for the uniform random number generator"
    extends Modelica.Icons.Function;

    input Integer localSeed
      "The local seed to be used for generating initial states";
    input Integer globalSeed
      "The global seed to be combined with the local seed";
    output Integer[nState] state "The generated initial states";

    annotation (Documentation(info="<html>
<p>
This partial function defines the input and output arguments of an
initialState(..) function of a random number generator package.
</p>
</html>", revisions="<html>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> June 22, 2015 </td>
    <td valign=\"top\">

    <table border=0>
    <tr><td valign=\"top\">
             <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
    </td><td valign=\"bottom\">
             Initial version implemented by
             A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
             <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td></tr>
    </table>
    </td>
</tr>
</table>
</html>"));
  end initialState;


  replaceable partial function random
  "Return a random number with a uniform distribution in the range 0.0 < result <= 1.0"
    extends Modelica.Icons.Function;
    input Integer[nState] stateIn
    "The internal states for the random number generator";
    output Real result
    "A random number with a uniform distribution on the interval (0,1]";
    output Integer[nState] stateOut
    "The new internal states of the random number generator";
  annotation (Documentation(info="<html>
<p>
This partial function defines the input and output arguments of a
random(..) function of a random number generator package.
</p>
</html>", revisions="<html>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> June 22, 2015 </td>
    <td valign=\"top\">

    <table border=0>
    <tr><td valign=\"top\">
             <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
    </td><td valign=\"bottom\">
             Initial version implemented by
             A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
             <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td></tr>
    </table>
    </td>
</tr>
</table>
</html>"));
  end random;


annotation (Documentation(info="<html>
<p>
This partial package defines the elements and function interfaces of a
pseudo random number generator package. A random number generator package must
inherit from this partial package and adapt the constant <b>nState</b>
to the correct length of the state vector.
</p>
</html>", revisions="<html>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> June 22, 2015 </td>
    <td valign=\"top\">

    <table border=0>
    <tr><td valign=\"top\">
             <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\">
    </td><td valign=\"bottom\">
             Initial version implemented by
             A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
             <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
    </td></tr>
    </table>
    </td>
</tr>
</table>
</html>"));
end PartialGenerator;
