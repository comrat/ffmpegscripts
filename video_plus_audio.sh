#! /bin/bash

OUTPUT_FILE="output.mp4"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -v|--video)
    INPUT_VIDEO="$2"
    shift
    shift
    ;;
    -a|--audio)
    INPUT_AUDIO="$2"
    shift
    shift
    ;;
    -o|--output)
    OUTPUT_FILE="$2"
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

if [ -z ${INPUT_VIDEO+x} ]; then
	echo "Provide the input video file using the -v flag"
	exit 2
fi

if [ -z ${INPUT_AUDIO+x} ]; then
	echo "Provide the input audio file using the -a flag"
	exit 2
fi

ffmpeg -i $INPUT_VIDEO -i $INPUT_AUDIO -c:v copy -c:a aac -strict experimental ${OUTPUT_FILE}
