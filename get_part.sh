#!/bin/bash
if ! ffmpeg -version &> /dev/null; then
	echo "Error: FFmpeg is required but not installed or not in PATH." >&2
	exit 1
fi

OUTPUT_FILE="output.mp4"
START_TIME="00:00:00"
DURATION_TIME="30"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-i|--input)
	INPUT_FILE="$2"
	shift
	shift
	;;
	-o|--output)
	OUTPUT_FILE="$2"
	shift
	shift
	;;
	-s|--start-time)
	START_TIME="$2"
	shift
	shift
	;;
	-d|--duration)
	DURATION_TIME="$2"
	shift
	shift
	;;
	*)
	POSITIONAL+=("$1")
	shift
	;;
esac
done
set -- "${POSITIONAL[@]}"

if [ -z ${INPUT_FILE+x} ]; then
	echo "Provide the input video file using the -i flag"
	exit 2
fi

ffmpeg -i "$INPUT_FILE" -ss $START_TIME -t $DURATION_TIME "$OUTPUT_FILE"
