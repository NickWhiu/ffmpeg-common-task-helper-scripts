#!/bin/bash
# inspired from https://duxyng.wordpress.com/2013/04/07/rotateflip-video-with-ffmpeg/

ffmpeg-bar -i "$1" -vf "hflip" -acodec copy "hflip_$1"
