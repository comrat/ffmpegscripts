#! /bin/bash

if [[ $# < 3 ]]; then
	echo "Provide three parameters: input file, start time adn end time"
	exit 2
fi

INPUT_FILE=$1
START_TIME=$2
END_TIME=$3

ffmpeg -i $INPUT_FILE -vcodec copy -acodec copy -ss $START_TIME -t $END_TIME output.mp4
