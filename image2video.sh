#! /bin/bash

OUTPUT_FILE="output.mp4"
DURATION=30

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
	-d|--duration)
	DURATION="$2"
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

ffmpeg -loop 1 -i "$INPUT_FILE" -c:v libx264 -t $DURATION -pix_fmt yuv420p "$OUTPUT_FILE"
