#    Copyright (c) 2016 Coates
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


BEGIN { print "Chords2Tab, v1.0.0 - Copyright (c) 2016 Coates\n" }

/Strings/ {	#Find the number of strings
	strings = $2
	next
}

/Chord/ {
	printf "Tuning: "
	for( j = 2; j < strings + 2; j++) {	#Work out the tuning from the file
		tuning[j] = $j
		printf $j " "
	}
	printf "\n"	#Space it nicely
	next
}

{
	printf "\nChord: " $1 "\n"	#Write out chord name

	split($0, a, "\t")

	m = 6			#Find max of frets
	for( f = 2; f <= NF; f++) if($f > m && $f != "x") m = $f
	m++

	for( k = strings + 1; k > 1; k-- ) {
		printString(tuning[k], $k, m)
	}	
}

function printString(stringLetter, fretNum, maxNum) {
	if(fretNum == "x") { printf "x  " } 
	else { printf stringLetter "  " }
	for( i = 0; i <= m; i++ ) {
		if( i == fretNum ) {
			printf fretNum
		} else if ( i == 0 ) {
			printf "|"
		} else {
			printf "-"
		}
	
		if( i == maxNum ) {
			printf "\n"
		}
	}
}

END {
	printf "\nThese chords were formatted by 'Chords2Tab'. Enjoy :)"
}

function append(A, B) {
	A[alen(A) + 1] = B
}

function alen(a) {
	for(i in a) k++
	return k
}