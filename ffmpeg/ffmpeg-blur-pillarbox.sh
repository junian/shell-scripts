#!/usr/bin/env bash

function ffmpeg-blur-pillarbox() {
  if [ $# -ne 2 ]; then
    echo "Error: Exactly 2 parameters required (input file and output file)"
    return 1
  fi

  if [ ! -f "$1" ]; then
    echo "Error: Input file '$1' not found"
    return 1
  fi

  ffmpeg -i "$1" \
    -vf "
      split[original][copy];

      [copy]
        scale=ih*16/9:-1
       ,crop=h=iw*9/16
       ,gblur=sigma=20
      [copy];

      [copy][original]
      overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2
    " \
    "$2"
}

# Only execute if script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  ffmpeg-blur-pillarbox "$1" "$2"
fi
