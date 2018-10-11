#! /bin/bash

if [[ $# < 2 ]]; then
	echo "Provide two parameters: input image and output "
	exit 2
fi

INPUT_IMG=$1
OUTPUT_VIDEO=$2

ffmpeg -loop 1 -i "$INPUT_IMG" -c:v libx264 -t 25 -pix_fmt yuv420p "$OUTPUT_VIDEO"
