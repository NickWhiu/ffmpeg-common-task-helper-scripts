#!/bin/bash

# params
INPUT=$1

# make thumbnail
extract-video-thumbnail-poster.sh "$INPUT"

#-s 512x288
# SIZE=384:216; SIZE=${2:-$SIZE};
# SIZE=512:288; SIZE=${2:-$SIZE};
SIZE=640:360; SIZE=${2:-$SIZE};
VF=scale=$SIZE:force_original_aspect_ratio=decrease,pad=$SIZE:-1:-1:color=black
BV=500k
BA=16k
AUDIO=-acodec aac -ac 1 -ar 16000 -r 13 -ab "$BA"
# AUDIO=-acodec copy
#-acodec aac -ac 1 -ar 16000 -r 13 -ab 32000

ffmpeg -i "$INPUT" -vf "$VF" -vcodec h264 -b:v "$BV" -profile:v baseline -tune film -preset veryslow -pass 1 -an -f null /dev/null -loglevel verbose && \
ffmpeg -i "$INPUT" -vf "$VF" -vcodec h264 -b:v "$BV" -profile:v baseline -tune film -preset veryslow -pass 2 $AUDIO "$INPUT.h264aac.mp4" -loglevel verbose

# remove 2pass cache
rm -f ffmpeg2pass-0.log ffmpeg2pass-0.log.mbtree

