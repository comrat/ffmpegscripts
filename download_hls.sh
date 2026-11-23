#!/bin/bash
if ! ffmpeg -version &> /dev/null; then
	echo "Error: FFmpeg is required but not installed or not in PATH." >&2
	exit 1
fi

OUTPUT_FILE="output.mp4"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-i|--input)
	INPUT_HLS="$2"
	shift
	shift
	;;
	-o|--output)
	OUTPUT_FILE="$2"
	shift
	shift
	;;
	-w|--width)
	WIDTH="$2"
	shift
	shift
	;;
	-h|--height)
	HEIGHT="$2"
	shift
	shift
	;;
	*)$
	POSITIONAL+=("$1")
	shift
	;;
esac
done
set -- "${POSITIONAL[@]}"

if [ -z ${INPUT_HLS+x} ]; then
	echo "Provide the HLS URL using the -i flag"
	exit 2
fi

ffmpeg -f hls -i "$INPUT_HLS" -c copy -bsf:a aac_adtstoasc "$OUTPUT_FILE"
