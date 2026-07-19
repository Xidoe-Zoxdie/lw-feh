#!/bin/bash

if ! [ -f "$1" ]; then
  echo "Input file does not exist."
  exit 1
fi

if [ -z "$2" ]; then
  echo "No output folder provided."
  exit 1
fi

TARGET_DIR="$(pwd)/$2"

mkdir -p "$TARGET_DIR"
rm -f "$TARGET_DIR"/*

# Using FFmpeg instead of GraphicsMagick
exec ffmpeg -i "$1" "$TARGET_DIR/frame-%d.png"
