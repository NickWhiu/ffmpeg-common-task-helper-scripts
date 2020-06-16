#!/bin/bash
ffmpeg-bar -i "$1" -acodec libmp3lame -vn -stats "$1.mp3"

