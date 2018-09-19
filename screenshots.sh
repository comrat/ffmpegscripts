#!/bin/bash

if [[ $# < 2 ]]; then
	echo "Provide two parameters: input file and seconds shift for screenshot"
	exit 2
fi

INPUT_FILE=$1
SECONDS=$2

ffmpeg -i $INPUT_FILE -vf fps=1/$SECONDS %d.png
