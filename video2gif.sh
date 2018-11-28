#! /bin/bash

if [[ $# < 1 ]]; then
	echo "Provide at least one parameter: input file"
	exit 2
fi

INPUT_FILE=$1
OUTPUT_FILE="output.gif"

if [[ $# > 1 ]]; then
	OUTPUT_FILE=$2
fi

mkdir frames
ffmpeg -i "$INPUT_FILE" -vf scale=320:-1:flags=lanczos,fps=10 frames/ffout%03d.png
convert -loop 0 frames/ffout*.png "$OUTPUT_FILE"
rm -rf frames
