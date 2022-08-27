#!/bin/bash

# params
INPUT=$1

#-s 640x360
SIZE=640:360; SIZE=${2:-$SIZE};

ffmpeg-bar -i "$INPUT" -vf "scale=$SIZE:force_original_aspect_ratio=decrease,pad=$SIZE:-1:-1:color=black" -acodec aac -vcodec h264 "$INPUT.h264.mp4" -loglevel verbose
