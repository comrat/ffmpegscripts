#! /bin/bash

for i in ./*;
	do name=`echo $i | cut -d'.' -f1`;
		echo $i;
		ffmpeg -i "$i" -s 1280x720 -acodec mp3 "${i}_1.mp4"
	done
