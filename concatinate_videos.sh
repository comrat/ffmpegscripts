#! /bin/bash

if [[ $# < 1 ]]; then
	echo "Provide at least two parameters: input files"
	exit 2
fi

INPUT_FILE_1=$1
INPUT_FILE_2=$2
OUTPUT_FILE="output.mp4"

if [[ $# > 1 ]]; then
	OUTPUT_FILE=$3
fi

ffmpeg -i "concat:$INPUT_FILE_1|$INPUT_FILE_2" -c copy "$OUTPUT_FILE"
