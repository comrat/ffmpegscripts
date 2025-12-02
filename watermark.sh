#! /bin/bash

OUTPUT_FILE="output.mp4"
WATERMARK="watermark.png"

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
	-w|--watermark)
	WATERMARK="$2"
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

ffmpeg -i $INPUT_FILE -i $WATERMARK -filter_complex "overlay=main_w-overlay_w-20:10" $OUTPUT_FILE
