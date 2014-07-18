/* External functions for Modelica Noise library

   Copyright (C) 2014, Modelica Association and DLR.
*/

#ifndef MODELICANOISE_H
#define MODELICANOISE_H

/* Define a MODELICA_EXPORT function prefix */
#if !defined(MODELICA_EXPORT)
#   define MODELICA_EXPORT
#endif

/* Define to 1 if <stdint.h> header file is available */
#if defined(_WIN32)
#   if defined(_MSC_VER) && _MSC_VER >= 1600
#       define NOISE_HAVE_STDINT_H 1
#   elif defined(__WATCOMC__)
#       define NOISE_HAVE_STDINT_H 1
#   else
#       undef NOISE_HAVE_STDINT_H
#   endif
#else
#   define NOISE_HAVE_STDINT_H 1
#endif

/* Include integer type header */
#if NOISE_HAVE_STDINT_H
#   include <stdint.h>
#else
#   define int32_t  int
#   define uint32_t unsigned int
#   define uint64_t unsigned long long
#endif

/* Include some math headers */
#include <limits.h>
#include <math.h>

/* Include some string headers */
#include <string.h>

/* Include Modelica utilities */
#include "ModelicaUtilities.h"

/* Low-level time and PID functions */
/* Some parts from: http://nadeausoftware.com/articles/2012/04/c_c_tip_how_measure_elapsed_real_time_benchmarking

   Get current time in (ms, sec, min, hour, day, mon, year)
   Get process id as int
*/

/* FOR MICROSOFT */
#if defined(_MSC_VER)
#   include <sys/types.h>
#   include <sys/timeb.h>
#   include <time.h>
#   include <process.h>
#   define NOISE_getpid _getpid
    static void NOISE_getTime(int* ms, int* sec, int* min, int* hour, int* mday, int* mon, int* year) {
        struct _timeb timebuffer;
        struct tm* tlocal;
        time_t calendarTime;
        int ms0;

        _ftime( &timebuffer );                 /* Retrieve ms time */
        time( &calendarTime );                 /* Retrieve sec time */
        tlocal   = localtime( &calendarTime ); /* Time fields in local time zone */
        ms0 = (int)(timebuffer.millitm);       /* Convert unsigned int to int */
        tlocal->tm_mon  = tlocal->tm_mon +1;   /* Correct for month starting at 1 */
        tlocal->tm_year = tlocal->tm_year+1900;/* Correct for 4-digit year */
       
        memcpy(ms,   &(ms0),                sizeof(int));
        memcpy(sec,  &(tlocal->tm_sec),     sizeof(int));
        memcpy(min,  &(tlocal->tm_min),     sizeof(int));
        memcpy(hour, &(tlocal->tm_hour),    sizeof(int));
        memcpy(mday, &(tlocal->tm_mday),    sizeof(int));
        memcpy(mon,  &(tlocal->tm_mon),     sizeof(int));
        memcpy(year, &(tlocal->tm_year),    sizeof(int));
    }

/* FOR OTHER COMPILERS */
#else
#   include <sys/time.h>
#   include <time.h>
#   include <unistd.h>
#   define NOISE_getpid getpid
    static void NOISE_getTime(int* ms, int* sec, int* min, int* hour, int* mday, int* mon, int* year) {
        struct timeval tm;
        int ms0;
       
        gettimeofday( &tm, NULL ); /* Retrieve current local time */
        ms0 = tm.tv_usec/1000;     /* Convert microseconds to milliseconds */

        memcpy(ms,   &(ms0),                sizeof(int));
        memcpy(sec,  &(tm.tv_sec.tm_sec),   sizeof(int));
        memcpy(min,  &(tm.tv_sec.tm_min),   sizeof(int));
        memcpy(hour, &(tm.tv_sec.tm_hour),  sizeof(int));
        memcpy(mday, &(tm.tv_sec.tm_mday),  sizeof(int));
        memcpy(mon,  &(tm.tv_sec.tm_mon),   sizeof(int));
        memcpy(year, &(tm.tv_sec.tm_year),  sizeof(int));
    }

#endif

static int NOISE_APHash(char* str)
{ /* Compute an unsigned int hash code from a character string
   *
   * Author: Arash Partow - 2002                                            *
   * URL: http://www.partow.net                                             *
   * URL: http://www.partow.net/programming/hashfunctions/index.html        *
   *                                                                        *
   * Copyright notice:                                                      *
   * Free use of the General Purpose Hash Function Algorithms Library is    *
   * permitted under the guidelines and in accordance with the most current *
   * version of the Common Public License.                                  *
   * http://www.opensource.org/licenses/cpl1.0.php                          */

   int hash = 0xAAAAAAAA;
   int i    = 0;
   int len  = strlen(str);

   for(i = 0; i < len; str++, i++)
   {
      hash ^= ((i & 1) == 0) ? (  (hash <<  7) ^  (*str) * (hash >> 3)) :
                               (~((hash << 11) + ((*str) ^ (hash >> 5))));
   }

   return hash;
}




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
