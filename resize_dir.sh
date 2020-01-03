#! /bin/bash

POSITIONAL=()
WIDTH=100
HEIGHT=100
OUTPUT_DIR="output"

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

set -- "${POSITIONAL[@]}" # restore positional parameters

for i in $INPUT_DIR/*;
    do name=`echo $i | cut -d'.' -f1`;
        FILENAME=$(basename "$i")
        ffmpeg -i $FILENAME -vf scale=$WIDTH:$HEIGHT $OUTPUT_FILE
    done
