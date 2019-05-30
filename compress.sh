#! /bin/bash

if [[ $# < 1 ]]; then
	echo "Provide at least one parameter: input file"
	exit 2
fi

INPUT_FILE=$1
OUTPUT_FILE="output.mp4"

if [[ $# > 1 ]]; then
	OUTPUT_FILE=$2
fi

WIDTH="1280"
HEIGHT="720"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
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

echo "Size: $WIDTH x $HEIGHT"
ffmpeg -i $INPUT_FILE -c:v libx264 -s $WIDTHx$HEIGHT -acodec mp3 -f mp4 "$OUTPUT_DIR/$FILENAME"
