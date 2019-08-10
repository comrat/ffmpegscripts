#! /bin/bash

if [[ $# < 1 ]]; then
	echo "Provide at least one parameter: input file"
	exit 2
fi

INPUT_FILE=$1
OUTPUT_FILE="output.mp4"
WATERMARK="watermark.png"

if [[ $# > 1 ]]; then
	OUTPUT_FILE=$2
fi

if [[ $# > 2 ]]; then
	WATERMARK=$3
fi

ffmpeg -i $INPUT_FILE -i $WATERMARK -filter_complex "overlay=main_w-overlay_w-20:10" $OUTPUT_FILE
