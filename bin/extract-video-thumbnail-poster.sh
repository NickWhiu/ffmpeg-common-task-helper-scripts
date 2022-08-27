#!/bin/bash

# params
INPUT=$1
TIME=00:00:00.000; TIME=${2:-$TIME};

ffmpeg-bar -i "$INPUT" -ss $TIME -vframes 1 "$INPUT.thumb.webp"



