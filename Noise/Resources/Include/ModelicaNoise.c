/* External functions for Modelica Noise library

   Copyright (C) 2014, Modelica Association and DLR.
*/

#ifndef MODELICANOISE_H
#define MODELICANOISE_H

/* Define to 1 if <stdint.h> header file is available */
#if defined(_WIN32)
#if defined(_MSC_VER) && _MSC_VER >= 1600
#define NOISE_HAVE_STDINT_H 1
#elif defined(__WATCOMC__)
#define NOISE_HAVE_STDINT_H 1
#else
#undef NOISE_HAVE_STDINT_H
#endif
#else
#define NOISE_HAVE_STDINT_H 1
#endif

#if NOISE_HAVE_STDINT_H
#include <stdint.h>
#else
#define uint32_t unsigned int
#endif

#include <limits.h>
#include <math.h>

#define NOISE_LCG_MULTIPLIER (134775813)

/* NOISE_SeedReal */
/* Converts a Real variable to an Integer seed */
void NOISE_SeedReal(int local_seed, int global_seed, double real_seed, int n, int* states)
{
    double x0;
    uint32_t* xp;
    uint32_t x1;
    uint32_t x2;
    int i;

    /* Take the square root in order to remove sampling effects */
    x0 = sqrt(real_seed);
    /* Point a 32 bit integer to the double number */
    xp = (uint32_t*)&x0;
    /* Interpret the first 32 bits as an integer */
    x1 = *xp;
    x2 = *xp;
    /* Advance the pointer to point to the second half of the double */
    xp++;
    /* Bit-wise XOR this information into the second integer */
    x2 ^= *xp;

    /* Use the seeds to bit-wise XOR them to the two integers */
    x1 ^= (uint32_t)local_seed;
    x2 ^= (uint32_t)global_seed;

    /* Fill the states vector */
    for (i = 0; i < n; i++) {
        states[i] = (i%2 == 0) ? x1 : x2;
    }
}

/* NOISE_shuffleDouble */
/* This is the basic implementation of the DIRCS random number generator */
double NOISE_shuffleDouble(double x, int seed)
{
    double x0;
    uint32_t* xp;
    uint32_t x1;
    uint32_t x2;
    double vmax;
    double y;

    /* Take the square root in order to remove sampling effects */
    x0 = sqrt(x);
    /* Point a 32 bit integer to the double number */
    xp = (uint32_t*)&x0;
    /* Interpret the first 32 bits as an integer */
    x1 = *xp;
    x2 = *xp;
    /* Advance the pointer to point to the second half of the double */
    xp++;
    /* Bit-wise XOR this information into the second integer */
    x2 ^= *xp;
    x2 ^= (uint32_t)seed;

    /* Do single steps */
    x1 = x1*NOISE_LCG_MULTIPLIER + 1;
    x2 = x2*NOISE_LCG_MULTIPLIER + 1;

    /* Do combined steps! */
    x2 = x1*NOISE_LCG_MULTIPLIER + x2*NOISE_LCG_MULTIPLIER + 1;

    /* Divide the integer by its maximum value */
    vmax = UINT_MAX;
    y = x2 / vmax;

    return y;
}

/* NOISE_combineSeedLCG */
/* This is used to combine two seeds */
int NOISE_combineSeedLCG(int x1, int x2)
{
    int ret;
    ret = x1*NOISE_LCG_MULTIPLIER + x2*NOISE_LCG_MULTIPLIER + 1;
    ret = (((ret < 0) ? ((ret % INT_MAX) + INT_MAX) : ret) % INT_MAX);
    return ret;
}

#endif
