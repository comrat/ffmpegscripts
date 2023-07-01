# ffmpeg scripts
ffmpeg scripts collection

## compress.sh
Compress video single video.
First argument for input file and for output file the second one.
Use `-w` and `-h` flags for width and height setting respectivly
```
./compress.sh input.mp4 output.mp4 -w 1280 -h 720
```

## compress_dir.sh
Compress all video from input folder file and save it in output folder.
First argument for input directory and for output directory the second one.
Use `-w` and `-h` flags for width and height setting respectivly
```
./compress_dir.sh ./input ./output -w 1280 -h 720
```

## download_hls.sh
Download HLS file via its link and store it in mp4 file
```
./download_hls.sh "http://foo/bar.m3u8" output.mp4
```

## convert_wmv.sh
Convert WMV files to MP4

## screenshots.sh
Make screenshots for input video

## image2video.sh
Make video from single frame

## get_part.sh
Get `-i` video part from selected second `-s` with `-d` duration time length.
The below script get part of the input video `input.mp4` from the `00:00:10` second with `00:00:20` seonds duration to the `output.mp4` file
```
./get_part.sh -i input.mp4 -s 00:00:10 -d 00:00:20 -o output.mp4
```

## rotate.sh
Rotate video 90 degrees clockwise

## video2gif.sh
Convert video to gif file
Get `-i` video file and take every `-f` frame from it and combine result frames with `-t` interval to the `-o` GIF file
```
./get_part.sh -i input.mp4 -f 30 -t 5 0o output.gif
```

## record.sh
Record video in file from webcam

## resize.sh
Set new size to the input video
```
./resize.sh -i input.mp4 -w 1280 -h 720 -o output.mp4
```

## resize_dir.sh
Set new size to the all files in input directory
```
./resize.sh -i ./input -w 1280 -h 720 -o ./output
```

## watermark.sh
Add watermark (watermark.png) on input video

## remove_audio.sh
Remove audio from input video

## get_duration.sh
Script returns input video duration

## merge_video_and_audio.sh
Merge video and audio files in one

## gif2video.sh
Make video from gif
```
./gif2video.sh input.gif output.mp4
```

## gif2video_dir.sh
Make video files from gif files in input directory
```
./gif2video_dir.sh input.gif output.mp4
```

## crop_video.sh
Crop video from fixed (X, Y) position
```
./crop_video.sh -i input.mp4 -x 100 -y 100 -o output.mp4
```

## make_hls.sh
Make HLS from input.mp4 video
```
./make_hls.sh -i input.mp4 -w 1280 -h 720
```

## youtube_2_mp3.sh
Download youtube video and retrieve the audio track and convert it to the mp3 file
```
./youtube_2_mp3.sh https://www.youtube.com/watch?v=100500 output.mp3
```
