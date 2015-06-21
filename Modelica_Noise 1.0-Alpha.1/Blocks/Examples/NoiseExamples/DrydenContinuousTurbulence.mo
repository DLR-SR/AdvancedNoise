within Modelica_Noise.Blocks.Examples.NoiseExamples;
model DrydenContinuousTurbulence
  "Demonstrates how to model wind turbulence for aircrafts with the BandLimitedWhiteNoise block (a simple model of vertical Dryden gust speed at low altitudes < 1000 ft)"
  extends Modelica.Icons.Example;
  import SI = Modelica.SIunits;
  import Modelica.Constants.pi;

  parameter SI.Velocity V =            140 * 0.5144
    "Airspeed of aircraft (typically 140kts during approach)";
  parameter SI.Velocity sigma = 0.1 *   30 * 0.5144
    "Turbulence intensity (=0.1 * wind at 20 ft, typically 30 kt)";
  parameter SI.Length   L =            600 * 0.3048
    "Scale length (= flight altitude)";

  Modelica.Blocks.Continuous.TransferFunction Hw(b=sigma*sqrt(L/pi/V)*{sqrt(3)*
        L/V,1}, a={L^2/V^2,2*L/V,1},
    initType=Modelica.Blocks.Types.Init.InitialState)
    "Transfer function of vertical turbulence speed according to MIL-F-8785C"
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  Noise.BandLimitedWhiteNoise whiteNoise(samplePeriod=0.005)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Math.Gain compareToSpeed(k=1/V)
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
equation
  connect(whiteNoise.y, Hw.u) annotation (Line(
      points={{-39,10},{-12,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Hw.y, compareToSpeed.u) annotation (Line(
      points={{11,10},{38,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (experiment(StopTime=100),
              Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Documentation(info="<html>
<p>
This example shows how to use the
<a href=\"modelica://Modelica_Noise.Blocks.Noise.BandLimitedWhiteNoise\">BandLimitedWhiteNoise</a>
to feed a Dryden continuous turbulence model. This model is used to describe turbulent wind at low altitudes
that varies randomly in space
(see also <a href=\"https://en.wikipedia.org/wiki/Continuous_gusts\">wikipedia</a>).
</p>

<h4>
Turbulence model for vertical gust speed at low altitudes
</h4>

<p>
The turbulence model is defined by the following filter:
</p>

<blockquote><p>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/equation-W0zl2Gay.png\" alt=\"H_w(s) = sigma*sqrt(L_w/(pi*V)) * ((1 + sqrt(3)*L_w/V*s) / (1+L_w/V*s)^2)\"/>.
</p></blockquote>

<p>
The filter is parametrized with the following parameters:
</p>

<ul>
<li> Lw is the turbulence scale. <br>In low altitudes, it is equal to the flight altitude.</li>
<li> sigma is the turbulence intensity. <br>In low altitudes, it is equal to 1/10 of the
     wind speed at 20 ft altitude, which is 30 kts for medium turbulence.</li>
<li> V is the airspeed of the aircraft.<br>It is approximately 150 kts during the approach (i.e. at low altitudes).</li>
</ul>

<h4>
The input to the filter
</h4>

<p>
The input to the filter is white noise with a standard normal distribution,
i.e. mean=0 and variance=1. However, in order to account for change of noise power 
due to sampling, the noise must be scaled with sqrt(samplePeriod).
</p>

<h4>Example output</h4>

<blockquote>
<p>
<img src=\"modelica://Modelica_Noise/Resources/Images/Blocks/Examples/NoiseExamples/DrydenContinuousTurbulence.png\"/>
</p></blockquote>

<h4>
Reference
</h4>

<ol>
<li>Original source: Dryden Wind Turbulence model in US military standard 
    <a href=\"http://everyspec.com/MIL-SPECS/MIL-SPECS-MIL-F/MIL-F-8785C_5295/\">MIL-F-8785</a>.</li>

<li>Dryden Wind Turbulence Model in the Matlab Aerospace blockset<br><a href=\"
http://de.mathworks.com/help/aeroblks/drydenwindturbulencemodelcontinuous.html\">http://de.mathworks.com/help/aeroblks/drydenwindturbulencemodelcontinuous.html</a></li>
</ol>
</html>"));
end DrydenContinuousTurbulence;
