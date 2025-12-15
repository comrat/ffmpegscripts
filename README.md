# ffmpeg scripts
ffmpeg scripts collection

## compress.sh
Compress this single video file
* `-i|--input` - the input video file (required)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
* `-w|--width` - the required width of the output video, input video width is used by default (optional)
* `-h|--height` - the required height of the output video, input video height is used by default (optional)
```
./compress.sh -i input.mp4 -o output.mp4 -w 1280 -h 720
```

## compress_dir.sh
Compress all files in the input directory
* `-i|--input` - the input directory with video files (required)
* `-o|--output` - the output directory `./output` by default (optional)
* `-w|--width` - the required width of the output video, input video width is used by default (optional)
* `-h|--height` - the required height of the output video, input video height is used by default (optional)
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
Make single frame video from the input image
First argument for input image file. The second one is for file
* `-i|--input` - the input image file path (required)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
* `-d|--duration` - output video file duration, 30 seconds by default (optional)
```
./image2video.sh -i foo.jpg -o bar.mp4 -d 10
```

## get_part.sh
Get part of the input video from the specific timestamp and save it to another video file
* `-i|--input` - the input video file (required)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
* `-s|--start-time` - start time from the source video in "hh:mm:ss" format (optional)
* `-d|--duration` - output video file duration, 30 seconds by default (optional)
```
./get_part.sh -i input.mp4 -s 00:00:10 -d 00:00:20 -o output.mp4
```

## rotate.sh
Rotate video 90 degrees clockwise
* `-i|--input` - the input video file (required)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
```
./rotate.sh -i input.mp4 -o output.mp4
```

## video2gif.sh
Convert video into the gif file
Get `-i` video file and take every `-f` frame from it and combine result frames with `-t` interval to the `-o` GIF file
* `-i|--input` - the input video file (required)
* `-o|--output` - the output gif file `./output.gif` by default (optional)
* `-f|--frames` - frames for input video to devide, 5 frames is by default (optional)
* `-t|--time` - time delay for each output gif frame to wait, is 10 seconds by default (optional)
```
./video2gif.sh -i input.mp4 -f 30 -t 5 -o output.gif
```

## record.sh
Record video in the video file from the webcam.
* `-o|--output` - the output video file `./output.mp4` by default (optional)
* `-w|--width` - the required width of the output video 640 by default (optional)
* `-h|--height` - the required height of the output video 480 by default (optional)
```
./record.sh -w 640 -h 480 -o output.mp4
```

## watermark.sh
Add watermark (watermark.png) on input video. First argument is the input video file second output file the thord one - watermark image file
* `-i|--input` - the input video file (required)
* `-w|--watermark` - watermark image file `watermark.png` is by default (optional)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
```
./watermark.sh -i ./input.mp4 -o ./output.mp4 -w ./watermark.png
```

## remove_audio.sh
Remove audio from the input video
* `-i|--input` - the input video file (required)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
```
./remove_audio.sh -i ./input.mp4 -o ./output.mp4
```

## get_duration.sh
Retrieve the input video duration
* `-i|--input` - the input video file (required)
```
./get_duration.sh -i ./input.mp4
```

## video_plus_audio.sh
Merge video and audio files into the single one
* `-v|--video` - the input video file (required)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
```
./video_plus_audio.sh -v ./video.mp4 -a audio.m4a -o ./output.mp4
```

## gif2video.sh
Make video from gif
* `-i|--input` - the input gif file (required)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
```
./gif2video.sh -i input.gif -o output.mp4
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
* `-i|--input` - input youtube link to the desired video (required)
* `-o|--output` - the output audio file `./output.mp3` by default (optional)
* `-p|--proxy` - Use the specified HTTP/HTTPS/SOCKS proxy
```
./youtube2mp3.sh -i https://www.youtube.com/watch?v=100500 -o output.mp3 -p 'socks5://user:pass@127.0.0.1:1080/'
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

## download_hd_youtube.sh
Download youtube video (HD quality) and save it on device
* `-i|--input` - input youtube link to the desired video (required)
* `-o|--output` - the output video file `./output.mp4` by default (optional)
* `-p|--proxy` - Use the specified HTTP/HTTPS/SOCKS proxy
```
./download_hd_youtube.sh -i https://www.youtube.com/watch?v=100500 -o output.mp4 -p 'socks5://user:pass@127.0.0.1:1080/'
```
