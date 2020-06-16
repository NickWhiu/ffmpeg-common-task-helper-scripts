#!/bin/bash

# params
INPUT=$1
OUTPUT="${INPUT%.*}.b${BITRATE}.av1.mp4"
BITRATE=${2-500}

# convert to raw y4m (Large, GB's!). Fast.
ffmpeg-bar -i "$INPUT" -pix_fmt yuv420p "${INPUT}.y4m"

# encode to av1 inside ivf container. Slow.
rav1e -b $BITRATE "${INPUT}.y4m" -o "${INPUT}.ivf"

# swap to mp4 container. Instant.
ffmpeg-bar -i "${INPUT}.ivf" -c copy "$OUTPUT"

# remove intermediate formats
rm "${INPUT}.y4m"
rm "${INPUT}.ivf"
