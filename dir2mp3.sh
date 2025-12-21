#!/bin/bash

OUTPUT_FILE="output.mp3"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
	-i|--input)
	INPUT_DIR="$2"
	shift # past argument
	shift # past value
	;;
	-o|--output)
	OUTPUT_FILE="$2"
	shift # past argument
	shift # past value
	;;
	*)    # unknown option
	POSITIONAL+=("$1") # save it in an array for later
	shift # past argument
	;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters


if [ -z "$INPUT_DIR" ]; then
  echo "Enter input dir -i"
  exit 1
fi

TMPFILE=$(mktemp).txt

for i in $INPUT_DIR/*;
	do name=`echo $i | cut -d'.' -f1`;
		FILENAME=$(basename "$i")
		echo "file '$INPUT_DIR/$FILENAME'" | cat >> $TMPFILE
	done
cat $TMPFILE

ffmpeg -f concat -safe 0 -i "$TMPFILE" -c:a libmp3lame -q:a 2 "$OUTPUT_FILE"

rm "$TMPFILE"
