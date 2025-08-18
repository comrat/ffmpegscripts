#! /bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

OUTPUT_FILE="output.mp4"

case $key in
    -v|--video)
    INPUT_VIDEO="$2"
    shift # past argument
    shift # past value
    ;;
    -a|--audio)
    INPUT_AUDIO="$2"
    shift # past argument
    shift # past value
    ;;
    -o|--output)
    OUTPUT_FILE="$2"
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

ffmpeg -i $INPUT_VIDEO -i $INPUT_AUDIO -c:v copy -c:a aac $OUTPUT_FILE
