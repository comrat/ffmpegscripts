#! /bin/bash

POSITIONAL=()
WIDTH=100
HEIGHT=100

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

ffmpeg -i $INPUT_FILE -vf scale=$WIDTH:$HEIGHT $OUTPUT_FILE
