#! /bin/bash

srchstr () {
	echo "Starting the program $0 at $(date)"
	echo "Searching for $1 string in" 

	for file in $@; do
		if [ -f $file ]; then
			echo ...$file
			grep $1 $file > /dev/null 2> /dev/null
			if [ $? -eq 0 ]; then
				echo "Found $1 in $file!"
			else 
				echo "No $1 in $file!"
			fi

		fi
	done
}
