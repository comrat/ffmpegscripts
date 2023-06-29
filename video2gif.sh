#! /bin/bash

INPUT_FILE=$1
OUTPUT_FILE="output.gif"
FRAMES=5
TIME_DELAY=10

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
    -t|--time)
    TIME_DELAY="$2"
    shift # past argument
    shift # past value
    ;;
    -f|--frames)
    FRAMES="$2"
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

mkdir frames
ffmpeg -i "$INPUT_FILE" -vf scale=320:-1:flags=lanczos,fps=$FRAMES frames/ffout%03d.png
# convert -loop 0 frames/ffout*.png "$OUTPUT_FILE"
convert -delay $TIME_DELAY frames/ffout*.png $OUTPUT_FILE
rm -rf frames
