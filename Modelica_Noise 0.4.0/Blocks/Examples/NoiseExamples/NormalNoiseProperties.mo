within Modelica_Noise.Blocks.Examples.NoiseExamples;
model NormalNoiseProperties
  "Demonstrates the computation of properties for normally distributed noise"
  extends UniformNoiseProperties(mean = mu, var = sigma^2,
          noise(redeclare function distribution =
          Modelica_Noise.Math.Random.TruncatedQuantiles.normal (                                        mu=mu,sigma=sigma)));

  parameter Real y_min = 0;
  parameter Real y_max = 6;
  parameter Real sigma = 1;
  parameter Real mu =    3;

 annotation (experiment(StopTime=20, NumberOfIntervals=5000),
                                     Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
Documentation(info="<html>
<p>
Variance and standard deviation are only correctly computed for constant interpolation
(for linear and smooth interpolation there is an offset):
</p>
</html>"));
end NormalNoiseProperties;
