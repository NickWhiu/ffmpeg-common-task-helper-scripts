#!/bin/bash

function usageHelp {
    echo "Usage:"
    echo "  crop-video.sh <src> <width> <height> <x> <y> [<crf_quality>]"
    echo
    echo "Output:"
    echo "  cropped.mp4"
    exit 1
}

# get cmd-line params
src=${1:-};
width=${2:-};
height=${3:-};
x=${4:-};
y=${5:-};
quality=${6:-30};

if [ -z "$src" ]; then
    usageHelp
fi

if [ -z $width ]; then
    usageHelp
fi

if [ -z $height ]; then
    usageHelp
fi

if [ -z $x ]; then
    usageHelp
fi

if [ -z $y ]; then
    usageHelp
fi

echo "Cropping ${src}.."
ffmpeg-bar -i "$src" -vf "crop=w=${width}:h=${height}:x=${x}:y=${y}" -c:v libx264 -crf $quality -c:a copy cropped.mp4