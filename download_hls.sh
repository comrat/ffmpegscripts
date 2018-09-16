#!/bin/bash

if [[ $# < 1 ]]; then
	echo "Provide HLS link to download"
	exit 1
fi

ffmpeg -i $1 -c copy -bsf:a aac_adtstoasc output.mp4
