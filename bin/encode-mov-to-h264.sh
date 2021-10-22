#!/bin/bash

# params
INPUT=$1

ffmpeg-bar -i "$INPUT" -vcodec h264 -acodec mp2 "$INPUT.h264.mp4"
