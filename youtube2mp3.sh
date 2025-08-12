#!/bin/bash

if [[ $# < 1 ]]; then
	echo "Provide YouTube link to download"
	exit 1
fi

INPUT="input.m4a"
OUTPUT="output.mp3"

if [[ $# > 1 ]]; then
	OUTPUT=$2
fi

yt-dlp -f 140 $1 -o $INPUT
ffmpeg -i $INPUT -c:v copy -c:a libmp3lame -q:a 4 "$OUTPUT"
rm $INPUT
