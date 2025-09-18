#! /bin/bash

if [[ $# < 2 ]]; then
	echo "Provide at least two parameters: --input and --output"
	exit 2
fi

WIDTH=0
HEIGHT=0

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
	OUTPUT_DIR="$2"
	shift # past argument
	shift # past value
	;;
	-w|--width)
	WIDTH="$2"
	shift # past argument
	shift # past value
	;;
	-h|--height)
	HEIGHT="$2"
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

if [[ ! -e $OUTPUT_DIR ]]; then
	mkdir $OUTPUT_DIR
elif [[ ! -d $OUTPUT_DIR ]]; then
	echo "$OUTPUT_DIR already exists but is not a directory" 1>&2
fi

for i in $INPUT_DIR/*;
	do name=`echo $i | cut -d'.' -f1`;
		FILENAME=$(basename "$i")
		NAME_WITHOUT_EXT="${FILENAME%.*}"
		if [[ $WIDTH > 0 ]]; then
			SIZE=$WIDTH
			SIZE+="x"
			SIZE+=$HEIGHT
			ffmpeg -i "$i" -c:v libx264 -s $SIZE -acodec mp3 -f mp4 "$OUTPUT_DIR/$NAME_WITHOUT_EXT".mp4
		else
			ffmpeg -i "$i" -c:v libx264 -acodec mp3 -f mp4 "$OUTPUT_DIR/$NAME_WITHOUT_EXT".mp4
		fi
	done
