Topic: ES-2 Final Project 'readme' file
Author: Victor Dinh
Date: 5/8/16

OVERVIEW:
The files in this directory are used to convert morse code sound into visible 
dashes and dots which are converted to readable text.

HOW TO USE:
To begin, open the simpleGUI.m file, run, and choose a 7.5wpm morse code mp3 
file. There is no need to search through the folder for mp3 files as the 
GUI will only show mp3 files. The computer will automatically begin decrypting 
once the file as been selected.

FUNCTIONS AND THEIR USES:
1) morseDecrypt
	- This is the main function responsible for calling all the other 
	  functions. It has one input: an mp3 sound file. It first converts the
	  read-in file to a vector of sound data (amplitude) and the data's 
	  frequency. Next, it squares the elements of the vector of sound data
	  so that the higher and lower values are more separated, thus making 
	  it easier for the computer to differentiate sound from silence. The
	  squared data, frequency, and a programmer-determined time increment
	  are then fed into the smoothEnv function, which outputs a logical
	  vector of a much shorter size than the input vector. This makes it
	  easier for the computer to decrypt the sound since there is less data
	  to deal with. The logical vector is then inputted into the 
	  detectClick function, which outputs a vector of the lengths of the
	  sounds and silences. This vector is then fed into the cellMorse
	  function, which outputs actual morse code. Finally, this morse code
	  is fed into the alphaConvert function, which outputs the decrypted
	  message as a string. The morseDecrypt function then saves this string
	  into a text file.

2) smoothEnv
	- This function takes in 3 arguments: the squared data, frequency, and
	  programmer-determined time increment. It uses these inputs to
	  calculate the average value of the squared data over the given time
	  increment. The average value over the segment of data is then saved
	  into a vector containing all the average values of each segment.
	  Naturally, the program moves onto consecutive segments of data, finds
	  the average, and then saves the result to the next index in the 
	  average value vector. The loop is written so that less than 0.02s of
	  the end of the sound clip is cut off. This is negligible, however,
	  because the final 0.02 seconds or less of sound will not matter.
	  Finally, the function compares each of the values of the filtered 
	  average vector to a programmer-determined amplitude threshold and
	  outputs the resulting logical vector. The 1's in this vector indicate
	  sound, while the 0's indicate silence. The more consecutive 1's there
	  are, the longer the sound is. Likewise for consecutive 0's, except 
	  that they represent silence.

3) detectClick
	- This function takes in the logical vector. It will count how many
	  consecutive 1's or 0's there are and put these values into a vector.
	  For example, say of the first twenty data points, the first 11 are
	  1's and the rest are 0's. The function will save the number 11 into 
	  the first index of a vector, call it morseVector. Depending on the 
	  number of consecutive 0's in the logical vector, the function will 
	  save one, two, or three 0's in consecutive indexes in the morseVector.
	  A lone zero stands for the silence between each dot or dash inside a 
	  morse letter. For example, the sounds of the letter J in morse, 
	  '.---', have brief silences between each dot and dash. These would be
	  saved as lone zeros. Two consecutive zeros in the morseVector would 
	  indicate the silence between two morse letters of the same word. And
	  finally, three consecutive zeros in the morseVector would indicate 
	  a space between each morse word. The morseVector is outputted from
	  this file at the end of the function.

4) cellMorse
	- This function takes in the morseVector from the last function.
	  cellMorse simply converts the data from the morseVector into dots and
	  dashes, which are saved into cells of a cell array. Each cell array 
	  contains a morse word or a space. The letters of the morse words
	  inside a cell are separated by a space. Cells containing only spaces
	  indicate spaces between morse words. To save the morseVector into the
	  cell array, called dotsAndDash, a loop runs through the morseVector.
	  Any number greater than or equal to 7 is counted as a dash. A number
	  less than 7 but not including 0 is counted as a dot. These dots and 
	  dashes are added on to each other so that they make up a string of
	  dots and dashes. When the loop encounters two consecutive 0's, it 
	  will add a space to the string of dots and dashes. If it encounters
	  three consecutive 0's, it will end the current string, save it into a
	  cell, move onto the next cell in the array, save a space to that 
	  cell, and then move on to the next cell to begin saving a string of
	  dots and dashes to that cell. Once the loop is finished running 
	  through the entire morseVector, the resulting cell array
	  (dotsAndDash) is outputted.

5) alphaConvert
	- This function takes in the dotsAndDash cell array and combs through
	  each cell. For each segment of dots and dashes separated by a space
	  inside a single cell, it will call the alphaConvert function to 
	  determine the alpha character of that segment. It saves the output of
	  alphaConvert to a string called 'text', which will be the string 
	  containing the entire decrypted message. Once alphaConvert has
	  finished with a cell, it will move onto the next cell. If the cell
	  contains only a space, alphaConvert will add a space to the text
	  string. It will then move on to the next cell and repeat the cycle
	  until all cells have been searched.

6) searchDict
	- This function takes an inputted morse code letter and decrypts it
	  into an alpha-numeric character. It does this by searching through a
	  list of if and else-if statements. Each if or else-if checks the 
	  input to see if it matches with a corresponding letter, number, or 
	  symbol. If no character is matched, then the function simply outputs 
	  an empty character. This is so that if searchDict cannot find the
	  matching character, nothing is added to the text string from the
	  previous function.

7) simpleGUI
	- This function (which contains several functions) contains only one
	  programmer-modified function, namely the pushbutton2_Callback
	  function. This is because the GUI has only one button. This button,
	  when pressed, is responsible for opening the File Selector window,
	  in which the user chooses an mp3 morse file. Once the user selects a 
	  file, the simpleGUI function prints the name of the file to the 
	  dialog box, calls the morseDecrypt function, and outputs the text and
	  morse code strings to their own separate windows.

-- This concludes all documentation. --