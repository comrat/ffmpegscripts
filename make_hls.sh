#! /bin/bash

if [[ $# < 1 ]]; then
	echo "Provide at least one parameter: input file"
	exit 2
fi

WIDTH="1280"
HEIGHT="720"
SECONDS="10"

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
	-s|--seconds)
	SECONDS="$2"
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

SIZE=$WIDTH
SIZE+="x"
SIZE+=$HEIGHT

ffmpeg -i f$INPUT_FILE -profile:v baseline -level 3.0 -s $SIZE -start_number 0 -hls_time $SECONDS -hls_list_size 0 -f hls index.m3u8
