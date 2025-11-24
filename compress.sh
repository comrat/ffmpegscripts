#! /bin/bash

OUTPUT_FILE="output.mp4"
WIDTH=0
HEIGHT=0

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

if [[ $WIDTH > 0 ]]; then
	SIZE=$WIDTH
	SIZE+="x"
	SIZE+=$HEIGHT
	echo $SIZE
	ffmpeg -i $INPUT_FILE -r 30 -c:v libx264 -profile:v baseline -s $SIZE -acodec mp3 -f mp4 "$OUTPUT_FILE"
else
	ffmpeg -i $INPUT_FILE -r 30 -c:v libx264 -profile:v baseline -acodec mp3 -f mp4 "$OUTPUT_FILE"
fi
