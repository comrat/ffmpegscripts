#! /bin/bash

if [[ $# < 2 ]]; then
	echo "Provide two parameters: input and output folder"
	exit 2
fi

INPUT_DIR=$1
OUTPUT_DIR=$2

if [[ ! -e $OUTPUT_DIR ]]; then
	mkdir $OUTPUT_DIR
elif [[ ! -d $OUTPUT_DIR ]]; then
	echo "$OUTPUT_DIR already exists but is not a directory" 1>&2
fi

for i in $INPUT_DIR/*;
	do name=`echo $i | cut -d'.' -f1`;
		FILENAME=$(basename "$i")
		ffmpeg -i "$i" -c:v libx264 -crf 23 -c:a aac -q:a 100 -f mp4 "$OUTPUT_DIR/$FILENAME"
	done

