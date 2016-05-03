AdvancedNoise
=====

This library is an extension of the basic noise generation contained in [Modelica_Noise](https://github.com/DLR-SR/Noise).

In addition to the standard random number generation contained in Modelica_Noise, this library provides:
- an event-free noise generator using DIRCS Immediate Random with Continuous Seed,
- additional distributions and statistics tools,
- smooth interpolation methods for noise sources,
- frequency shaping according to given power spectral densities.

Potential applications of the library are
- correct modeling of sensor noise
- unsampled stochastic excitations such as as rail roughness or turbulence
- ...

## Current releases
### MSL 3.2.2
Coming soon
### MSL 3.2.1
[Noise 0.9.1 (2016-05-03)](https://github.com/DLR-SR/AdvancedNoise/archive/v0.9.1.zip):
 This version is the last version to correctly work with MSL 3.2.1

## Modelica Library Award

[Version 0.9.0](https://github.com/DLR-SR/AdvancedNoise/archive/v0.9.0.zip) of this library won the second price of the [Modelica Library Award](https://github.com/DLR-SR/AdvancedNoise/blob/master/AdvancedNoise%200.9.0/Resources/Images/General/ModelicaAward.png) on 22 September 2015. We thank all our supporters for contributing to this success! We also congratulate the first price winner, the Modelica [Chemical](https://github.com/MarekMatejak/Chemical) library!

## License

This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](https://modelica.org/licenses/ModelicaLicense2).


Copyright (C) 2015, **DLR** German Aerospace Center

## Development and contribution

The library is developed and maintained by the **DLR** German Aerospace Center:

 - Andreas Klöckner
 - Franciscus van der Linden
 - Dirk Zimmer
 - Martin Otter

You may report any issues by using the [Issues](../../issues) button.

Contributions in the form of [Pull Requests](../../pulls) are always welcome.
