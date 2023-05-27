#!/bin/bash
#
# script by bl44ck, licenced under MIT
#
# This script features NO input validation or error conditions

#define global variables
input_array=()
print_array=()
popularity_array=("Python" "JavaScript" "Java" "C++" "C#" "PHP" "Swift" "TypeScript" "Ruby" "Go" "Kotlin" "Rust" "MATLAB" "R" "Perl") #you can define your own popularity here

#definition of the sorting functions
sort_array_pop() {
	#go through every item in the popularity array
	for item in "${popularity_array[@]}"; do
		#check every input against the popularity array
		for element in "${input_array[@]}"; do
			if [[ $element = $item ]]; then
				print_array+=("$element")
				break 1
		fi
		done
	done
}

sort_array_abc() {
print_array=($(echo "${input_array[@]}" | tr ' ' '\n' | sort)) #the "tr" puts a new line char "\n" inplace of the spaces from the array
}

#definition of the main routine
main() {
	echo "Wie viele Programmiersprachen möchtest du testen:"
	read num_test

	for ((i=1; i<=$num_test; i++))
	do
		echo "Programmiersprache $i eingeben"
		read input_lang
		input_array+=("$input_lang")
	done

	echo "Du hast $num_test Sprachen eingegeben"
	echo "Wie möchtest du sortieren? (abc oder pop)"
	read sorting

	if [[ $sorting = "abc" ]]; then
		sort_array_abc
	elif [[ $sorting = "pop" ]]; then
		sort_array_pop
	fi
	
	echo "Programmiersprachen in sortierter Ausgabe:"
	for lang in "${print_array[@]}"
	do
		echo "$lang"
	done

	echo "Möchtest du von vorne beginnen oder das Programm schliessen (restart oder exit)"
	read restart_input
	if [[ $restart_input = "restart" ]]; then
		input_array=() #setback arrays for a restart
		print_array=()
		main
	elif [[ $restart_input = "exit" ]]; then
		echo "Danke für die Benutzung des Programmiersprachensortierers 3000" && sleep 1 && exit
	fi
}

echo "Willkommen beim Programmiersprachensortierer 3000"
echo "Für die Beendung des Programmes CTRL+C drücken"
main
