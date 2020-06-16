#!/bin/bash

input=$1
secs=$(($2*60))
output=$3

ffmpeg-bar -i $input -t $secs $output
