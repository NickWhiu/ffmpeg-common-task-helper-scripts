#!/bin/bash
ffmpeg-bar -i "$1" -acodec libmp3lame -vn -stats -ab 64000 "$1.mp3"

