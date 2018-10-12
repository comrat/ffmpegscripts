#! /bin/bash

if [[ $# < 2 ]]; then
	echo "Provide two parameters: input image and output "
	exit 2
fi

INPUT_IMG=$1
OUTPUT_VIDEO=$2
DURATION=30

if [[ $# > 1 ]]; then
	DURATION=$3
fi

ffmpeg -loop 1 -i "$INPUT_IMG" -c:v libx264 -t $DURATION -pix_fmt yuv420p "$OUTPUT_VIDEO"
