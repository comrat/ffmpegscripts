#!/bin/bash
if ! ffmpeg -version &> /dev/null; then
	echo "Error: FFmpeg is required but not installed or not in PATH." >&2
	exit 1
fi

INPUT_FILE=$1
OUTPUT_FILE="output.png"
SECONDS=10

if [[ $# > 1 ]]; then
	SECONDS=$2
fi

ffmpeg -i "$INPUT_FILE" -ss 00:00:00 -vframes 1 "$OUTPUT_FILE"
