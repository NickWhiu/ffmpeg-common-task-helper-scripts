#!/bin/bash

# params
INPUT=$1

# make thumbnail
extract-video-thumbnail-poster.sh "$INPUT"

#-s 512x288
# SIZE=384:216; SIZE=${2:-$SIZE};
# SIZE=512:288; SIZE=${2:-$SIZE};
SIZE=960:540; SIZE=${3:-$SIZE};
VF=scale=$SIZE:force_original_aspect_ratio=decrease,format=yuv420p,pad=$SIZE:-1:-1:color=black
BV=750k; BV=${2:-$BV};
# BA=128k
# AUDIO="-acodec aac -ac 1 -ar 16000 -r 13 -ab $BA"
AUDIO="-acodec aac"
# AUDIO="-acodec copy"
# -acodec aac -ac 1 -ar 16000 -r 13 -ab 32000

# -vf format=yuv420p

# pass 1
ffmpeg -i "$INPUT" -vf "$VF" -vcodec h264 -b:v "$BV" -profile:v baseline -tune film -preset veryslow -pass 1 -an -f null /dev/null -loglevel verbose && \
# pass 2
ffmpeg -i "$INPUT" -vf "$VF" -vcodec h264 -b:v "$BV" -profile:v baseline -tune film -preset veryslow -pass 2 $AUDIO "$INPUT.h264aac_.mp4" -loglevel verbose

# make streamable
MP4Box -add "$INPUT.h264aac_.mp4" -isma "$INPUT.h264aac.mp4"
# mp4box -inter 500 in.mp4 -out out.mp4

# cleanup
rm -f "$INPUT.h264aac_.mp4"
rm -f ffmpeg2pass-0.log ffmpeg2pass-0.log.mbtree

