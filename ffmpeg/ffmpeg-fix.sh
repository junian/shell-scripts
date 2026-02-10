#!/usr/bin/env bash

function ffmpeg-fix()
{
    INPUT_VIDEO="$1"
    
    # Check if input video is provided and not empty
    if [[ -z "$INPUT_VIDEO" ]]; then
        echo "Error: Input video file not specified" >&2
        return 1
    fi
    
    # Check if input video file exists
    if [[ ! -f "$INPUT_VIDEO" ]]; then
        echo "Error: Input video file does not exist: $INPUT_VIDEO" >&2
        return 1
    fi
    
    # Extract file extension from input video
    EXTENSION="${INPUT_VIDEO##*.}"
    
    TMP_DIR="$HOME/.tmp/ffmpeg"

    mkdir -p "$HOME/.tmp/ffmpeg/"
    TMP_FULL_PATH=$(mktemp "$TMP_DIR/tmp.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    TMP_OUTPUT="$TMP_FULL_PATH.$EXTENSION"

    ffmpeg -err_detect ignore_err -i "$INPUT_VIDEO" -c copy "$TMP_OUTPUT"

    mv "$TMP_OUTPUT" "$INPUT_VIDEO"
    rm "$TMP_FULL_PATH"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  ffmpeg-fix "$1"
fi
