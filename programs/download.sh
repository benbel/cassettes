#!/usr/bin/env bash

# python -m pip install --upgrade youtube_dl
pip install --upgrade --force-reinstall "git+https://github.com/ytdl-org/youtube-dl.git"

python -m youtube_dl -i -f bestaudio --extract-audio --audio-format vorbis --audio-quality 0 --yes-playlist -o "./output/%(title)s.%(ext)s" "PLVixfvPwDZUmf9eXxkJHjAsSgeDxIyTRx" --playlist-items 1

for file in ./output/*.ogg; do mv -i "$file" "${file/- Bibliothèque de l\'Aventure.ogg/.ogg}"; done

for file in ./output/*.ogg; do mv -i "$file" "${file/ .ogg/.ogg}"; done
