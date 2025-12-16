#! /bin/bash

X=0
Y=0
OUTPUT_FILE="output.mp4"

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
	-x|--x)
	X="$2"
	shift # past argument
	shift # past value
	;;
	-y|--y)
	Y="$2"
	shift # past argument
	shift # past value
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

ffmpeg -i $INPUT_FILE -filter:v "crop=in_w-$X:in_h-$Y:$X:$Y" $OUTPUT_FILE
