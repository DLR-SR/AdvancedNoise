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
{  /* Compute an unsigned int hash code from a character string
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

    unsigned int hash = 0xAAAAAAAA;
    unsigned int i    = 0;
    unsigned int len  = strlen(str);
    
    union hash_tag{
       unsigned int iu;
       int          is;
    } h;
   
    for(i = 0; i < len; str++, i++)
    {
       hash ^= ((i & 1) == 0) ? (  (hash <<  7) ^  (*str) * (hash >> 3)) :
                                (~((hash << 11) + ((*str) ^ (hash >> 5))));
    }

    h.iu = hash;
    return h.is;
}

/* xorshift algorithms */

/* For details see http://xorshift.di.unimi.it/

   Written in 2014 by Sebastiano Vigna (vigna@acm.org)

   To the extent possible under law, the author has dedicated all copyright
   and related and neighboring rights to this software to the public domain
   worldwide. This software is distributed without any warranty.

   See <http://creativecommons.org/publicdomain/zero/1.0/>.
   
   Adapted by Martin Otter and Andreas Klöckner for use with Modelica:
   - Inputs and outputs must be int's, that is int32_t.
   - Inputs are casted accordingly. 
   - Outputs are casted accordingly.
   - The additional double between 0 and 1 is output.
*/
   
/* transform 64-bit unsigned integer to double such that zero cannot appear, by
   first transforming to a 64-bit signed integer, then to a double in the range 0 .. 1.
   (using the algorithm given here: http://www.doornik.com/research/randomdouble.pdf) */
#define NOISE_INVM64 5.42101086242752217004e-20 /* = 2^(-64) */
#define NOISE_RAND(INT64) ( (int64_t)(INT64) * NOISE_INVM64 + 0.5 )


MODELICA_EXPORT void NOISE_xorshift64star(int state_in[], int state_out[], double* y) {
    /*  xorshift64* random number generator.
        For details see http://xorshift.di.unimi.it/

        Written in 2014 by Sebastiano Vigna (vigna@acm.org)

        To the extent possible under law, the author has dedicated all copyright
        and related and neighboring rights to this software to the public domain
        worldwide. This software is distributed without any warranty.

        See <http://creativecommons.org/publicdomain/zero/1.0/>.

        Adapted by Martin Otter and Andreas Klöckner (DLR) 
        for the Modelica external function interface.
    */

    /*  This is a good generator if you're short on memory, but otherwise we
        rather suggest to use a xorshift128+ (for maximum speed) or
        xorshift1024* (for speed and very long period) generator. */

    /* Convert inputs */
    union s_tag{
        int32_t  s32[2];
        uint64_t s64;
    } s;
    int i;
    uint64_t x;
    for (i=0; i<sizeof(s)/sizeof(uint32_t); i++){
        s.s32[i] = state_in[i];}
    x = s.s64;
      
    /* The actual algorithm */
    x ^= x >> 12; // a
    x ^= x << 25; // b
    x ^= x >> 27; // c
    x  = x * 2685821657736338717LL;
    
    /* Convert outputs */
    s.s64 = x;
    for (i=0; i<sizeof(s)/sizeof(uint32_t); i++){
        state_out[i] = s.s32[i];}
    *y = NOISE_RAND(x);
}



MODELICA_EXPORT void NOISE_xorshift128plus(int state_in[], int state_out[], double* y) {
    /*  xorshift128+ random number generator.
        For details see http://xorshift.di.unimi.it
        Arguments seed and newSeed must be int32_t vectors with at least 4 elements each.

        Written in 2014 by Sebastiano Vigna (vigna@acm.org)

        To the extent possible under law, the author has dedicated all copyright
        and related and neighboring rights to this software to the public domain
        worldwide. This software is distributed without any warranty.

        See <http://creativecommons.org/publicdomain/zero/1.0/>.

        Adapted by Martin Otter and Andreas Klöckner (DLR) 
        for the Modelica external function interface.
    */

    /*  This is the fastest generator passing BigCrush without systematic
        errors, but due to the relatively short period it is acceptable only
        for applications with a very mild amount of parallelism; otherwise, use
        a xorshift1024* generator. */

    /*  The state must be seeded so that it is not everywhere zero. If you have
        a 64-bit seed, we suggest to pass it twice through MurmurHash3's
        avalanching function. */

    /* Convert inputs */
    union s_tag{
        int32_t  s32[4];
        uint64_t s64[2];
    } s;
    int i;
    uint64_t s1;
    uint64_t s0;
    for (i=0; i<sizeof(s)/sizeof(uint32_t); i++){
        s.s32[i] = state_in[i];}
      
    /* The actual algorithm */
    s1       = s.s64[0];
    s0       = s.s64[1];
    s.s64[0] = s.s64[1];
    s1      ^= s1 << 23; // a
    s.s64[1] = ( s1 ^ s0 ^ ( s1 >> 17 ) ^ ( s0 >> 26 ) ) + s0; // b, c
    
    /* Convert outputs */
    for (i=0; i<sizeof(s)/sizeof(uint32_t); i++){
        state_out[i] = s.s32[i];}
    *y = NOISE_RAND(s.s64[1]);
}


MODELICA_EXPORT void NOISE_xorshift1024star_internal(uint64_t s[], int* p, double* y) {
    /*  xorshift1024* random number generator.
        For details see http://xorshift.di.unimi.it
        
        This internal function directly operates on a pointer to the state array, such that
        no copying of states is needed.
        
        Written in 2014 by Sebastiano Vigna (vigna@acm.org)
    
        To the extent possible under law, the author has dedicated all copyright
        and related and neighboring rights to this software to the public domain
        worldwide. This software is distributed without any warranty.

        See <http://creativecommons.org/publicdomain/zero/1.0/>.

        Adapted by Martin Otter and Andreas Klöckner (DLR) 
        for the Modelica external function interface.
    */

    /*  This is a fast, top-quality generator. If 1024 bits of state are too
        much, try a xorshift128+ or a xorshift64* generator. */

    /*  The state must be seeded so that it is not everywhere zero. If you have
        a 64-bit seed,  we suggest to seed a xorshift64* generator and use its
        output to fill s. */
        
        
    /* Convert inputs */
    uint64_t s0;
    uint64_t s1;
    *p = *p & 15;
    
    /* The actual algorithm */
    s0 = s[*p];
    s1 = s[*p = (*p + 1) & 15];
        
    s1 ^= s1 << 31; // a
    s1 ^= s1 >> 11; // b
    s0 ^= s0 >> 30; // c
    
    s[*p] = s0 ^ s1;
        
    /* Convert outputs */
    *y = NOISE_RAND(s[*p]*1181783497276652981LL);
}

MODELICA_EXPORT void NOISE_xorshift1024star(int state_in[], int state_out[], double* y) {
    /*  xorshift1024* random number generator.
        For details see http://xorshift.di.unimi.it
        
        This function uses NOISE_xorshift1024star_internal as generator and adapts inputs and outputs.

        Adapted by Martin Otter and Andreas Klöckner (DLR) 
        for the Modelica external function interface.
    */

    /*  This is a fast, top-quality generator. If 1024 bits of state are too
        much, try a xorshift128+ or a xorshift64* generator. */

    /*  The state must be seeded so that it is not everywhere zero. If you have
        a 64-bit seed,  we suggest to seed a xorshift64* generator and use its
        output to fill s. */
        
        
    /* Convert inputs */
    union s_tag{
        int32_t  s32[32];
        uint64_t s64[16];
    } s;
    int i;
    int p;
    for (i=0; i<sizeof(s)/sizeof(uint32_t); i++){
        s.s32[i] = state_in[i];}
    p = state_in[32];
    
    /* The actual algorithm */
    NOISE_xorshift1024star_internal(&(s.s64), &p, y);
        
    /* Convert outputs */
    for (i=0; i<sizeof(s)/sizeof(uint32_t); i++){
        state_out[i] = s.s32[i];}
    state_out[32] = p;
}



/* external seed algorithms */

/* these functions give access to an external random number state
   you should be very careful about using them... 
*/

/* Internal state of impure random number generator */
# define NOISE_SIZE 33
static uint64_t NOISE_s[ 16 ]; 
static int NOISE_p;
static int NOISE_id=0;

MODELICA_EXPORT void NOISE_setInternalState_xorshift1024star(int* state, size_t nState, int id){
    /* receives the external states from Modelica*/
    union s_tag{
      int32_t  s32[2];
      uint64_t s64;
    } s;
    int i;

    if ( nState > NOISE_SIZE ) ModelicaFormatError("External state vector is too large. Should be %d.",NOISE_SIZE);    
    for (i=0; i<16; i++){
       s.s32[0] = state[2*i];
       s.s32[1] = state[2*i+1];
       NOISE_s[i] = s.s64;
    }
    NOISE_p = state[32];
    NOISE_id = id;   
}

MODELICA_EXPORT double NOISE_impureRandom_xorshift1024star(int id) { 
    /* xorshift1024* random number generator (same as above, but with internal state, instead of external one).
       For details see http://xorshift.di.unimi.it
	  
	   Argument "id" is provided to guarantee the right calling sequence
	   of the function in a Modelica environment (first calling function
	   ModelicaRandom_initialize_xorshift1024star that must return "dummy" which is passed
	   as input argument to ModelicaRandom_xorshift1024star. As a result, the ordering
	   of the function is correct.

       This function uses NOISE_xorshift1024star_internal as generator and adapts inputs and outputs.
       
       Adapted by Martin Otter (DLR) to initialize the seed with ModelicaRandom_initializeRandom
	   and to return a double in range 0 < randomNumber < 1.0
    */

    /* This is a fast, top-quality generator. If 1024 bits of state are too
       much, try a xorshift128+ or a xorshift64* generator. */

    /* The state must be seeded so that it is not everywhere zero. If you have
       a 64-bit seed,  we suggest to seed a xorshift64* generator and use its
       output to fill s. */
   
    double y;
   
    /* Check that NOISE_initializeImpureRandome_xorshift1024star was called before */
    if ( id != NOISE_id ) ModelicaError("Function impureRandom not initialized with function initializeImpureRandom");
    
    /* Compute random number */
    NOISE_xorshift1024star_internal(&NOISE_s, &NOISE_p, &y);
    return y;
}
   



/* original algorithms */

MODELICA_EXPORT void NOISE_double2int(double d, int i[]) {
    /* casts a double to two integers */
    union d2i{
        double d;
        int    i[2];
    } u;
    
    u.d  = d;
    i[0] = u.i[0];
    i[1] = u.i[1];
}



#endif
