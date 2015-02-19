within Modelica_Noise.Math.Random;
package Generators "Library of functions generating uniform random numbers in the range 0 < random <= 1.0 (with exposed state vectors)"
   extends Modelica.Icons.Package;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
        -100,-100},{100,100}}), graphics={Line(
      points={{-90,-54},{-50,-54},{-50,54},{50,54},{50,-54},{84,-54}},
      color={0,0,0},
      smooth=Smooth.None)}), Documentation(info="<html>
<p>
This package contains various pseudo random number generators. A random number generator is a package
that is derived from <a href=\"modelica://Modelica_Noise.Math.Random.Utilities.Interfaces.PartialGenerator\">Random.Utilities.Interfaces.PartialGenerator</a>
and consists of the following elements:
</p>
<ul>
<li> Integer <b>nState</b> is a constant that defines the length of the internal state vector
     (in order that an appropriate Integer vector of this length can be declared, depending on 
     the selected random number generator).</li>
<li> Function <b>initialState(..)</b> is used to initialize the state of the random number generator
     by providing Integer seeds and calling the random number generator often enough that
     statistically relevant random numbers are returned by every call of function random(..).</li>
<li> Function <b>random(..)</b> is used to return a random number of type Real in the range 
     0.0 &lt; random &le; 1.0 for every call.
     Furthermore, the updated (internal) state of the random number generator is returned as well.
    </li>
</ul>

<p>
A modeler can use a replaceable Generator package in his model, in order to easily select the desired
random number generator from the parameter menu.
</p>

<p>
The Generators package contains the <b>xorshift</b> suite of random number generators
from Sebastiano Vigna (from 2014; based on work of George Marsaglia).
The properties of these random
number generators are summarized below and compared with the often used
Mersenne Twister (MT19937-64) generator. The table is based on
<a href=\"http://xorshift.di.unimi.it/\">http://xorshift.di.unimi.it/</a> and on the
articles:
</p>
<blockquote>
<p>
Sebastiano Vigna: 
<a href=\"http://vigna.di.unimi.it/ftp/papers/xorshift.pdf\">An experimental exploration of Marsaglia's xorshift generators, scrambled</a>, 2014.<br>
Sebastiano Vigna: 
<a href=\"http://vigna.di.unimi.it/ftp/papers/xorshiftplus.pdf\">Further scramblings of Marsaglia's xorshift generators</a>, 2014.<br>
</p>
</blockquote>

<p>
Summary of the properties of the random number generators:
</p>

<p>

</p>

<blockquote>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Property</th>
    <th>xorshift64*</th>
    <th>xorshift128+</th>
    <th>xorshift1024*</th>
    <th>MT19937-64</th></tr>

<tr><td>Period</td>
    <td>2^64</td>
    <td>2^128</td>
    <td>2^1024</td>
    <td>2^19937</td></tr>

<tr><td>Length of state (# 32 bit integer)</td>
    <td>2</td>
    <td>4</td>
    <td>33</td>
    <td>624</td></tr>

<tr><td>Statistic failures (Big Crush)</td>
    <td>363</td>
    <td>64</td>
    <td>51</td>
    <td>516</td></tr>

<tr><td>Systematic failures (Big Crush)</td>
    <td>yes</td>
    <td>no</td>
    <td>no</td>
    <td>yes</td></tr>

<tr><td>Worst case startup</td>
    <td> &gt; 1 call       </td>
    <td> &gt; 20 calls     </td>
    <td> &gt; 100 calls    </td>
    <td> &gt; 100000 calls </td></tr>

<tr><td>Run time (MT=1.0)</td>
    <td> 0.39 </td>
    <td> 0.27 </td>
    <td> 0.33 </td>
    <td> 1.0  </td></tr>
</table>
</p>
</blockquote>

<p>
Further explanations of the properties above:
</p>

<ul>
<li> The <b>period</b> defines the number of random numbers generated
     before the sequence begins to repeat itself. According to
     \"<a href=\"http://xorshift.di.unimi.it/\">A long period does not imply high quality</a>\"
     a period of 2^1024 is by far large enough for even massively parallel simulations
     with huge number of random number computations per simulation.
     A period of 2^128 might be not enough for massively parallel simulations. 
     </li>

<li> <b>Length of state (# 32 bit integer)</b> defines the number of \"int\" (that is Modelica Integer) elements
     used for the internal state vector.</li>

<li> <b>Big Crush</b> is part of <a href=\"http://simul.iro.umontreal.ca/testu01/tu01.html\">TestU01</a>
     a huge framework for testing random number generators.
     According to these tests, the statistical properties of the xorshift random number
     generators are better as the Mersenne Twister random number generator.</li>
     
<li> <b>Worst case startup</b> means how many calls are needed until getting
     from a bad seed to random numbers with appropriate statistical properties.
     Here, the xorshift random number suite has much better properties
     as the Mersenne Twister. When initializing a random number generator, the above property
     is taken into account and appropriate random numbers are generated, so that a subsequent
     call of random(..) will generate statistically relevant random numbers, even if the user
     provides a bad initial seed (such as localSeed=1). This means, any Integer number can be given as
     initial seed without influencing the quality of the generated random numbers.</li>

<li> <b>Run time</b> shows that the xorshift random number generators are
     all much faster as the Mersenne Twister random number generator, although
     this is not really relevant for most simulations, because the execution
     time of the other parts of the simulations is usually much larger. </li>
</ul>

<p>
The xorshift random number generators are used in the following way in the
<a href=\"Modelica_Noise.Blocks.Noise\">Blocks.Noise</a> package:
</p>
<ol>
<li> Xorshift64start (xorshift64*) is used to generate the initial internal state vectors of the
     other generators from two Integer values, due
     to the very good startup properties.</li>

<li> Xorshit128plus (xorshift128+) is the default random number generator
     used by the blocks in <a href=\"Modelica_Noise.Blocks.Noise\">Blocks.Noise</a>.
     Since these blocks hold the internal state vector for every block instance, and the
     internal state vector is copied whenever a new random number is drawn, it is important
     that the internal state vector is short (and still has good statistical properties
     as shown in the table above).</li>

<li> Xorshit12024star (xorshift1024*) is the basis of the impure function
     <a href=\"Modelica_Noise.Math.Random.Utilities.impureRandom\">Math.Random.Utilities.impureRandom</a>
     which in turn is used with
     <a href=\"modelica://Modelica_Noise.Blocks.Noise.GlobalSeed.random\">Blocks.Noise.GlobalSeed.random</a>.
     The internal state vector is not exposed. It is updated internally, whenever a new random number
     is drawn.</li> 
</ol>

<p>
Note, the generators produce 64 bit random numbers.
These numbers are mapped to the 52 bit mantissa of double numbers in the range 0.0 .. 1.0.
</p>
</html>", revisions="<html>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td valign=\"top\"> Feb. 18, 2015 </td>
    <td valign=\"top\"> 

<table border=0>
<tr><td valign=\"top\">
         <img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Noise/dlr_logo.png\">
</td><td valign=\"bottom\"> 
         Initial version implemented by
         A. Klouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
         <a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a>
</td></tr></table>
</td></tr>

</table>
</p>
</html>"));
end Generators;
