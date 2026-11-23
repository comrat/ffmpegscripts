#!/bin/bash
if ! ffmpeg -version &> /dev/null; then
	echo "Error: FFmpeg is required but not installed or not in PATH." >&2
	exit 1
fi

OUTPUT_FILE="output.mp3"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-i|--input)
	INPUT_DIR="$2"
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

if [ -z "$INPUT_DIR" ]; then
	echo "Enter input dir -i"
	exit 1
fi

TMPFILE=$(mktemp).txt

for i in "$INPUT_DIR"/*;
do name=`echo "$i" | cut -d'.' -f1`;
	FILENAME=$(basename "$i")
	echo "file '$INPUT_DIR/$FILENAME'" >> "$TMPFILE"
done

ffmpeg -f concat -safe 0 -i "$TMPFILE" -c:a libmp3lame -q:a 2 "$OUTPUT_FILE"

rm "$TMPFILE"
