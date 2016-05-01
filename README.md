# Chords2Tab
_Chords2Tab_ (C2T) is a simple awk program to convert the fret numbers of chords on stringed instrument to a tab/ascii art layout.

## How to run:
As an awk program, C2T is run as:

	`awk -f Chords2Tab.awk inputFile.tsv`

If you wish to save the output, it can be redirected to a file, as follows:

	`awk -f Chords2Tab.awk inputFile.tsv > outputFile.txt`

## Input format:
The input should be formated as a _'.tsv'_ (tab separated values) file, see 'ukeChords.tsv' for an example of this.
Within the _tsv_ file, the data **must** be spaced with tabs, and also should be formatted as follows:

##### Line one:
	Strings	<number of strings>
Line one should contain the word 'Strings' (capitalised), a tab, and then the number of strings in decimal form.

##### Line two:
	Chord	<closest string> <2nd closest string> ...
Line two contains the word 'Chord' followed by the notes of each string. The strings should be ordered from the closest to the furthest, if you were to lay your instrument flat before you. For example, on a guitar, line two would be 'Chord	E	A	D	G	B	e'. Obviously, all the notes are separated by a tab (hence _tsv_).
The word 'Chord' **must** be included, as this flags to the program that this line contains all the notes for the strings. Additionally, this word was chosen as it falls on the same column as the chord names - if a human came across a file like this, they would be able to easily work out roughly what it is for.

##### Lines three and onwards:
	<chord name> <fret on closest string> <fret on next string> ...
The remainder of the lines contain the actual data. The first column specifies the chord name, and the rest specify which frets should be held down. For example, for a C on a ukulele, the line would be 'C	0	0	0	3'.
A lowercase _'x'_ should be used when the string should not be used, and a _'0'_ denotes an open string.

## Possible warnings:
* The program may not function correctly with less than three strings.
* Program behaviour is undefined when line one or line two aren't in the correct places, or are redefined.
* Adding an extra column _may_ allow you to change the amount of fretting shown, if the extra column contains a higher number than those on the same row (_'C	0	0	0	3	8'_ on a four-stringed instrument may give you more frets on the ascii art than _'C 0 0 0 3'_), however this behaviour may not work as expected.

## License:
See the file _'LICENSE'_ in the root directory for the license.
