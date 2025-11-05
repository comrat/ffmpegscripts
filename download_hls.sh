#!/bin/bash

OUTPUT_FILE="output.mp4"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-i|--input)
	INPUT_HLS="$2"
	shift # past argument
	shift # past value
	;;
	-o|--output)
	OUTPUT_FILE="$2"
	shift # past argument
	shift # past value
	;;
	-w|--width)
	WIDTH="$2"
	shift # past argument
	shift # past value
	;;
	-h|--height)
	HEIGHT="$2"
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

if [ -z ${INPUT_HLS+x} ]; then
	echo "Provide the HLS URL using the -i flag"
	exit 2
fi

ffmpeg -f hls -i $INPUT_HLS -c copy -bsf:a aac_adtstoasc $OUTPUT_FILE
