function character = searchDict(string)
% function character = searchDict(string)
% Purpose: Input morse string is compared to a dictionary containing all 26
%           letters, 10 digits, and several commonly found symbols.
% Arguments: morse code string
% Return values: alpha letter, number, or symbol in dictionary. If no 
%                   corresponding character is found for the morse string,
%                   function returns an empty character
% 
% Date: 5/8/16
% By: Victor Dinh

character = '';

if strcmp(string,'.-')
    character = 'A';
elseif strcmp(string,'-...')
    character = 'B';
elseif strcmp(string,'-.-.')
    character = 'C';
elseif strcmp(string,'-..')
    character = 'D';
elseif strcmp(string,'.')
    character = 'E';
elseif strcmp(string,'..-.')
    character = 'F';
elseif strcmp(string,'--.')
    character = 'G';
elseif strcmp(string,'....')
    character = 'H';
elseif strcmp(string,'..')
    character = 'I';
elseif strcmp(string,'.---')
    character = 'J';
elseif strcmp(string,'-.-')
    character = 'K';
elseif strcmp(string,'.-..')
    character = 'L';
elseif strcmp(string,'--')
    character = 'M';
elseif strcmp(string,'-.')
    character = 'N';
elseif strcmp(string,'---')
    character = 'O';
elseif strcmp(string,'.--.')
    character = 'P';
elseif strcmp(string,'--.-')
    character = 'Q';
elseif strcmp(string,'.-.')
    character = 'R';
elseif strcmp(string,'...')
    character = 'S';
elseif strcmp(string,'-')
    character = 'T';
elseif strcmp(string,'..-')
    character = 'U';
elseif strcmp(string,'...-')
    character = 'V';
elseif strcmp(string,'.--')
    character = 'W';
elseif strcmp(string,'-..-')
    character = 'X';
elseif strcmp(string,'-.--')
    character = 'Y';
elseif strcmp(string,'--..')
    character = 'Z';
elseif strcmp(string,'-----')
    character = '0';
elseif strcmp(string,'.----')
    character = '1';
elseif strcmp(string,'..---')
    character = '2';
elseif strcmp(string,'...--')
    character = '3';
elseif strcmp(string,'....-')
    character = '4';
elseif strcmp(string,'.....')
    character = '5';
elseif strcmp(string,'-....')
    character = '6';
elseif strcmp(string,'--...')
    character = '7';
elseif strcmp(string,'---..')
    character = '8';
elseif strcmp(string,'----.')
    character = '9';
elseif strcmp(string,'.-.-.-')
    character = '.';
elseif strcmp(string,'--..--')
    character = ',';
elseif strcmp(string,'---...')
    character = ':';
elseif strcmp(string,'..--..')
    character = '?';
elseif strcmp(string,'.----.')
    character = '''';
elseif strcmp(string,'-....-')
    character = '-';
elseif strcmp(string,'-..-.')
    character = '/';
elseif strcmp(string,'-.--.-')
    character = '()';
elseif strcmp(string,'.-..-.')
    character = '"';
elseif strcmp(string,'.--.-.')
    character = '@';
elseif strcmp(string,'-...-')
    character = '=';
elseif strcmp(string,'.-.-')
    character = '\n';
end

return