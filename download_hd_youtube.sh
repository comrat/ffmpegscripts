#!/bin/bash

LOCAL_VIDEO="input.mp4"
LOCAL_AUDIO="input.mp3"
OUTPUT_FILE="output.mp4"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-i|--input)
	INPUT_YT_LINK="$2"
	shift
	shift
	;;
	-o|--output)
	OUTPUT_FILE="$2"
	shift
	shift
	;;
	-p|--proxy)
	PROXY_URL="$2"
	shift
	shift
	;;
	*)
	POSITIONAL+=("$1")
	shift
	;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [ -z ${INPUT_YT_LINK+x} ]; then
	echo "Provide the youtube video URL using the -i flag"
	exit 2
fi


if [ -z ${PROXY_URL+x} ]; then
	yt-dlp -f 136 $INPUT_YT_LINK -o $LOCAL_VIDEO
	yt-dlp -f 140 $INPUT_YT_LINK -o $LOCAL_AUDIO
else
	yt-dlp -f 136 $INPUT_YT_LINK -o $LOCAL_VIDEO --proxy $PROXY_URL
	yt-dlp -f 140 $INPUT_YT_LINK -o $LOCAL_AUDIO --proxy $PROXY_URL
fi

ffmpeg -i $LOCAL_AUDIO -c:v copy -c:a libmp3lame -q:a 4 "$OUTPUT_FILE"
ffmpeg -i $LOCAL_AUDIO -i $LOCAL_VIDEO -c:v copy -c:a aac "$OUTPUT_FILE"

rm $LOCAL_AUDIO
rm $LOCAL_VIDEO
