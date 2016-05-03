within ;
package AdvancedNoise "A library with additional noise modules compatible to the Modelica standard library"
  extends Modelica.Icons.Package;

  annotation(preferredView="info",
             version =                        "1.0.0",
             versionDate =                    "2016-05-03",
             versionBuild =                   1,
             uses(Modelica(version="3.2.2")),
  Icon(graphics={            Line(
      points={{-84,0},{-54,0},{-54,40},{-24,40},{-24,-70},{6,-70},{6,80},{36,80},
            {36,-20},{66,-20},{66,60}})}),
  Documentation(revisions="",
   info="<html>
<p>This library contains components that can be used to efficiently generate noise which can be used in simulations. Examples of the these components are:</p>
<ul>
<li>Sample-free <a href=\"AdvancedNoise.Sources.TimeBasedNoise\">TimeBasedNoise</a> which allows for faster system simulations </li>
<li><a href=\"AdvancedNoise.Sources.SignalBasedNoise\">Signal-based noise</a> which allows a noise that is based on a system input. This signal-based noise can be for example as a source of road-irragularities.</li>
<li><a href=\"AdvancedNoise.Sources.ColoredSignalBasedNoise\">Colored noise</a></li>
</ul>
<p>The AdvancedNoise library is developed at the DLR Institute of System Dynamics and Control. </p>
<p>The autors of the library are: <span style=\"font-family: MS Shell Dlg 2;\">A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">Acknowledgments</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Many thanks goes to T. Beutlich for his help in cleaing up the library, M. Sjoelund for his help with OpenModelica tests and D. Winkler for his advice with the Noise C code.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2;\">Contributions welcome!</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This library is free software and maintained on GitHub. </span>You may report any issues with using the <a href=\"https://github.com/DLR-SR/AdvancedNoise/issues\">Issues</a> button. </p>
<p>Contributions in the form of <a href=\"https://github.com/DLR-SR/AdvancedNoise/pulls\">Pull Requests</a> are always welcome.</p>
<h4>Literature</h4>
<ol>
<li>Kl&ouml;ckner, A., Linden, F. L. J. van der, &AMP; Zimmer, D. (2014). Noise Generation for Continuous System Simulation. In <i>Proceedings of the 10th International Modelica Conference</i> (pp. 837&ndash;846). Lund, Sweden: Link&ouml;ping University Electronic Press, Link&ouml;pings universitet. <a href=\"http://doi.org/10.3384/ecp14096837\">doi:10.3384/ecp14096837</a></li>
<li>Linden, F. L. J. van der, Kl&ouml;ckner, A., &AMP; Zimmer, D. (2015). Effects of Event-Free Noise Signals on Continuous-Time Simulation Performance. <i>IFAC-PapersOnLine</i>, <i>48</i>(1), 280&ndash;285. <a href=\"http://doi.org/10.1016/j.ifacol.2015.05.039\">doi:10.1016/j.ifacol.2015.05.039</a></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">Kl&ouml;ckner, A., Knoblach, A. &AMP; Heckmann, A. (2015). How to Shape Noise Spectra for Continuous System Simulation. In Proceedings of the 11th International Modelica Conference (pp. 837&ndash;846). Versailles, France. In Press</span></li>
</ol>
<p><br><b><span style=\"font-family: MS Shell Dlg 2;\">Copyright</span></b> <b>&copy; DLR Institute of System Dynamics and Control</b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\"><img src=\"modelica://AdvancedNoise/Resources/Images/General/dlr_logo.png\"/> </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Initial version implemented by A. Kl&ouml;ckner, F. v.d. Linden, D. Zimmer, M. Otter.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\"><a href=\"http://www.dlr.de/rmc/sr/en\">DLR Institute of System Dynamics and Control</a> </span></p>
</html>"));
end AdvancedNoise;
