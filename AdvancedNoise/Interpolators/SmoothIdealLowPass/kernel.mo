within AdvancedNoise.Interpolators.SmoothIdealLowPass;
function kernel "Kernel for ideal low pass (sinc-function)"
  extends Modelica.Icons.Function;
  import Modelica.Math.Special.sinc;
  import Modelica.Constants.pi;
  input Real t "The (scaled) time for sampling period=1";
  input Modelica.Units.SI.Frequency f=1/2 "The cut-off frequency of the filter";
  output Real h "The impulse response of the convolution filter";
algorithm
  h := 2*f*sinc(2*pi*f*t);
  annotation(Inline=true, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><code>h = SmoothIdealLowPass.<strong>kernel</strong>(offset); </code></blockquote>
<h4>Description</h4>
<p>This function defines the kernel of the <a href=\"SmoothIdealLowPass\">SmoothIdealLowPass</a> interpolation. It uses the <a href=\"Math.Special.sinc\">sinc</a> function with a specified cut-off frequency.</p>
</html>",
        revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <th>Date</th>
    <th align=\"left\">Description</th>
  </tr>
  <tr>
    <td valign=\"top\"> Sep. 4, 2015 </td>
    <td valign=\"top\">
      <table border=\"0\">
        <tr>
          <td valign=\"top\">
            <img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\" alt=\"DLR logo\">
          </td>
          <td valign=\"bottom\">
            Initial version implemented by
            A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.<br>
            <a href=\"http://www.dlr.de/sr/en\">DLR Institute of System Dynamics and Control</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</html>"));
end kernel;
