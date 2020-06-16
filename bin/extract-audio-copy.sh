#!/bin/bash
ffmpeg-bar -i "$1" -acodec copy -vn "$1.mp4"

