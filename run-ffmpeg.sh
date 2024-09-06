#!/usr/bin/env sh

source ./env.sh && \
podman build -t tc-ffmpeg -f ffmpeg.containerfile cutter && \
podman run --rm -it --userns=keep-id -v $PWD/cutter:/app:z -v $VIDEOS_DIR:/videos:z tc-ffmpeg bash
