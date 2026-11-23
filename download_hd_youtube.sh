#!/bin/bash
if ! command -v ffmpeg &> /dev/null; then
	echo "Error: ffmpeg is required but not installed or not in PATH." >&2
	exit 1
fi

if ! command -v yt-dlp &> /dev/null; then
	echo "Error: yt-dlp is required but not installed or not in PATH." >&2
	exit 1
fi

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
set -- "${POSITIONAL[@]}"

if [ -z ${INPUT_YT_LINK+x} ]; then
	echo "Provide the youtube video URL using the -i flag"
	exit 2
fi

LOCAL_VIDEO="temp_video.mp4"
LOCAL_AUDIO="temp_audio.mp3"

if [ -z ${PROXY_URL+x} ]; then
	yt-dlp -f 136 "$INPUT_YT_LINK" -o "$LOCAL_VIDEO"
	yt-dlp -f 140 "$INPUT_YT_LINK" -o "$LOCAL_AUDIO"
else
	yt-dlp -f 136 "$INPUT_YT_LINK" -o "$LOCAL_VIDEO" --proxy "$PROXY_URL"
	yt-dlp -f 140 "$INPUT_YT_LINK" -o "$LOCAL_AUDIO" --proxy "$PROXY_URL"
fi

ffmpeg -i "$LOCAL_AUDIO" -i "$LOCAL_VIDEO" -c:v copy -c:a aac "${OUTPUT_FILE}"

rm "$LOCAL_AUDIO"
rm "$LOCAL_VIDEO"
