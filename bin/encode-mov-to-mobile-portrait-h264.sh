#!/bin/bash

# params
INPUT=$1

# make thumbnail
extract-video-thumbnail-poster.sh "$INPUT"


#-s 512x288
# SIZE=384:216; SIZE=${3:-$SIZE};
# SIZE=512:288; SIZE=${3:-$SIZE};
SIZE=540:960; SIZE=${3:-$SIZE};
VF=scale=$SIZE:force_original_aspect_ratio=decrease,pad=$SIZE:-1:-1:color=black
BV=1000k; BV=${2:-$BV};
BA=32k
#AUDIO=aac -ac 1 -ar 16000 -r 13 -ab "$BA"
# AUDIO=copy
#-acodec aac -ac 1 -ar 16000 -r 13 -ab 32000

# pass 1
ffmpeg-bar -i "$INPUT" -vf "$VF" -vcodec h264 -b:v "$BV" -profile:v baseline -tune film -preset veryslow -pass 1 -an -f null /dev/null -loglevel verbose && \
# pass 2
ffmpeg-bar -i "$INPUT" -vf "$VF" -vcodec h264 -b:v "$BV" -profile:v baseline -tune film -preset veryslow -pass 2 -acodec aac -ac 1 -ar 32000 -ab "$BA" "$INPUT.h264aac_.mp4" -loglevel verbose

# make streamable
MP4Box -add "$INPUT.h264aac_.mp4" -isma "$INPUT.h264aac.mp4"

# cleanup
rm -f "$INPUT.h264aac_.mp4"
rm -f ffmpeg2pass-0.log ffmpeg2pass-0.log.mbtree
