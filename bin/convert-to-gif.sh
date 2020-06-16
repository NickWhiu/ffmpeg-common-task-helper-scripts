#!/bin/bash

function usageHelp {
    echo "Usage:"
    echo "  convert-to-gif.sh <src> <fps>"
    echo
    echo "Output:"
    echo "  <src>.gif"
    exit 1
}

# get cmd-line params
src=${1:-};
fps=${2:-8};

if [ -z $src ]; then
    usageHelp
fi

echo "Converting ${src} to a gif with ${fps}fps"
ffmpeg-bar -i "$src" -vf "fps=${fps}::q" -loop 0 "$src.gif"