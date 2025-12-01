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
    shift
    shift
    ;;
    -o|--output)
    OUTPUT_FILE="$2"
    shift
    shift
    ;;
    -t|--time)
    TIME_DELAY="$2"
    shift
    shift
    ;;
    -f|--frames)
    FRAMES="$2"
    shift
    shift
    ;;
    *)
    POSITIONAL+=("$1")
    shift
    ;;
esac
done
set -- "${POSITIONAL[@]}"

mkdir frames_tmp
ffmpeg -i "$INPUT_FILE" -vf scale=320:-1:flags=lanczos,fps=$FRAMES frames_tmp/ffout%03d.png
convert -delay $TIME_DELAY frames_tmp/ffout*.png $OUTPUT_FILE
rm -rf frames_tmp
