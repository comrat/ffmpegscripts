#! /bin/bash

if [[ $# < 1 ]]; then
	echo "Provide at least one parameter: input file"
	exit 2
fi

INPUT_FILE=$1

ffmpeg -i $INPUT_FILE  $filename%03d.jpg
