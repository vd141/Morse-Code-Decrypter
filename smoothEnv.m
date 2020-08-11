function logicalVector = smoothEnv(timeIncrement,Fs,ySq)
% function logicVector = smoothEnv(timeIncrement,Fs,ySq)
% Purpose: Smoothes the squared data (thereby making a smaller vector of
%           data) and outputs logical vector of smoothed data
% Arguments: size of length to smooth, frequency of data, squared data
% Return value: logical vector 
% 
% Date: 5/8/16
% By: Victor Dinh

sampleIncrement = floor(timeIncrement*Fs); % length of sample for avg (in points)
lb = 1; % lower bound for segment to be averaged
ub = sampleIncrement; % upper bound for segment to be averaged

coeff = (1/(sampleIncrement)); % 1 divided by number of samples averaged

numAvg = floor(length(ySq)/sampleIncrement); % average of numbers in sample

filterAvg = zeros(1,numAvg); % preallocates memory for filtered avg vector

j = 1; % index of filterAvg vector
while ub < length(ySq) % stops averaging when ub gets bigger than data
% this is insignificant, however, becuase this only cuts off a very small
% split second of sound
    sum = 0; % sum of numbers in segment to be averaged
    for i = lb:ub % goes through segment to be averaged
        sum = sum + ySq(i); % adds up all numbers in segment
    end
    filterAvg(j) = coeff*sum; % finds average of numbers in segment
    j = j+1; % move to next index of filterAvg
    lb = ub; % lower bound updated
    ub = ub + sampleIncrement; % upper bound updated
end

ampThresh = 0.3; % amplitude threshhold
logicalVector = (filterAvg > ampThresh); % % returns logical vector of 
% values above ampThresh in the filterAvg vector

return