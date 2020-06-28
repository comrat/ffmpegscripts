# ffmpeg scripts
ffmpeg scripts collection

## compress.sh
Compress video single video.
First argument for input file and for output file the second one.
Use `-w` and `-h` flags for width and height setting respectivly
```
./compress input.mp4 output.mp4 -w 1280 -h 720
```

## compress_dir.sh
Compress all video from input folder file and save it in output folder.
First argument for input directory and for output directory the second one.
Use `-w` and `-h` flags for width and height setting respectivly
```
./compress_dir ./input ./output -w 1280 -h 720
```

## download_hls.sh
Download HLS file via its link and store it in mp4 file

## convert_wmv.sh
Convert WMV files to MP4

## screenshots.sh
Make screenshots for input video

## image2video.sh
Make video from single frame

## get_part.sh
Get video part from selected second to selected

## rotate.sh
Rotate video 90 degrees clockwise

## video2gif.sh
Convert video to gif file

## record.sh
Record video in file from webcam

## resize.sh
Set new size to the input video

## resize_dir.sh
Set new size to the all files in input directory

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
