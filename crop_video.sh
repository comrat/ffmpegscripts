#! /bin/bash

POSITIONAL=()
X=100
Y=100

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
        *)    # unknown option
        POSITIONAL+=("$1") # save it in an array for later
        shift # past argument
        ;;
    esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

ffmpeg -i $INPUT_FILE -filter:v "crop=in_w-$X:in_h-$Y:$X:$Y" $OUTPUT_FILE
