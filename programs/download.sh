#!/usr/bin/env bash

python -m pip install --upgrade youtube_dl

python -m youtube_dl --sleep-interval 45 -i -f bestaudio --extract-audio --audio-format vorbis --audio-quality 0 --yes-playlist -o "./output/%(title)s.%(ext)s" "PLVixfvPwDZUmf9eXxkJHjAsSgeDxIyTRx" --playlist-end 2

for file in ./output/*.ogg; do mv "$file" "${file/ - Bibliothèque de l\'Aventure.ogg/.ogg}"; done

