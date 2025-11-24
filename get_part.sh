#! /bin/bash

OUTPUT_FILE="output.mp4"
START_TIME="00:00:00"
DURATION_TIME="30"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -i|--input)
    INPUT_FILE="$2"
    shift # past argument
    shift # past value
    ;;
    -o|--output)
    OUTPUT_FILE="$2"
    shift # past argument
    shift # past value
    ;;
    -s|--start-time)
    START_TIME="$2"
    shift # past argument
    shift # past value
    ;;
    -d|--duration)
    DURATION_TIME="$2"
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

if [ -z ${INPUT_FILE+x} ]; then
	echo "Provide the input video file using the -i flag"
	exit 2
fi

ffmpeg -i $INPUT_FILE -ss $START_TIME -t $DURATION_TIME $OUTPUT_FILE
