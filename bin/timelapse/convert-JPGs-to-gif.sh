#!/bin/bash

fps=${1:-8};
files="%06d.jpg"

echo "Converts [%06d.jpg] to timelapse.gif (run renumberJpgs to number them correctly as %06d.jpg)"

ffmpeg-bar -y -i $files -vf "fps=${fps}::q" -loop 0 "timelapse.gif"

