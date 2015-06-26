Modelica_Noise
=====

Modelica library for generating stochastic signals to be included in the Modelica Standard Library. 

This library contains standard models for generating random numbers in Modelica. It is intended to include this set of models in the [Modelica Standard Library (MSL)](https://github.com/modelica/Modelica). More advanced noise features building on this library can be found in the [AdvancedNoise](https://github.com/DLR-SR/AdvancedNoise) library.

The library contains the following elements:
- a standard sampled noise source using the xorshift random number generator suite
- some commonly used probability distributions
- some statistical analysis blocks

Main features of the elements provided are:
- statistical quality of the random numbers by using the xorshift suite
- reproducability of the random sequences by providing a global and a local seed
- versatility by replaceable probability distributions for the generated noise
- mathematically correct statistical properties by using standard procedures only

Potential applications of the provided elements are:
- correctly modeling sensor noise by using the provided distributions
- stochastic excitations such as turbulence by filtering band-limited white noise
- any other application by providing easy-to-use basic functions.

## Current MSL evaluation

The master branch of this library is currently reviewed for inclusion in the MSL.

## Original release

The original version of this library was released after the Modelica conference in 2014:

Download  [Noise 0.2.0 (2014-06-13)](../../archive/v0.2.0.zip)

## License

This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](https://modelica.org/licenses/ModelicaLicense2).


Copyright (C) 2014, **DLR** German Aerospace Center

## Development and contribution


The library is developed by the **DLR** German Aerospace Center contributors:

 - Andreas Klöckner
 - Franciscus van der Linden
 - Dirk Zimmer
 - Martin Otter

You may report any issues with using the [Issues](../../issues) button.

Contributions in the form of [Pull Requests](../../pulls) are always welcome.
