#! /bin/bash

OUTPUT_FILE="output.mp4"

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
	*)
	POSITIONAL+=("$1")
	shift
	;;
esac
done
set -- "${POSITIONAL[@]}"


ffmpeg -i "$INPUT_FILE" -vf "transpose=1" "$OUTPUT_FILE"
