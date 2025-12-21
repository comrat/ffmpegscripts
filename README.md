# ffmpeg scripts
Collection of ffmpeg scripts

## compress.sh
Compress a single video file
* `-i|--input` - the input video file (required)
* `-o|--output` - the output video file defaults to `./output.mp4` (optional)
* `-w|--width` - desired width of the output video, defaults to input video's width (optional)
* `-h|--height` - desired height of the output video; defaults to input video's height (optional)
```
./compress.sh -i input.mp4 -o output.mp4 -w 1280 -h 720
```

## compress_dir.sh
Compress all video files in a directory
* `-i|--input` - input directory with videos (required)
* `-o|--output` - output directory, defaults to `./output` (optional)
* `-w|--width` - desired width of output videos, defaults to input video's width (optional)
* `-h|--height` - desired height of output videos, defaults to input video's height (optional)
```
./compress_dir.sh -i ./input -o ./output -w 1280 -h 720
```

## download_hls.sh
Download remote HLS video to the local mp4 file
* `-i|--input` - HLS video URL (required)
* `-o|--output` - output video file, defaults to `./output.mp4` (optional)
```
./download_hls.sh -i "http://foo/bar.m3u8" -o output.mp4
```

## screenshots.sh
Make screenshots from the input video file
* `-i|--input` - input video URL (required)
* `-o|--output` - output filename, defaults to `./output` (optional)
* `-s|--seconds` - interval in seconds between screenshots, defaults to 10 seconds (optional)
```
./screenshots.sh -i input.mp4 -s 30 -o ./output
```

## image2video.sh
Create a video from a single image
* `-i|--input` - input image file path (required)
* `-o|--output` - the output video file, defaults to `./output.mp4` (optional)
* `-d|--duration` - duration in seconds, default is 30 seconds (optional)
```
./image2video.sh -i foo.jpg -o bar.mp4 -d 10
```

## get_part.sh
Extract a part of a video based on start time and duration
* `-i|--input` - input video file (required)
* `-o|--output` - output video file, defaults to `./output.mp4` (optional)
* `-s|--start-time` - start time in "hh:mm:ss" format (optional)
* `-d|--duration` - duration in seconds, default is 30 seconds (optional)
```
./get_part.sh -i input.mp4 -s 00:00:10 -d 00:00:20 -o output.mp4
```

## rotate.sh
Rotate video 90 degrees clockwise
* `-i|--input` - input video file (required)
* `-o|--output` - output video file, defaults to `./output.mp4` (optional)
```
./rotate.sh -i input.mp4 -o output.mp4
```

## video2gif.sh
Convert a video to a GIF
* `-i|--input` - input video file (required)
* `-o|--output` - output GIF file, defaults to `./output.gif` (optional)
* `-f|--frames` - number of frames to extract from the video, default is 5 (optional)
* `-t|--time` - delay time (in seconds) between GIF frames, default is 10 (optional)
```
./video2gif.sh -i input.mp4 -f 30 -t 5 -o output.gif
```

## record.sh
Record video from webcam
* `-o|--output` - output video file, defaults to `./output.mp4` (optional)
* `-w|--width` - width of the recording, default is 640 (optional)
* `-h|--height` - height of the recording, default is 480 (optional)
```
./record.sh -w 640 -h 480 -o output.mp4
```

## watermark.sh
Add a watermark image to a video
* `-i|--input` - input video file (required)
* `-w|--watermark` - watermark image file, default is `watermark.png` (optional)
* `-o|--output` - output video file, defaults to `./output.mp4` (optional)
```
./watermark.sh -i ./input.mp4 -o ./output.mp4 -w ./watermark.png
```

## remove_audio.sh
Remove audio track from a video
* `-i|--input` - input video file (required)
* `-o|--output` - output video file, defaults to `./output.mp4` (optional)
```
./remove_audio.sh -i ./input.mp4 -o ./output.mp4
```

## get_duration.sh
Retrieve the duration of a video
* `-i|--input` - input video file (required)
```
./get_duration.sh -i ./input.mp4
```

## video_plus_audio.sh
Merge a video and audio file into a single video
* `-v|--video` - input video file (required)
* `-a|--audio` - input audio file (required)
* `-o|--output` - output video file, defaults to `./output.mp4` (optional)
```
./video_plus_audio.sh -v ./video.mp4 -a audio.m4a -o ./output.mp4
```

## gif2video.sh
Convert a GIF to a video
* `-i|--input` - input GIF file (required)
* `-o|--output` - output video file, defaults to `./output.mp4` (optional)
```
./gif2video.sh -i input.gif -o output.mp4
```

## crop_video.sh
Crop a video from a fixed (X, Y) position
* `-i|--input` - input video file (required)
* `-o|--output` - output video file, defaults to `./output.mp4` (optional)
* `-x|--x` - X coordinate in pixels, default is 0 (optional)
* `-y|--y` - Y coordinate in pixels, default is 0 (optional)
```
./crop_video.sh -i input.mp4 -x 100 -y 100 -o output.mp4
```

## make_hls.sh
Create HLS stream from input video
* `-i|--input` - input video file (required)
* `-w|--width` - output video width, default is 1280 (optional)
* `-h|--height` - output video height, default is 720 (optional)
* `-s|--seconds` - segment duration in seconds, default is 10 (optional)
```
./make_hls.sh -i input.mp4 -w 1280 -h 720 -s 10
```

## youtube2mp3.sh
Download a YouTube video and extract & convert its audio to MP3
* `-i|--input` - YouTube link (required)
* `-o|--output` - output audio file, defaults to `./output.mp3` (optional)
* `-p|--proxy` - optional proxy server (HTTP/HTTPS/SOCKS)
```
./youtube2mp3.sh -i https://www.youtube.com/watch?v=100500 -o output.mp3 -p 'socks5://user:pass@127.0.0.1:1080/'
```

## get_frames.sh
Extract all frames from a video file
* `-i|--input` - input video file (required)
* `-o|--output` - output directory for frames, defaults to `output` directory (optional)
```
./get_frames.sh -i input.mp4 -o output
```

## dir2mp3.sh
Concatenate all audio files in a directory into a single MP3 file
* `-i|--input` - input directory (required)
* `-o|--output` - output audio file, defaults to `./output.mp3` (optional)
```
./dir2mp3.sh -i /home/username/audio_files/ -o output.mp3
```

## download_hd_youtube.sh
Download YouTube video in HD quality and save to device
* `-i|--input` - input youtube link to the desired video (required)
* `-o|--output` - output video file, defaults to `./output.mp4` (optional)
* `-p|--proxy` - optional proxy server (HTTP/HTTPS/SOCKS)
```
./download_hd_youtube.sh -i https://www.youtube.com/watch?v=100500 -o output.mp4 -p 'socks5://user:pass@127.0.0.1:1080/'
```
