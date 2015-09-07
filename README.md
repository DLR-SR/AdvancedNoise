AdvancedNoise
=====

This library is an extension of the basic noise generation contained in [Modelica_Noise](https://github.com/DLR-SR/Noise).

In addition to the standard random number generation contained in Modelica_Noise, this library provides:
- an event-free noise generator using DIRCS Immediate Random with Continuous Seed
- additional distributions and statistics tool
- smooth interpolation methods for noise sources
- frequency shaping according to given power spectral densities.

Potential applications of the library are
- correct modeling of sensor noise
- unsampled stochastic excitations such as as rail roughness or turbulence
- ...

## Current release

[Noise 1.0.0 (2015-09-07)](https://github.com/DLR-SR/AdvancedNoise/archive/v1.0.0.zip)

## License

This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](https://modelica.org/licenses/ModelicaLicense2).


Copyright (C) 2015, **DLR** German Aerospace Center

## Development and contribution

The library is developed and maintained developed by the **DLR** German Aerospace Center:

 - Andreas Klöckner
 - Franciscus van der Linden
 - Dirk Zimmer
 - Martin Otter

You may report any issues with using the [Issues](../../issues) button.

Contributions in the form of [Pull Requests](../../pulls) are always welcome.
