// This C-file is provided with the Modelica Noise library
// It contains a few functions, which can only be implented in C
#ifndef NOISECLIB
#define NOISECLIB


#define VOID void
typedef char CHAR;
typedef short SHORT;
typedef long LONG;
typedef unsigned char    u_char;
typedef unsigned short   u_short;
typedef unsigned int     u_int;
typedef unsigned __int32 u_int32;
typedef unsigned long    u_long;
typedef unsigned __int64 u_int64;
#include <stdio.h>
#include <limits.h>
#include  "ModelicaUtilities.h"  
#include <windows.h> 
#include <math.h> 


// NOISE_SeedReal
// Converts a Real variable to an Integer seed
void NOISE_SeedReal(int local_seed, int global_seed, double real_seed, int n, int* states)
{
  double   x0;
  u_int32* xp;
  u_int32  x1;
  u_int32  x2;
  int      i;
  
  // Take the square root in order to remove sampling effects
  x0 = sqrt(real_seed);
  // Point a 32 bit integer to the double number
  xp = (u_int32*)&x0;
  // Interpret the first 32 bits as an integer
  x1 = *xp;
  x2 = *xp;
  // Advance the pointer to point to the second half of the double
  xp++;
  // Bit-wise XOR this information into the second integer
  x2 ^= *xp;
  
  // Use the seeds to bit-wier XOR them to the two integers
  x1 ^= (u_int32)local_seed;
  x2 ^= (u_int32)global_seed;
  
  // Fill the states vector
  for (i = 0; i < n; i++){
    states[i] = (i%2 == 0) ? x1 : x2;
  }
}


// NOISE_shuffleDouble
// This is the basic implementation of the DIRCS random number generator
double NOISE_shuffleDouble(double x, u_int32 seed)
{
  double   x0;
  u_int32* xp;
  u_int32  x1;
  u_int32  x2;
  u_int32  xt;
  double   vmax;
  double   y;

  // Take the square root in order to remove sampling effects
  x0 = sqrt(x);
  // Point a 32 bit integer to the double number
  xp = (u_int32*)&x0;
  // Interpret the first 32 bits as an integer
  x1 = *xp;
  x2 = *xp;
  // Advance the pointer to point to the second half of the double
  xp++;
  // Bit-wise XOR this information into the second integer
  x2 ^= *xp;
  x2 ^= seed;
  
  // Do single steps
  x1 = x1*134775813 + 1;
  x2 = x2*134775813 + 1;
  
  // Do combined steps!
  xt = x2; x2 = x1*134775813 + x2*134775813 + 1; x1 = x2;
  
  // Divide the integer by its maximum value
  vmax =  UINT_MAX;
  y = x2 / vmax; 

  return y;
}


// NOISE_combineSeedLCG
// This is used to combine two seeds
int NOISE_combineSeedLCG(int x1, int x2) 
{
  int ret;
  ret = x1*134775813 + x2*134775813 + 1;
  ret = (((ret < 0) ? ((ret % INT_MAX) + INT_MAX) : ret) % INT_MAX);
  return ret;
}

// This is the end of the Modelica Noise C-file
#endif