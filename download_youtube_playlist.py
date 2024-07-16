#!/usr/bin/python

from pytube import Playlist
from pathlib import Path

import sys
import os

playlist_url = sys.argv[1]

# Retrieve URLs of videos from playlist
playlist = Playlist(playlist_url)
print('Number Of Videos In playlist: %s' % len(playlist.video_urls))

for url in playlist:
    file_name = os.popen('~/work/opensource/yt-dlp/2/yt-dlp/yt-dlp.sh --print filename %s' %url).read()
    name = Path(file_name).stem
    print("NAME '%s'" %url)
    os.system('~/work/opensource/yt-dlp/2/yt-dlp/yt-dlp.sh -f 140 %s' %url)
    os.system('~/work/opensource/yt-dlp/2/yt-dlp/yt-dlp.sh -f 136 %s' %url)
    # os.system('~/work/opensource/yt-dlp/2/yt-dlp/yt-dlp.sh -f 136 %s' %url)
    video_file_name = name + ".mp4"
    audio_file_name = name + ".m4a"
    output_file_name = name + "_out.mp4"
    os.system('ffmpeg -i "%s" -i "%s" -c:v copy -c:a aac "%s"' %(video_file_name, audio_file_name, output_file_name))
    os.remove(video_file_name)
    os.remove(audio_file_name)
