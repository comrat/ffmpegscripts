#/bin/bash

OUTPUT_FILE=output.mp4
WIDTH=640
HEIGHT=480

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-i|--input)
	INPUT_FILE="$2"
	shift
	shift
	;;
	-o|--output)
	OUTPUT_FILE="$2"
	shift
	shift
	;;
	-w|--width)
	WIDTH="$2"
	shift
	shift
	;;
	-h|--height)
	HEIGHT="$2"
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

SIZE=$WIDTH
SIZE+="x"
SIZE+=$HEIGHT

ffmpeg -f oss -i /dev/dsp -f video4linux2 -s $SIZE -i /dev/video0 $OUTPUT_FILE
