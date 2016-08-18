#!/bin/bash

function printSizeHumanReadable () {
	typeset -F 2 size
	size="$1"+0.00001 
	local extension
	extension=('B' 'K' 'M' 'G' 'T' 'P' 'E' 'Z' 'Y') 
	local index=1 
	if [[ -n $2 ]]
	then
		for idx in "${extension[@]}"
		do
			if [[ "$2" = "$idx" ]]
			then
				break
			fi
			index=$(( index + 1 )) 
		done
	fi
	while (( (size / 1024) > 0.1 ))
	do
		size=$(( size / 1024 )) 
		index=$(( index + 1 )) 
	done
	echo "$size${extension[$index]}"
}

printSizeHumanReadable "$@"
