#/bin/bash

OUTPUT_FILE=out.mp4

if [[ $# > 0 ]]; then
	OUTPUT_FILE=$1
fi

ffmpeg -f oss -i /dev/dsp -f video4linux2 -s 640x480 -i /dev/video0 $OUTPUT_FILE
