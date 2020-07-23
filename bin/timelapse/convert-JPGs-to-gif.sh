#!/bin/bash

function usageHelp {
    echo "Converts [%06d.jpg] (e.g. 000000.jpg-999999.jpg) to timelapse.gif"
    echo "(run renumberJpgs to number them correctly as %06d.jpg)"
    echo
    echo "Usage:"
    echo "  convert-to-gif.sh <fps>"
    echo
    echo "Output:"
    echo "  timelapse.gif"
    exit 1
}

fps=${1:-};
files="%06d.jpg"
opts=""
#opts="-vf scale=480x240"

if [ -z $fps ]; then
    usageHelp
fi

ffmpeg-bar -f image2 -y -i $files $opts -framerate $fps "timelapse.gif"

