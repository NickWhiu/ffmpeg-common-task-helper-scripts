#!/bin/bash

# params
INPUT=$1

# make thumbnail
extract-video-thumbnail-poster.sh "$INPUT"

#-s 512x288
# SIZE=384:216; SIZE=${2:-$SIZE};
# SIZE=512:288; SIZE=${2:-$SIZE};
SIZE=960:540; SIZE=${3:-$SIZE};
VF=scale=$SIZE:force_original_aspect_ratio=decrease,pad=$SIZE:-1:-1:color=black
BV=800k; BV=${2:-$BV};
# AUDIO=-acodec copy
#-acodec aac -ac 1 -ar 16000 -r 13 -ab 32000

# ffmpeg -i input.mov -c:v libx264 -pix_fmt yuv420p -profile:v main -crf 1 -preset medium -c:a aac -movflags +faststart output.mp4


# pass 1
ffmpeg-bar -i "$INPUT" -vf "$VF" -vcodec libx264 -b:v "$BV" -pix_fmt yuv420p -profile:v baseline -tune film -preset veryslow -pass 1 -an -f null /dev/null -loglevel verbose && \
# pass 2
ffmpeg-bar -i "$INPUT" -vf "$VF" -vcodec libx264 -b:v "$BV" -pix_fmt yuv420p -profile:v baseline -tune film -preset veryslow -pass 2 -acodec aac "$INPUT.h264aac_.mp4" -loglevel verbose

# make streamable
MP4Box -add "$INPUT.h264aac_.mp4" -isma "$INPUT.h264aac.mp4"

# cleanup
rm -f "$INPUT.h264aac_.mp4"
rm -f ffmpeg2pass-0.log ffmpeg2pass-0.log.mbtree

