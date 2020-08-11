function morseVector = detectClick(logicalVector)
% function morseVector = detectClick(logicalVector)
% Purpose: count number of consecutive like values in the logical vector. 
%           store sum of these values in one index of a vector or matrix. 
%           when the value changes (like from 0 to 1 or 1 to 0), start 
%           saving the number of like consecutive terms of that value in 
%           the next index of the vector
% Arguments: logical vector of sounds or no sounds
% Return value: vector of numbers. A lone 0 represents the silence between 
%               a dash or a dot within a morse letter. Two consecutive 0's 
%               represent the silence between two letters. Three
%               consecutive 0's represent a space between two words.
%               Numbers smaller than 7 are considered dots, numbers greater
%               than or equal to 7 are considered dashes.
%
% Date: 5/8/16
% By: Victor Dinh

currentVal = 2; % arbitrary value (can't be 0 or 1)
charIndex = 1; % index of morseVector 
morseVector = 0; % some arbitrary value to declare morseVector outside loop
% morseVector cannot be preallocated because its length is unknown

for k = 1:length(logicalVector)-1
    if logicalVector(k) ~= currentVal
        lb = k;
        currentVal = logicalVector(k);
    end
    if logicalVector(k+1) ~= currentVal
        ub = k;
        if currentVal == 0
            if ub - lb > 100 % considered a space between words
                morseVector(charIndex) = 0;
                morseVector(charIndex+1) = 0;
                morseVector(charIndex+2) = 0;
                charIndex = charIndex + 3;
            elseif (ub - lb < 100) && (ub - lb > 25) % space b/w letters
                morseVector(charIndex) = 0;
                morseVector(charIndex+1) = 0;
                charIndex = charIndex + 2;
            else % space between sounds
                morseVector(charIndex) = 0; 
                charIndex = charIndex + 1;
            end
        end
        if currentVal == 1 
            morseVector(charIndex) = ub-lb; % sound
            charIndex = charIndex + 1;
        end
    end
end

return