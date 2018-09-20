#!/bin/bash

if [[ $# < 1 ]]; then
	echo "Provide input file"
	exit 1
fi

INPUT_FILE=$1
OUTPUT_DIR="."
SECONDS=10

if [[ $# > 1 ]]; then
	SECONDS=$2
fi

if [[ $# > 2 ]]; then
	OUTPUT_DIR=$3
fi

ffmpeg -i $INPUT_FILE -vf fps=1/$SECONDS "$OUTPUT_DIR/%d.png"
