AdvancedNoise
=====

In addition to the standard random number generation contained in the Modelica standard library, this library provides:
- an event-free noise generator using DIRCS Immediate Random with Continuous Seed,
- additional distributions and statistics tools,
- smooth interpolation methods for noise sources,
- frequency shaping according to given power spectral densities.

Potential applications of the library are
- correct modeling of sensor noise
- unsampled stochastic excitations such as as rail roughness or turbulence
- ...

## Current releases
### If your tool supports MSL 3.2.2 or higher:
[Noise 1.0.0 (2016-05-03)](https://github.com/DLR-SR/AdvancedNoise/archive/v1.0.0.zip):
 Basic noise generation is already included in the MSL 3.2.2 and it is tested with a range of tools including Dymola and OpenModelica.
 This version of AdvancedNoise contains additional features, which are basically developed and tested with the Dymola tool only.
 Your pull requests with fixes for different tools are highly welcome!
 
### If your tool supports MSL 3.2.1 or lower:
[Noise 0.9.1 (2016-05-03)](https://github.com/DLR-SR/AdvancedNoise/archive/v0.9.1.zip):
 This version is the last version to correctly work with MSL 3.2.1.
 It contains a copy of the Modelica_Noise library as well as the additional features of the AdvancedNoise library.
 This version of AdvancedNoise is not maintained further.
 It is provided for legacy systems only.

## Modelica Library Award

[Version 0.9.0](https://github.com/DLR-SR/AdvancedNoise/archive/v0.9.0.zip) of this library won the second price of the [Modelica Library Award](https://github.com/DLR-SR/AdvancedNoise/tree/v1.0.0/AdvancedNoise%201.0.0/Resources/Images/General/ModelicaAward.png) on 22 September 2015. We thank all our supporters for contributing to this success! We also congratulate the first price winner, the Modelica [Chemical](https://github.com/MarekMatejak/Chemical) library!

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
