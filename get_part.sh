#! /bin/bash

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
    -e|--end-time)
    END_TIME="$2"
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

ffmpeg -i $INPUT_FILE -ss $START_TIME -t $END_TIME $OUTPUT_FILE
