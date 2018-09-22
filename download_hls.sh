#!/bin/bash

if [[ $# < 1 ]]; then
	echo "Provide HLS link to download"
	exit 1
fi

OUTPUT="output.mp4"

if [[ $# > 1 ]]; then
	OUTPUT=$2
fi

ffmpeg -i $1 -c copy -bsf:a aac_adtstoasc $OUTPUT
