#!/usr/bin/env bash

if [ $# -ne 2 ]; then
  echo "Error: Exactly 2 parameters required (input file and output file)"
  return 1
fi

if [ ! -f "$1" ]; then
  echo "Error: Input file '$1' not found"
  return 1
fi

ffmpeg -i "$1" \
  -vf "split[original][copy]; \
       [copy]scale=-1:ih*16/9,crop=ih*9/16:ih,gblur=sigma=20[blurred]; \
       [blurred][original]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" \
  "$2"
