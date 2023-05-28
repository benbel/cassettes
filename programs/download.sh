#!/usr/bin/env bash

# python -m pip install --upgrade youtube_dl
pip install --upgrade --force-reinstall "git+https://github.com/ytdl-org/youtube-dl.git"

python -m youtube_dl -i -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --yes-playlist -o "./output/%(title)s.%(ext)s" "PLVixfvPwDZUmf9eXxkJHjAsSgeDxIyTRx" --playlist-start 38

for file in ./output/*.mp3; do mv -f "$file" "${file/- Bibliothèque de l\'Aventure.mp3/.mp3}"; done

for file in ./output/*.mp3; do mv -f "$file" "${file/ .mp3/.mp3}"; done
