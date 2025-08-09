#! /bin/bash

if [[ $# < 2 ]]; then
	echo "Provide two parameters: input image and output video"
	exit 2
fi

INPUT_IMG=$1
OUTPUT_VIDEO=$2
DURATION=30

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-d|--duration)
	DURATION="$2"
	shift # past argument
	shift # past value
	;;
	*)    # unknown option
	POSITIONAL+=("$1") # save it in an array for later
	shift # past argument
	;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters


echo $INPUT_IMG
echo $DURATION
echo $OUTPUT_VIDEO
ffmpeg -loop 1 -i "$INPUT_IMG" -c:v libx264 -t $DURATION -pix_fmt yuv420p "$OUTPUT_VIDEO"
