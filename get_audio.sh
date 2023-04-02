#!/bin/bash

if [[ $# < 1 ]]; then
	echo "Provide video path to get the audio"
	exit 1
fi

INPUT="input.mp4"
OUTPUT="output.mp3"

if [[ $# > 0 ]]; then
	INPUT=$1
fi

if [[ $# > 1 ]]; then
	OUTPUT=$2
fi

ffmpeg -i "$INPUT" -c:v copy -c:a libmp3lame -q:a 4 "$OUTPUT"
