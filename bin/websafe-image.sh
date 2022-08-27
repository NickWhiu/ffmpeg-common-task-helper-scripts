#!/bin/bash

# params
INPUT=$1
WIDTH=1200; WIDTH=${2:-$WIDTH};
FORMAT=webp; FORMAT=${3:-$FORMAT}

convert -resize $WIDTH "$INPUT" "$INPUT.$WIDTH.$FORMAT"


