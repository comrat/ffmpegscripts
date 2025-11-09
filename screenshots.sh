#!/bin/bash

OUTPUT_DIR="output"
SECONDS=10

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-i|--input)
	INPUT_FILE=$1
	shift
	shift
	;;
	-o|--output)
	OUTPUT_DIR="$2"
	shift
	shift
	;;
	-s|--seconds)
	SECONDS="$2"
	shift
	shift
	;;
	*)    # unknown option
	POSITIONAL+=("$1") # save it in an array for later
	shift # past argument
	;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [ -z ${INPUT_DIR+x} ]; then
	echo "Provide the input video file with -i flag"
	exit 2
fi

if [[ ! -e $OUTPUT_DIR ]]; then
	mkdir $OUTPUT_DIR
elif [[ ! -d $OUTPUT_DIR ]]; then
	echo "$OUTPUT_DIR already exists but is not a directory" 1>&2
fi

ffmpeg -i $INPUT_FILE -vf fps=1/$SECONDS "$OUTPUT_DIR/%d.png"
