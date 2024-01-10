#! /bin/bash

if [[ $# < 1 ]]; then
	echo "Provide at least one parameter: input file"
	exit 2
fi

INPUT_FILE=$1
# OUTPUT_FILE=$2

FILENAME=$(basename "$INPUT_FILE")

ffmpeg -i $INPUT_FILE -vcodec copy -an "na$FILENAME"
ffmpeg -i "na$FILENAME" -filter:v "setpts=PTS/60" "speed$FILENAME"
rm "na$FILENAME"
