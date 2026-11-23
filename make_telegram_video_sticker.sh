#!/bin/bash
if ! ffmpeg -version &> /dev/null; then
	echo "Error: FFmpeg is required but not installed or not in PATH." >&2
	exit 1
fi

if [[ $# < 1 ]]; then
	echo "Provide the input file"
	exit 2
fi

INPUT_FILE=$1
OUTPUT_FILE="output.webm"

if [[ $# > 1 ]]; then
	OUTPUT_FILE=$2
fi

ffmpeg -i "$INPUT_FILE" -framerate 30 -c:v libvpx-vp9 -an -vf scale=512:512 -pix_fmt yuva420p "$OUTPUT_FILE"
