function [decrypted,dotsAndDash] = morseDecrypt(filename)
% function [text,dotsAndDash] = morseDecrypt(filename)
% Purpose: decodes a morse code sound file into readable text and dots and
%           dashes. Saves readable text.
% Arguments: mp3 file of morse code sound
% Return value: decrypted text (string) and dots and dashes (cell array of
%               strings)
% 
% Date: 5/8/16
% By: Victor Dinh

% reads in audio file and returns data and frequency
[y,Fs] = audioread(filename);

% squared value is better than absolute value because it can better isolate
% the higher values from the lower values. 
ySq = y.^2;

% data for filter calculations. This is smoothed envelope
timeIncrement = 0.02; % length of sample to be smoothed (in seconds)
% returns logical vector where 1 indicates sound and 0 indicates silence
logicalVector = smoothEnv(timeIncrement,Fs,ySq);

% THE NUMBER OF CONSECUTIVE NUMBERS DEPENDS ON SAMPLE INCREMENT

% returns vector of numbers representing dots, dashes, or spaces. A lone 0
% represents the silence between a dash or a dot within a morse letter. Two
% consecutive 0's represent the silence between two letters. Three
% consecutive 0's represent a space between two words.
% Numbers smaller than 7 are considered dots, numbers greater than or equal
% to 7 are considered dashes.
morseVector = detectClick(logicalVector);

% returns cell array of morse words and spaces. Each cell contains either a
% morse word in which the letters are separated by spaces or a space
% symbolizing the space in between words
dotsAndDash = cellMorse(morseVector);

% returns string of decrypted message 
decrypted = alphaConvert(dotsAndDash);

% save readable text into text file
fid = fopen('decrypted.txt','w+');
fprintf(fid,decrypted);
fclose(fid);

return