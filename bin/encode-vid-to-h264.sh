#!/bin/bash

# Guidance from https://evilmartians.com/chronicles/better-web-video-with-av1-codec. Thanks!

# params
INPUT=$1
QUALITY=${2-30}

# encode to h264 veryslow compression inside mp4 container. Decent speed.
ffmpeg-bar -i "$INPUT" -map_metadata -1 -c:v libx264 -crf $QUALITY -preset veryslow -profile:v main -pix_fmt yuv420p -movflags +faststart -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" "$INPUT.q$QUALITY.h264.mp4"