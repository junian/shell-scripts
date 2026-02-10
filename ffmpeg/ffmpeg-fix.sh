#!/usr/env/bin bash

function ffmpeg-fix()
{
    INPUT_VIDEO="$1"
    TMP_DIR="$HOME/.tmp/ffmpeg"

    mkdir -p "$HOME/.tmp/ffmpeg/"
    TMP_FULL_PATH=$(mktemp "$TMP_DIR/tmp.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    TMP_OUTPUT="$TMP_FULL_PATH.mp4"

    ffmpeg -err_detect ignore_err -i "$INPUT_VIDEO" -c copy "$TMP_OUTPUT"

    mv "$TMP_OUTPUT" "$INPUT_VIDEO"
    rm "$TMP_FULL_PATH"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  ffmpeg-fix "$1"
fi
