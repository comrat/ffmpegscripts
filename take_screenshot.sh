#!/bin/bash

if [[ $# < 1 ]]; then
	echo "Provide input file"
	exit 1
fi

INPUT_FILE=$1
OUTPUT_FILE="output.png"
SECONDS=10

if [[ $# > 1 ]]; then
	SECONDS=$2
fi

if [[ $# > 2 ]]; then
	OUTPUT_DIR=$3
fi

ffmpeg -i $INPUT_FILE -ss 00:00:00 -vframes 1 $OUTPUT_FILE
