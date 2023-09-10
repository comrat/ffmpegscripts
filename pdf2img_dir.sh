#! /bin/bash

if [[ $# < 1 ]]; then
	echo "Provide two parameters: input directory"
	exit 2
fi

INPUT_DIR=$1

for i in $INPUT_DIR/*;
    do name=`echo $i | cut -d'.' -f1`;
        FILENAME=$(basename "$i")
        convert -density 150 "$i" -quality 90 "$FILENAME.jpg"
    done
