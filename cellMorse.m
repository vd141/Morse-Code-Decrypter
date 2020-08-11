function dotsAndDash = cellMorse(morseVector)
% function dotsAndDash = cellMorse(morseVector)
% Purpose: saves morse code words and spaces into their respective cell
%           array indexes. Letters inside a word are seperated by one space
% Arguments: vector of dot and dash values obtained from data
% Return values: cell array with each entry containing a morse word or
%                   space
%
% Date: 5/8/16
% By: Victor Dinh

dotsAndDash = {''}; % initialize 1x1 cell array (cell length unknown)

j = 1; % cell array index
for i = 1:length(morseVector)
    if ((morseVector(i) == 0) && (morseVector(i+1) == 0) && ...
        (morseVector(i+2) == 0))
        j = j + 1;
        dotsAndDash{j} = ' '; % sets a cell element as a space
        j = j + 1;
        dotsAndDash{j} = ''; % initializes a cell element for concatenation
    elseif ((morseVector(i) == 0) && (morseVector(i+1) == 0) && ...
            (~strcmp(dotsAndDash{j},'')))
        dotsAndDash{j} = [dotsAndDash{j} ' ']; % space b/w letters
    end
    if (morseVector(i) < 7) && (morseVector(i) ~= 0)
        dotsAndDash{j} = [dotsAndDash{j} '.']; % dot
    elseif morseVector(i) >= 7
        dotsAndDash{j} = [dotsAndDash{j} '-']; % dash
    end
end

return