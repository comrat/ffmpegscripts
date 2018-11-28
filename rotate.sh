#! /bin/bash

if [[ $# < 1 ]]; then
	echo "Provide at least one parameter: input file"
	exit 2
fi

INPUT_FILE=$1
OUTPUT_FILE="output.mp4"

if [[ $# > 1 ]]; then
	OUTPUT_FILE=$2
fi

ffmpeg -i "$INPUT_FILE" -vf "transpose=1" "$OUTPUT_FILE"
