within AdvancedNoise.Interpolators;
package FixedGridStepResponse "A filter using a tabulated step response on a fixed grid for efficiency reasons"
  extends TabulatedStepResponse;

protected
  constant Real leftVector[:] =  - kernel((-(-nPast:nFuture)-fill(1,nPast+nFuture+1))*suggestedSamplePeriod)
                                 + kernel((-(-nPast:nFuture)+fill(0,nPast+nFuture+1))*suggestedSamplePeriod)
  "Helper vector for convolution of left interval boundary";
  constant Real rightVector[:] = - kernel((-(-nPast:nFuture)-fill(0,nPast+nFuture+1))*suggestedSamplePeriod)
                                 + kernel((-(-nPast:nFuture)+fill(1,nPast+nFuture+1))*suggestedSamplePeriod)
  "Helper vector for convolution of right interval boundary";

public
  redeclare replaceable function interpolate
  "Interpolates the buffer using a kernel on a pre-tabulated fixed grid"
    extends Utilities.Interfaces.interpolate;
protected
    Real leftValue "The value to the left of the current interval";
    Real rightValue "The value to the right of the current interval";
  algorithm
    // Assert correct sample period
    assert(abs(samplePeriod-suggestedSamplePeriod)/suggestedSamplePeriod < 0.001,
           "You need to use the suggestedSamplePeriod with the FixedGridStepResponse interpolator!");

    // Ensure that offset is in assumed range
    assert(offset >= nPast and offset < nBuffer - nFuture,
           "offset out of range (offset=" + String(offset) + ", nBuffer="+String(nBuffer)+")");

    // Calculate the interval boundaries
    leftValue  := leftVector  * buffer[ (-nPast:nFuture) + fill(integer(offset)+1, nPast+nFuture+1)];
    rightValue := rightVector * buffer[ (-nPast:nFuture) + fill(integer(offset)+1, nPast+nFuture+1)];

    // Calculate the actual value
    y := leftValue + mod(offset, 1) * (rightValue-leftValue);
    annotation(derivative(order=1) = der_interpolate, Inline=true);
  end interpolate;


  redeclare replaceable function der_interpolate
  "Interpolates the buffer using a kernel on a pre-tabulated fixed grid"
    input Real buffer[:] "Buffer of random numbers";
    input Real offset "Offset from buffer start (0..size(buffer)-1";
    input Real samplePeriod = 1 "The sample period of the noise buffer";
    input Real der_buffer[size(buffer,1)] "Derivatives of buffer values";
    input Real der_offset "Derivative of offset value";
    input Real der_samplePeriod = 1 "The sample period of the noise buffer";
    output Real der_y "Interpolated value at position offset";
protected
    Real leftValue "The value to the left of the current interval";
    Real rightValue "The value to the right of the current interval";
  algorithm

    // Calculate the interval boundaries
    leftValue  := leftVector  * buffer[ (-nPast:nFuture) + fill(integer(offset)+1, nPast+nFuture+1)];
    rightValue := rightVector * buffer[ (-nPast:nFuture) + fill(integer(offset)+1, nPast+nFuture+1)];

    // Calculate the actual value (neglect der(buffer) => der(leftValue)=0 and der(rightValue)=0)
    // y := leftValue + mod(offset, 1) * (rightValue-leftValue);
    der_y := der_offset * (rightValue-leftValue);

  end der_interpolate;

end FixedGridStepResponse;
