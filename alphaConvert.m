function text = alphaConvert(dotsAndDash)
% function text = alphaConvert(dotsAndDash)
% Purpose: converts a cell array of morse code into letters, words,
%           numbers, and symbols using searchDicts. 
% Arguments: cell array containing morse code and spaces
% Return values: string containing entire decoded morse code phrase
%
% Date: 5/8/16
% By: Victor Dinh

text = '';
for i = 1:length(dotsAndDash)
    if strcmp(dotsAndDash{i},' ')
        text = [text ' ']; % add a space (space between words)
        continue
    end
    lb = 1;
    for j = 1:length(dotsAndDash{i})
        if j ~= length(dotsAndDash{i}) % if not at the end of the cell
            if (j+1 > length(dotsAndDash{i})) || ...
                    (strcmp(dotsAndDash{i}(j+1),' '))
                ub = j;
                string = dotsAndDash{i}(lb:ub); % identify letter
                alpha = searchDict(string); % search letter
                text = [text alpha]; % add word to string
            end
        elseif j == length(dotsAndDash{i}) % if at the end of the cell
            ub = j;
            string = dotsAndDash{i}(lb:ub); % identify letter
            alpha = searchDict(string); % search letter
            text = [text alpha]; % add word to string
        end
        if strcmp(dotsAndDash{i}(j),' ') % if encounter space b/w letters
            lb = j+1; % make next spot the lower bound of a letter
        end
    end
end


return