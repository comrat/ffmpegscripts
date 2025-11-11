# ffmpeg scripts
ffmpeg scripts collection

## compress.sh
Compress this single video file
* `-i|--input` - the input video file (required)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
* `-w|--width` - the required width of the output video 1280 by default (optional)
* `-h|--height` - the required height of the output video 720 by default (optional)
```
./compress.sh -i input.mp4 -o output.mp4 -w 1280 -h 720
```

## compress_dir.sh
Compress all files in the input directory
* `-i|--input` - the input directory with video files (required)
* `-o|--output` - the output directory `./output` by default (optional)
* `-w|--width` - the required width of the output video 1280 by default (optional)
* `-h|--height` - the required height of the output video 720 by default (optional)
```
./compress_dir.sh -i ./input -o ./output -w 1280 -h 720
```

## download_hls.sh
Download remote HLS video to the local mp4 file
* `-i|--input` - the input HLS video URL (required)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
```
./download_hls.sh -i "http://foo/bar.m3u8" -o output.mp4
```

## screenshots.sh
Make screenshots from the input video file
* `-i|--input` - the input HLS video URL (required)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
* `-s|--seconds` time interval (10 sec is by default). The output images will be placed in the current directory
```
./screenshots.sh -i input.mp4 -s 30 -o ./output
```

## image2video.sh
Make single frame video from the input image.
First argument for input image file. The second one is for output video file.
Use `-d` flag to setup output video duration (30 sec. is by default)
```
./image2video.sh foo.jpg bar.mp4 -d 10
```

## get_part.sh
Get `-i` video part from selected second `-s` with `-d` duration time length.
The below script get part of the input video `input.mp4` from the `00:00:10` second with `00:00:20` seonds duration to the `output.mp4` file
```
./get_part.sh -i input.mp4 -s 00:00:10 -d 00:00:20 -o output.mp4
```

## rotate.sh
Rotate video 90 degrees clockwise. First argument is the input file and the second is the output file
```
./rotate.sh input.mp4 output.mp4
```

## video2gif.sh
Convert video to gif file
Get `-i` video file and take every `-f` frame from it and combine result frames with `-t` interval to the `-o` GIF file
```
./video2gif.sh -i input.mp4 -f 30 -t 5 0o output.gif
```

## record.sh
Record video in file from webcam. Single argument is the outut file
```
./record.sh output.mp4
```

## watermark.sh
Add watermark (watermark.png) on input video. First argument is the input video file second output file the thord one - watermark image file
```
./watermark.sh ./input.mp4 ./output.mp4 ./watermark.png
```

## remove_audio.sh
Remove audio from input video
```
```

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

## youtube2mp3.sh
Download youtube video and retrieve the audio track and convert it to the mp3 file
```
./youtube2mp3.sh https://www.youtube.com/watch?v=100500 output.mp3
```

## get_frames.sh
Get all frames from the input video file
```
./get_frames.sh https://www.youtube.com/watch?v=100500 output.mp3
```

## dir2mp3.sh
Combine all audio files from the input directory (use `-i` flag to provide the absolute path to this directory) into single mp3 file (use `-o` flag to setupt result file name `output.mp3` by default).
```
./dir2mp3.sh -i /home/username/audio_files/ -o output.mp3
```
