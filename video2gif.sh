#!/bin/bash
if ! command -v ffmpeg &> /dev/null; then
	echo "Error: ffmpeg is required but not installed or not in PATH." >&2
	exit 1
fi

if ! command -v convert &> /dev/null; then
	echo "Error: convert (ImageMagick) is required but not installed or not in PATH." >&2
	exit 1
fi

OUTPUT_FILE="output.gif"
FRAMES=5
TIME_DELAY=10

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
	-t|--time)
	TIME_DELAY="$2"
	shift
	shift
	;;
	-f|--frames)
	FRAMES="$2"
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
	echo "Provide the input file using the -i flag"
	exit 2
fi

TEMP_DIR="./output/frames_tmp"
mkdir -p "$TEMP_DIR"

ffmpeg -i "$INPUT_FILE" -vf scale=320:-1:flags=lanczos,fps=$FRAMES "$TEMP_DIR/ffout%03d.png"
convert -delay $TIME_DELAY "$TEMP_DIR"/ffout*.png "$OUTPUT_FILE"
rm -rf "$TEMP_DIR"
