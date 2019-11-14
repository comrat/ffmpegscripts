#! /bin/bash

if [[ $# < 2 ]]; then
	echo "Provide two parameters: input and output folder"
	exit 2
fi

INPUT_DIR=$1
OUTPUT_DIR=$2
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

if [[ ! -e $OUTPUT_DIR ]]; then
	mkdir $OUTPUT_DIR
elif [[ ! -d $OUTPUT_DIR ]]; then
	echo "$OUTPUT_DIR already exists but is not a directory" 1>&2
fi

for i in $INPUT_DIR/*;
    do name=`echo $i | cut -d'.' -f1`;
        FILENAME=$(basename "$i")
        SIZE=$WIDTH
        SIZE+="x"
        SIZE+=$HEIGHT
        ffmpeg -i "$i" -c:v libx264 -s $SIZE -acodec mp3 -f mp4 "$OUTPUT_DIR/$FILENAME"
    done
