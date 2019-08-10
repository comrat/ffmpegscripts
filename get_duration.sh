#! /bin/bash

if [[ $# < 1 ]]; then
	echo "Provide at least one parameter: input file"
	exit 2
fi

INPUT_FILE=$1

if [[ $# > 1 ]]; then
	OUTPUT_FILE=$2
fi

if [[ $# > 2 ]]; then
	WATERMARK=$3
fi

ffprobe -i $INPUT_FILE -show_format -v quiet | sed -n 's/duration=//p' | cat
