#!/usr/bin/python

from pytube import Playlist
from pathlib import Path

import sys
import os

playlist_url = sys.argv[1]
index = int(sys.argv[2]) if len(sys.argv) > 2 else 0

playlist = Playlist(playlist_url)
playlist_cut = playlist.video_urls[index:len(playlist.video_urls)]
print('Number Of Videos In playlist: %s' % len(playlist_cut))

for url in playlist_cut:
    file_name = os.popen('~/work/opensource/yt-dlp/2/yt-dlp/yt-dlp.sh --print filename %s' %url).read()
    name = Path(file_name).stem
    os.system('~/work/opensource/yt-dlp/2/yt-dlp/yt-dlp.sh -f 140 %s' %url)
    os.system('~/work/opensource/yt-dlp/2/yt-dlp/yt-dlp.sh -f 136 %s' %url)
    video_file_name = name + ".mp4"
    audio_file_name = name + ".m4a"
    output_file_name = name + "_out.mp4"
    os.system('ffmpeg -i "%s" -i "%s" -c:v copy -c:a aac "%s"' %(video_file_name, audio_file_name, output_file_name))
    os.remove(video_file_name)
    os.remove(audio_file_name)
