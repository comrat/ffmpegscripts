#!/bin/bash
if ! ffmpeg -version &> /dev/null; then
	echo "Error: FFmpeg is required but not installed or not in PATH." >&2
	exit 1
fi

OUTPUT_FILE="output.mp3"

if [[ $# < 1 ]]; then
	echo "Provide video path to get the audio using -i"
	exit 1
fi

INPUT_FILE=$1
if [[ $# > 1 ]]; then
	OUTPUT_FILE=$2
fi

ffmpeg -i "$INPUT_FILE" -c:v copy -c:a libmp3lame -q:a 4 "$OUTPUT_FILE"
