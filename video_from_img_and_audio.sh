#! /bin/bash


POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

OUTPUT_FILE="output.mp4"
INPUT_IMG="input.png"
INPUT_AUDIO="input.mp3"

case $key in
    -o|--output)
    OUTPUT_FILE="$2"
    shift # past argument
    shift # past value
    ;;
    -a|--audio)
    INPUT_AUDIO="$2"
    shift # past argument
    shift # past value
    ;;
    -i|--img)
    INPUT_IMG="$2"
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

ffmpeg -loop 1 -i $INPUT_IMG -i $INPUT_AUDIO -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest $OUTPUT_FILE

